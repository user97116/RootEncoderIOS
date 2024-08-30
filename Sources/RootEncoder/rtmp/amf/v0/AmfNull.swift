//
// Created by Pedro  on 24/4/22.
// Copyright (c) 2022 pedroSG94. All rights reserved.
//
// Contain an empty body
//

import Foundation

public class AmfNull: AmfData, CustomStringConvertible {

    public override func readBody(buffer: inout [UInt8]) throws {
    }

    public override func writeBody() -> [UInt8] {
        [UInt8]()
    }

    public override func getType() -> AmfType {
        AmfType.NULL
    }

    public override func getSize() -> Int {
        0
    }

    public var description: String {
        "AmfNull()"
    }
}
