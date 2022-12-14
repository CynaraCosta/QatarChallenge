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
    @State var intervalTime: Int = 5
    
    let zero = "0"
    
    let timerTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 300))
    ]
    
    @State private var isPopUp = false
    @State private var isTimeUp = false
    @State private var blurAmount: CGFloat = 32.0
    @State private var bluePoints = 0
    @State private var redPoints = 0
    @State private var selectedCards = 2
    
    @State var whichTeam: Bool = false
    @State var winner: Bool = true
    // true = azul - false = vermelho
    
    @ObservedObject var viewModelPlayers = CardPlayerViewModel()
    @State private var list = CardPlayerViewModel().cardsPlayers.shuffled()
    
    //    @State private var answer = ClueAnswerViewModel().clues.randomElement()!.answer
    
    @State private var clues = ClueAnswerViewModel().clues[0].clues
    @State private var answer = ClueAnswerViewModel().clues[0].answer
    @State private var rightAnswer = false
    
    @State private var howManyClues: Int = 0
    
    @State private var choose: [CardPlayer] = []
    @State private var eliminated: [CardPlayer] = []
    @State private var answerUser: [CardPlayer] = []
    
    @State private var finishGame = false
    
    var body: some View {
        ZStack {
            
            Image("Background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .blur(radius: (isPopUp || isTimeUp) && howManyClues != 6 ? blurAmount: 0.0)
            
            if isPopUp == false && isTimeUp == false && howManyClues <= 6 && !finishGame{
                VStack {
                    
                    HStack{
                        
                        HStack (spacing: 8) {
                            Circle()
                                .fill(.blue)
                                .frame(width: UIScreen.main.bounds.width * 0.04, height: UIScreen.main.bounds.height * 0.07, alignment: .center)
                                .padding()
                            
                            Text("\(bluePoints)")
                                .frame(width: UIScreen.main.bounds.width * 0.02, height: UIScreen.main.bounds.height * 0.065)
                                .foregroundColor(.black)
                            
                            Text(" - ")
                                .frame(width: UIScreen.main.bounds.width * 0.02, height: UIScreen.main.bounds.height * 0.065)
                                .foregroundColor(.black)
                            
                            
                            Text("\(redPoints)")
                                .frame(width: UIScreen.main.bounds.width * 0.02, height: UIScreen.main.bounds.height * 0.065)
                                .foregroundColor(.black)
                            
                            
                            Rectangle()
                                .fill(.red)
                                .frame(width: UIScreen.main.bounds.width * 0.04, height: UIScreen.main.bounds.height * 0.07, alignment: .center)
                                .cornerRadius(8)
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
                        
                        Text("\(clues[howManyClues])")
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
                                    if player.name == answer.lowercased() {
                                        rightAnswer = true
                                    }
                                    isPopUp = true
                                    choose.append(player)
                                    selectedCards -= 1
                                    
                                    if selectedCards == 0 {
                                        isTimeUp = true
                                        time = 0
                                    }
                                    
                                }
                                
                            }, label: {
                                ZStack {
                                    
                                    Image("\(viewModelPlayers.whichImage(eliminatedList: eliminated,player: player, placeholder: player.imageOff, playerImage: player.image))"
                                          
                                    )
                                    .resizable()
                                    .frame(width: UIScreen.main.bounds.width * 0.1, height: UIScreen.main.bounds.height * 0.2)
                                    
                                }
                            }).buttonStyle(CardButtonStyle())
                            
                        }
                    }.padding()
                    
                }
            }
            
            else if isPopUp == true && !finishGame {
                ChosePopUp(show: $isPopUp, choosenPlayer: $choose, eliminates: $eliminated, answerUser: $answerUser, rightAnswer: $rightAnswer, redPoints: $redPoints, bluePoints: $bluePoints, whichTeam: $whichTeam, finishGame: $finishGame, winningTeam: $winner, howManyClues: $howManyClues)
            }
            
            else if isTimeUp && howManyClues <= 5 && !finishGame{
                ChangeTeamView(whichTeam: $whichTeam, isTimeUp: $isTimeUp, time: $time, howManyTimes: $howManyClues, selectedCards: $selectedCards)
            }
            
            else if howManyClues == 6 || finishGame {
                EndGameView(winningTeam: $winner)
                // s?? o azul est?? ganhando
            }
            
        }
        
        .onReceive(timerTimer) { _ in
            if time > 0 && timerRunning {
                time -= 1
            } else {
                isTimeUp = true
                //                timerRunning = false
            }
            
            
        }
    }
}

