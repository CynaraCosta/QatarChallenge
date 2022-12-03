//
//  TeamsOverlay.swift
//  testinhoTV
//
//  Created by LoreVilaca on 02/12/22.
//

import Foundation
import SwiftUI


struct TeamsOverlay: View {
    
    var body: some View {
        ZStack {
            HStack{
                VStack{
                    Image(ImageConstants.shared.BLUE_TEAM)
                    Text("Azul")
                        .font(.system(size: 62, weight: .semibold))
                        .foregroundColor(.black)
                }
                Text("VS")
                    .font(.system(size: 116, weight: .bold))
                    .foregroundColor(.black)
                VStack{
                    Image(ImageConstants.shared.RED_TEAM)
                    Text("Vermelho")
                        .font(.system(size: 62, weight: .semibold))
                        .foregroundColor(.black)
                }
                
            }
        }
    }
}

struct Countdown: View {
    let timerTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var timerRunning = true
    @State var time: Int = 3
    
    @State private var shouldNavigate = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Text ("\(time)")
                    .font(.system(size: 320, weight: .bold))
                    .foregroundColor(.black)
            }
            .onReceive(timerTimer) { _ in
                if time > 1 && timerRunning {
                    time -= 1
                } else {
                    timerRunning = false
                    shouldNavigate = true
                    self.timerTimer.upstream.connect().cancel()
                }
                
            }
            .background(
                NavigationLink(destination: CupView(),
                               isActive: $shouldNavigate) { EmptyView() }
                    .buttonStyle(CardButtonStyle())
            ) 
        }
        
    }
}
