//
//  CountdownPopUp.swift
//  testinhoTV
//
//  Created by LoreVilaca on 02/12/22.
//

import Foundation
import SwiftUI

struct CountdownPopUp: View {
    
    @Binding var show: Bool
    @State var timerRunning = true
    @State var time: Int = 5
    
    @State private var shouldNavigate = false
    @State private var showCountdown = false
    
    let timerTimer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationStack{
            ZStack {
                if !showCountdown {
                    Image (ImageConstants.shared.COUNTDOWN_RECTANGLE)
                        .overlay(TeamsOverlay(), alignment: .center)
                } else {
                    Image (ImageConstants.shared.COUNTDOWN_RECTANGLE)
                        .overlay(Countdown(), alignment: .center)
                }
                
            }
            .onReceive(timerTimer) { _ in
                if time > 0 && timerRunning {
                    time -= 1
                    if time < 4 {
                        showCountdown = true
                    }
                } else {
                    timerRunning = false
                    self.timerTimer.upstream.connect().cancel()
                    self.shouldNavigate = true
                    print("foi")
                }
            }
            .background(
                NavigationLink(destination: CupView(),
                               isActive: $shouldNavigate) { EmptyView() }
            )
        }
    }
}




