//
//  ToggleButtonView.swift
//  BookSummaryTCA
//
//  Created by Taras Tarasenko on 02.08.2024.
//

import SwiftUI

struct ToggleButton: View {
    @Binding var isOn: Bool
    
    var body: some View {
        ZStack {
            Capsule()
                .fill(Color.white)
                .overlay(
                    Capsule()
                        .stroke(Color.gray.opacity(0.5), lineWidth: 2)
                )
                .frame(height: AppConstants.toggleSize)
            
            HStack {
                Image(systemName: "headphones")
                    .foregroundColor(isOn ? .black : .white)
                    .frame(width: AppConstants.toggleSize, height: AppConstants.toggleSize)
                    .background(Circle().fill(isOn ? Color.clear : Color.blue))
                    .onTapGesture {
                        withAnimation {
                            isOn = false
                        }
                    }
                
                Spacer()
                
                Image(systemName: "list.bullet")
                    .foregroundColor(isOn ? .white : .black)
                    .frame(width: AppConstants.toggleSize, height: AppConstants.toggleSize)
                    .background(Circle().fill(isOn ? Color.blue : Color.clear))
                    .onTapGesture {
                        withAnimation {
                            isOn = true
                        }
                    }
            }
            
            HStack {
                if isOn {
                    Spacer()
                }
                Image(systemName: isOn ? "list.bullet" : "headphones")
                    .foregroundColor(.white)
                    .frame(width: AppConstants.toggleSize, height: AppConstants.toggleSize)
                    .background(Circle().fill(Color.blue))
                    .offset(x: isOn ? 50 - AppConstants.toggleSize : 0)
                    .animation(.easeInOut(duration: AppConstants.animationDuration), value: isOn)
                
                if !isOn {
                    Spacer()
                }
            }
        }
        .frame(width: 80, height: AppConstants.toggleSize)
    }
}
