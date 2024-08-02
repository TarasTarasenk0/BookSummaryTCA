//
//  TimeConverterExtension.swift
//  BookSummaryTCA
//
//  Created by Taras Tarasenko on 01.08.2024.
//

import Foundation

extension Double {
    func toMinutesSeconds() -> String {
        let minutes = Int(self) / 60
        let seconds = Int(self) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
