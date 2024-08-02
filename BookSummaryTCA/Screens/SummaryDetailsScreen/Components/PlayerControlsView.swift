//
//  PlayerControlsView.swift
//  BookSummaryTCA
//
//  Created by Taras Tarasenko on 02.08.2024.
//

import SwiftUI
import Combine
import ComposableArchitecture

struct PlayerControlsView: View {
    @ObservedObject var viewStore: ViewStore<PlayerFeature.State, PlayerFeature.Action>
    @Binding var chapterNumber: Int
    
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                Text(viewStore.currentTime.toMinutesSeconds())
                    .frame(width: 60)
                Slider(value: viewStore.binding(
                    get: \.currentTime,
                    send: { currentTime in
                        updateChapterNumber(currentTime: currentTime)
                        return PlayerFeature.Action.sliderValueChanged(currentTime)
                    }
                ), in: 0...viewStore.duration)
                .padding(.horizontal)
                Text(viewStore.duration.toMinutesSeconds())
            }
            .foregroundStyle(.gray)
            .font(.system(size: 12, weight: .regular))
            
            Button(action: {
                viewStore.send(.updateSpeed)
            }) {
                Text("Speed x" + viewStore.audioSpeed.value.stringWithoutZeroFraction)
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(6)
                    .font(.system(size: 12, weight: .bold))
                    .foregroundStyle(.black)
            }
            .padding(.vertical, AppConstants.standartPadding)
            
            HStack {
                Button(action: {
                    if chapterNumber > 1 {
                        chapterNumber -= 1
                    }
                    viewStore.send(.sliderValueChanged(AppConstants.summaryInfo.chapterDetails[chapterNumber - 1].time))
                    
                }) {
                    Image(systemName: "backward.end.fill")
                        .resizable()
                        .frame(width: AppConstants.imageSize, height: AppConstants.imageSize)
                }
                .padding()
                
                Button(action: {
                    viewStore.send(.sliderValueChanged(max(viewStore.currentTime - AppConstants.secondsbackward, 0)))
                    updateChapterNumber(currentTime: viewStore.currentTime)
                }) {
                    Image(systemName: "gobackward.5")
                        .resizable()
                        .frame(width: AppConstants.imageSize, height: AppConstants.imageSize)
                }
                .padding()
                
                Button(action: {
                    viewStore.send(.playPauseButtonTapped)
                }) {
                    Image(systemName: viewStore.isPlaying ? "pause.fill" : "play.fill")
                        .resizable()
                        .frame(width: AppConstants.imageSize, height: AppConstants.imageSize)
                }
                .padding()
                
                Button(action: {
                    viewStore.send(.sliderValueChanged(min(viewStore.currentTime + AppConstants.secondsForward, viewStore.duration)))
                    updateChapterNumber(currentTime: viewStore.currentTime)
                }) {
                    Image(systemName: "goforward.10")
                        .resizable()
                        .frame(width: AppConstants.imageSize, height: AppConstants.imageSize)
                }
                .padding()
                
                Button(action: {
                    if chapterNumber < AppConstants.summaryInfo.chapterDetails.count {
                        chapterNumber += 1
                        viewStore.send(.sliderValueChanged(AppConstants.summaryInfo.chapterDetails[chapterNumber - 1].time))
                    } else {
                        viewStore.send(.sliderValueChanged(viewStore.duration))
                        //Or perform moving on to the next book
                    }
                }) {
                    Image(systemName: "forward.end.fill")
                        .resizable()
                        .frame(width: AppConstants.imageSize, height: AppConstants.imageSize)
                }
                .padding()
            }
            .foregroundStyle(.black)
        }
    }
    
    private func updateChapterNumber(currentTime: Double) {
        
        if currentTime > AppConstants.summaryInfo.chapterDetails[chapterNumber - 1].time && chapterNumber < AppConstants.summaryInfo.chapterDetails.count {
            chapterNumber += 1
        }
        
        if currentTime == 0 {
            chapterNumber = 1
            
        }
        
        if currentTime < AppConstants.summaryInfo.chapterDetails[chapterNumber - 1].time && chapterNumber > 1 {
            chapterNumber -= 1
        }
    }
}
