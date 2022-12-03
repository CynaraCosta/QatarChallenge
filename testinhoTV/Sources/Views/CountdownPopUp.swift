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
    @State var time: Int = 2
    
    @State private var showCountdown = false
    
    let timerTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
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
                } else {
                    showCountdown = true
                    timerRunning = false
                    self.timerTimer.upstream.connect().cancel()
                }
            }
        }
    }
}




