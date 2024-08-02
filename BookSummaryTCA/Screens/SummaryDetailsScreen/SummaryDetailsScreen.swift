//
//  ContentView.swift
//  BookSummaryTCA
//
//  Created by Taras Tarasenko on 31.07.2024.
//

import SwiftUI
import ComposableArchitecture
import AVFoundation

struct SummaryDetailsScreen: View {
    private let store: StoreOf<PlayerFeature>
    
    @State private var chapterNumber = 1
    @State private var showTextScreen = false
    
    init(store: StoreOf<PlayerFeature>) {
        self.store = store
    }
    
    var body: some View {
        WithViewStore(store) { $0 }
    content: { viewStore in
        VStack {
            if showTextScreen {
                ScrollView {
                    Text(AppConstants.summaryInfo.fullText)
                }
                Spacer()
            } else {
                Image(AppConstants.summaryInfo.image)
                    .resizable()
                    .aspectRatio(2/3, contentMode: .fit)
                    .shadow(radius: 4)
                    .padding()
                
                VStack {
                    Text("Key point \(chapterNumber) of \(AppConstants.summaryInfo.chapterDetails.count)".uppercased())
                        .foregroundStyle(.gray)
                        .padding(.bottom, AppConstants.standartPadding)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 12, weight: .bold))
                    
                    Text(AppConstants.summaryInfo.chapterDetails[chapterNumber - 1].keyPoint)
                        .padding(.bottom, AppConstants.standartPadding)
                        .font(.system(size: 14, weight: .regular))
                    
                    
                    
                    PlayerControlsView(viewStore: viewStore, chapterNumber: $chapterNumber)
                    
                    Spacer()
                    
                }
            }
            ToggleButton(isOn: $showTextScreen)
            
            Spacer()
        }
        .padding(.horizontal)
        .onAppear {
            setUpOnAppear(viewStore: viewStore)
        }
    }
    }
    
    private func setUpOnAppear(viewStore: ViewStore<PlayerFeature.State, PlayerFeature.Action>) {
        guard let url = Bundle.main.url(forResource: AppConstants.summaryInfo.fileName, withExtension: AppConstants.summaryInfo.fileType) else { return print("URL parse error") }
        guard let audioPlayer = try? AVAudioPlayer(contentsOf: url) else { return print("audio player error") }
        
        audioPlayer.volume = 5
        audioPlayer.currentTime = 0
        audioPlayer.enableRate = true
        audioPlayer.prepareToPlay()
        
        viewStore.send(.setPlayer(audioPlayer))
        viewStore.send(.updateDuration(audioPlayer.duration))
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            if audioPlayer.isPlaying {
                updateChapterNumber(viewStore: viewStore)
                viewStore.send(.updateCurrentTime(audioPlayer.currentTime))
            }
            
        }
    }
    
    private func updateChapterNumber(viewStore: ViewStore<PlayerFeature.State, PlayerFeature.Action>) {
        
        if viewStore.currentTime > AppConstants.summaryInfo.chapterDetails[chapterNumber - 1].time && chapterNumber < AppConstants.summaryInfo.chapterDetails.count {
            chapterNumber += 1
        }
        
        if viewStore.currentTime == 0 || viewStore.currentTime == viewStore.duration {
            chapterNumber = 1
            
        }
        
        if viewStore.currentTime < AppConstants.summaryInfo.chapterDetails[chapterNumber - 1].time && chapterNumber > 1 {
            chapterNumber -= 1
        }
    }
}
