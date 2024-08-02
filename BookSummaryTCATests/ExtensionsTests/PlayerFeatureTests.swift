//
//  PlayerFeatureTests.swift
//  BookSummaryTCATests
//
//  Created by Taras Tarasenko on 02.08.2024.
//

import XCTest
import ComposableArchitecture
import AVFoundation

@testable import BookSummaryTCA

@MainActor
class PlayerFeatureTests: XCTestCase {
    
    // Define a mock AVAudioPlayer class for testing purposes
    class MockAudioPlayer: AVAudioPlayer {
        var playCalled = false
        var pauseCalled = false
        func play() {
            playCalled = true
        }
        override func pause() {
            pauseCalled = true
        }
    }
    
    func testPlayPauseButtonTapped() async {
        let mockPlayer = MockAudioPlayer()
        let store = TestStore.init(initialState: PlayerFeature.State(audioPlayer: mockPlayer), reducer: {
            PlayerFeature()
        })
        
        await store.send(.playPauseButtonTapped) {
            $0.isPlaying = true
        }
        XCTAssertTrue(store.state.isPlaying)
        
        
        await store.send(.playPauseButtonTapped) {
            $0.isPlaying = false
        }
        XCTAssertFalse(store.state.isPlaying)
        
    }
    
    func testSliderValueChanged() async {
        let mockPlayer = MockAudioPlayer()
        let store = TestStore.init(initialState: PlayerFeature.State(audioPlayer: mockPlayer), reducer: {
            PlayerFeature()
        })
        
        await store.send(.sliderValueChanged(30)) {
            $0.currentTime = 30
        }
        XCTAssertEqual(store.state.currentTime, 30)
        
    }
    
    func testUpdateCurrentTime() async {
        let store = TestStore.init(initialState: PlayerFeature.State(currentTime: 0), reducer: {
            PlayerFeature()
        })
        
        await store.send(.updateCurrentTime(45)) {
            $0.currentTime = 45
            
        }
        XCTAssertEqual(store.state.currentTime, 45)
    }
    
    func testUpdateDuration() async {
        let store = TestStore.init(initialState: PlayerFeature.State(currentTime: 0), reducer: {
            PlayerFeature()
        })
        
        await store.send(.updateDuration(90)) {
            $0.duration = 90
        }
        XCTAssertEqual(store.state.duration, 90)
    }
    
    func testSetPlayer() async {
        let mockPlayer = MockAudioPlayer()
        let store = TestStore.init(initialState: PlayerFeature.State(audioPlayer: nil), reducer: {
            PlayerFeature()
        })
        
        await store.send(.setPlayer(mockPlayer))
        XCTAssertEqual(store.state.audioPlayer, mockPlayer)
    }
    
    func testUpdateSpeed() async {
        let mockPlayer = MockAudioPlayer()
        let store = TestStore.init(initialState: PlayerFeature.State(audioPlayer: mockPlayer, audioSpeed: .normal), reducer: {
            PlayerFeature()
        })
        
        await store.send(.updateSpeed) {
            $0.audioSpeed = .medium
        }
        XCTAssertEqual(store.state.audioSpeed.value, AudioSpeed.medium.value)
        
        
        await store.send(.updateSpeed) {
            $0.audioSpeed = .high
        }
        XCTAssertEqual(store.state.audioSpeed.value, AudioSpeed.high.value)
        
        
        await store.send(.updateSpeed) {
            $0.audioSpeed = .normal
        }
        XCTAssertEqual(store.state.audioSpeed.value, AudioSpeed.normal.value)
        
    }
}

