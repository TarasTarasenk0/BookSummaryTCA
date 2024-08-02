//
//  PlayerFeature.swift
//  BookSummaryTCA
//
//  Created by Taras Tarasenko on 02.08.2024.
//

import SwiftUI
import AVFoundation
import ComposableArchitecture

public enum AudioSpeed {
    case normal
    case medium
    case high
    
    var value: Float {
        switch self {
        case .normal:
            return 1.0
        case .medium:
            return 1.5
        case .high:
            return 2.0
        }
    }
}

public struct PlayerFeature: Reducer {
    
    //MARK: - State
    public struct State: Equatable {
        var isPlaying = false
        var currentTime: Double = 0
        var duration: Double = 0
        var audioPlayer: AVAudioPlayer?
        var audioSpeed: AudioSpeed = .normal
    }
    
    //MARK: - Action
    public enum Action: Equatable {
        case playPauseButtonTapped
        case sliderValueChanged(Double)
        case updateCurrentTime(Double)
        case updateDuration(Double)
        case setPlayer(AVAudioPlayer)
        case updateSpeed
    }
    
    
    
    public var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .playPauseButtonTapped:
                if state.isPlaying {
                    state.audioPlayer?.pause()
                } else {
                    state.audioPlayer?.play()
                }
                state.isPlaying.toggle()
                return .none
                
            case .sliderValueChanged(let value):
                state.audioPlayer?.currentTime = value
                state.currentTime = value
                return .none
                
            case .updateCurrentTime(let currentTime):
                state.currentTime = currentTime
                return .none
                
            case .updateDuration(let duration):
                state.duration = duration
                return .none
            case .setPlayer(let player):
                state.audioPlayer = player
                return .none
            case .updateSpeed:
                switch state.audioSpeed {
                case .normal:
                    state.audioSpeed = AudioSpeed.medium
                case .medium:
                    state.audioSpeed = AudioSpeed.high
                case .high:
                    state.audioSpeed = AudioSpeed.normal
                    
                }
                state.audioPlayer?.rate = state.audioSpeed.value
                return .none
            }
        }
    }
}
