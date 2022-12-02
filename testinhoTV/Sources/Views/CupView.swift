//
//  CupView.swift
//  testinhoTV
//
//  Created by Cynara Costa on 26/11/22.
//

import SwiftUI

struct CupView: View {
    
    @State var timerRunning = true
    @State var time: Int = 59
    @State var countDownTimer: Int = 3 + 3
    let zero = "0"
    let timerTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 300))
    ]
    
    @State private var isPopUp = false
    @State private var blurAmount: CGFloat = 32.0
    @State private var points = 1
    
    @ObservedObject var viewModelPlayers = CardPlayerViewModel()
    @State private var list = CardPlayerViewModel().cardsPlayers.shuffled()
    
    @State private var chosenClue = ClueAnswerViewModel().clues.randomElement()!
    
    @State private var choose: [CardPlayer] = []
    @State private var eliminated: [CardPlayer] = []
    @State private var answerUser: [CardPlayer] = []
    
    @State private var placeholder: String = "premierLeague"
    
    var body: some View {
        ZStack {
            
            Image("Background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .blur(radius: isPopUp ? blurAmount: 0.0)
            
            if isPopUp == false {
                VStack {
                    
                    HStack{
                        
                        HStack (spacing: 8) {
                            Circle()
                                .fill(.blue)
                                .frame(width: UIScreen.main.bounds.width * 0.04, height: UIScreen.main.bounds.height * 0.07, alignment: .center)
                                .padding()
                            
                            Text("\(points)")
                                .frame(width: UIScreen.main.bounds.width * 0.02, height: UIScreen.main.bounds.height * 0.065)
                                .foregroundColor(.black)
                            
                            Text(" - ")
                                .frame(width: UIScreen.main.bounds.width * 0.02, height: UIScreen.main.bounds.height * 0.065)
                                .foregroundColor(.black)
                            
                            
                            Text("\(points)")
                                .frame(width: UIScreen.main.bounds.width * 0.02, height: UIScreen.main.bounds.height * 0.065)
                                .foregroundColor(.black)
                            
                            
                            Rectangle()
                                .fill(.red)
                                .frame(width: UIScreen.main.bounds.width * 0.04, height: UIScreen.main.bounds.height * 0.07, alignment: .center)
                                .cornerRadius(4)
                                .padding()
                            
                            
                            
                            Text("00:\(time < 10 ? zero : "")\(time)")
                                .frame(width: UIScreen.main.bounds.width * 0.05, height: UIScreen.main.bounds.height * 0.065)
                                .font(.system(size: 32, weight: .semibold))
                                .padding()
                                .foregroundColor(.black)
                            
                        }
                        .padding(.leading, 54)
                        .edgesIgnoringSafeArea(.leading)
                        .frame(width: UIScreen.main.bounds.width * 0.31
                               , height: UIScreen.main.bounds.height * 0.098)
                        
                        .background(Rectangle().fill(.white))
                        .cornerRadius(16, corners: [.topRight, .bottomRight])
                        
                        Text("Olaaaa eu sou uma dica muito grande e você vai precisar de uma quebra de linha")
                            .frame(width: UIScreen.main.bounds.width * 0.63, height: UIScreen.main.bounds.height * 0.12)
                            .multilineTextAlignment(.center)
                            .font(.system(size: 40, weight: .semibold))
                            .foregroundColor(.black)
                            .background(.white)
                            .cornerRadius(16)
                        
                    }
                    
                    .edgesIgnoringSafeArea(.leading)
                    .padding()
                    
                    LazyVGrid(columns: adaptiveColumns, spacing: 40) {
                        ForEach(list) { player in
                            Button (action: {
                                withAnimation{
                                    points += 1
                                    isPopUp = true
                                    choose.append(player)
                                }
                                
                            }, label: {
                                ZStack {
                                    
                                    Image("\(viewModelPlayers.whichImage(eliminatedList: eliminated,player: player, placeholder: placeholder, playerImage: player.image))"
                                          
                                    )
                                    .resizable()
                                    .frame(width: UIScreen.main.bounds.width * 0.1, height: UIScreen.main.bounds.height * 0.2)
                                    
                                }
                            }).buttonStyle(CardButtonStyle())
                            
                        }
                    }.padding()
                    
                }
            } else {
                ChosePopUp(show: $isPopUp, choosenPlayer: $choose, eliminates: $eliminated, answerUser: $answerUser)
            }
            
            
        }
        
        .onReceive(timerTimer) { _ in
            if time > 0 && timerRunning {
                time -= 1
            } else {
                timerRunning = false
            }
            
            
        }
    }
}
