//
//  BookSummaryTCAApp.swift
//  BookSummaryTCA
//
//  Created by Taras Tarasenko on 31.07.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        SummaryDetailsScreen(store: .init(initialState: .init(), reducer: {
            PlayerFeature()
        }))
    }
}


@main
struct BookSummaryTCAApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
