//
//  File.swift
//  
//
//  Created by Pedro  on 9/7/24.
//

import Foundation
import AVFAudio

final class AudioTime {
    var at: AVAudioTime {
        let now = AVAudioTime(sampleTime: sampleTime, atRate: sampleRate)
        guard let anchorTime else {
            return now
        }
        return now.extrapolateTime(fromAnchor: anchorTime) ?? now
    }

    var hasAnchor: Bool {
        return anchorTime != nil
    }

    private var sampleRate: Double = 0.0
    private var anchorTime: AVAudioTime?
    private var sampleTime: AVAudioFramePosition = 0

    func advanced(_ count: AVAudioFramePosition) {
        sampleTime += count
    }

    func anchor(_ time: CMTime, sampleRate: Double) {
        guard anchorTime == nil else {
            return
        }
        self.sampleRate = sampleRate
        if time.timescale == Int32(sampleRate) {
            sampleTime = time.value
        } else {
            // ReplayKit .appAudio
            sampleTime = Int64(Double(time.value) * sampleRate / Double(time.timescale))
        }
        anchorTime = .init(hostTime: AVAudioTime.hostTime(forSeconds: time.seconds), sampleTime: sampleTime, atRate: sampleRate)
    }

    func reset() {
        sampleRate = 0.0
        sampleTime = 0
        anchorTime = nil
    }
}
