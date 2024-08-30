//
// Created by Pedro  on 16/7/22.
// Copyright (c) 2022 pedroSG94. All rights reserved.
//

import Foundation

public class Aggregate: RtmpMessage {

    public init() {
        super.init(basicHeader: BasicHeader(chunkType: ChunkType.TYPE_0, chunkStreamId: Int(ChunkStreamId.PROTOCOL_CONTROL.rawValue)))
    }

    override func readBody(body: inout [UInt8]) throws {
        //TODO Not yet implemented
    }

    override func storeBody() -> [UInt8] {
        //TODO Not yet implemented
        return [UInt8]()
    }

    override func getType() -> MessageType {
        MessageType.AGGREGATE
    }

    override func getSize() -> Int {
        //TODO Not yet implemented
        0
    }

    public override var description: String {
        "Aggregate()"
    }
}
