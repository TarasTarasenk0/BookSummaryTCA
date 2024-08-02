//
//  StringWithoutZeroFractionTests.swift
//  BookSummaryTCATests
//
//  Created by Taras Tarasenko on 02.08.2024.
//

import XCTest
@testable import BookSummaryTCA

class StringWithoutZeroFractionTests: XCTestCase {

    func testStringWithoutZeroFraction() {
        // Test case where the float has no fractional part
        let noFractionFloat: Float = 1.0
        XCTAssertEqual(noFractionFloat.stringWithoutZeroFraction, "1")
        
        // Test case where the float has a fractional part
        let fractionFloat: Float = 1.5
        XCTAssertEqual(fractionFloat.stringWithoutZeroFraction, "1.5")
        
        // Test case with negative floats
        let negativeFloat: Float = -1.0
        XCTAssertEqual(negativeFloat.stringWithoutZeroFraction, "-1")
        
        // Edge case with a very small fractional part
        let verySmallFractionalFloat: Float = 0.000001
        XCTAssertEqual(verySmallFractionalFloat.stringWithoutZeroFraction, "0.000001")
    }
}


