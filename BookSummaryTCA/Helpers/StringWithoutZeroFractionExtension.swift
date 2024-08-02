//
//  StringWithoutZeroFractionExtension.swift
//  BookSummaryTCA
//
//  Created by Taras Tarasenko on 01.08.2024.
//

import Foundation

extension Float {
    var stringWithoutZeroFraction: String {
        return truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
