//
//  DoubleToTimeTests.swift
//  BookSummaryTCATests
//
//  Created by Taras Tarasenko on 02.08.2024.
//

import XCTest
@testable import BookSummaryTCA

class DoubleToTimeTests: XCTestCase {

    func testToMinutesSeconds() {
        // Test cases for different input values and expected outputs
        XCTAssertEqual(125.0.toMinutesSeconds(), "02:05", "125 seconds should be 02:05")
        XCTAssertEqual(59.0.toMinutesSeconds(), "00:59", "59 seconds should be 00:59")
        XCTAssertEqual(60.0.toMinutesSeconds(), "01:00", "60 seconds should be 01:00")
        XCTAssertEqual(0.0.toMinutesSeconds(), "00:00", "0 seconds should be 00:00")
        XCTAssertEqual(3600.0.toMinutesSeconds(), "60:00", "3600 seconds should be 60:00")
        XCTAssertEqual(3661.0.toMinutesSeconds(), "61:01", "3661 seconds should be 61:01")
    }
}
