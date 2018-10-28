//
//  LUUIDTests.swift
//  LUUIDTests
//
//  Created by Benjamin Asher on 10/26/18.
//  Copyright © 2018 benasher44. All rights reserved.
//

import XCTest
@testable import LUUID

class LUUIDTests: XCTestCase {

    func testInitFromUUIDT() {
        let uuidU = UUID()
        let uuidL = LUUID(uuid: uuidU.uuid)
        verifyUUIDs(uuidL, uuidU)
    }

    func testInitFromUUIDString() {
        let uuidU = UUID()
        verifyUUIDs(LUUID(uuidString: uuidU.uuidString)!, uuidU)
        verifyUUIDs(LUUID(uuidString: uuidU.uuidString.lowercased())!, uuidU)
    }

    func testUUIDAndLUUIDPropsEquality() {
        let uuidL = LUUID()
        let uuidU = UUID(uuid: uuidL.uuid)
        verifyUUIDs(uuidL, uuidU)
        XCTAssertNotEqual(uuidU.hashValue, uuidL.hashValue)
        XCTAssertEqual(uuidU.description.lowercased(), uuidL.description)
        XCTAssertEqual(uuidU.debugDescription.lowercased(), uuidL.debugDescription)
    }

    func testUUIDStringLowercase() {
        let uuidL = LUUID()
        let uuidStr = uuidL.uuidString
        XCTAssertEqual(uuidStr.count, 36)
        XCTAssertEqual(uuidStr.lowercased(), uuidStr)
    }

    func testLUUIDEquatable() {
        let uuid1 = LUUID()
        let uuid2 = LUUID(uuid: uuid1.uuid)
        XCTAssertEqual(uuid1, uuid2)
        XCTAssertEqual(uuid1.hashValue, uuid2.hashValue)
    }

    func testSerializeFromUUIDViaJson() {
        let uuidU = UUID()
        let jsonData = try! JSONEncoder().encode(["test": uuidU])
        let deserializedJson = try! JSONDecoder().decode([String: LUUID].self, from: jsonData)
        let uuidL = deserializedJson["test"]!
        verifyUUIDs(uuidL, uuidU)
    }

    func testSerializeToUUIDViaJson() {
        let uuidL = LUUID()
        let jsonData = try! JSONEncoder().encode(["test": uuidL])
        let deserializedJson = try! JSONDecoder().decode([String: UUID].self, from: jsonData)
        let uuidU = deserializedJson["test"]!
        verifyUUIDs(uuidL, uuidU)
    }

    func testSerializeToJsonLowercase() {
        let uuidL = LUUID()
        let jsonData = try! JSONEncoder().encode(["test": uuidL])
        let jsonString = String(data: jsonData, encoding: .utf8)!
        XCTAssertEqual(jsonString, "{\"test\":\"\(uuidL.uuidString)\"}")
    }
}

extension LUUIDTests {
    func verifyUUIDs(
        _ uuidL: LUUID,
        _ uuidU: UUID,
        file: StaticString = #file,
        line: UInt = #line
    ) {
        // Verify that string output is the same
        XCTAssertEqual(uuidL.uuidString, uuidU.uuidString.lowercased(), file: file, line: line)

        // Verify that uuid bytes are the same
        withUnsafeBytes(of: uuidL.uuid) { lBytes in
            withUnsafeBytes(of: uuidU.uuid) { uBytes in
                for (lByte, uByte) in zip(lBytes, uBytes) {
                    XCTAssertEqual(lByte, uByte, file: file, line: line)
                }
            }
        }
    }
}
