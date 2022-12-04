import SwiftUI

struct ChosePopUp: View {
    
    @Binding var show: Bool
    @Binding var choosenPlayer: [CardPlayer]
    @Binding var eliminates: [CardPlayer]
    @Binding var answerUser: [CardPlayer]
    @Binding var rightAnswer: Bool
    
    @Binding var redPoints: Int
    @Binding var bluePoints: Int
    @Binding var whichTeam: Bool
    @Binding var finishGame: Bool
    @Binding var winningTeam: Bool
    
    var body: some View {
        if show {
            ZStack {
                Image("rect")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width * 0.43, height: UIScreen.main.bounds.height * 0.46, alignment: .center)
                
                VStack (spacing: 40) {
                    Text("Hora do mata-mata!")
                        .font(.system(size: 40, weight: .semibold))
                        .foregroundColor(.black)
                    
                    HStack {
                        Button(action: {
                            if rightAnswer {
                                if whichTeam {
                                    bluePoints += 5
                                } else {
                                    redPoints += 5
                                }
                                
                                if bluePoints > redPoints {
                                    winningTeam = true
                                } else {
                                    winningTeam = false
                                }
                                finishGame = true
                                
                            } else {
                                if whichTeam {
                                    winningTeam = false
                                    //azul perdeu
                                } else {
                                    winningTeam = true
                                    //vermelho perdeu
                                }
                                finishGame = true
                                answerUser.append(choosenPlayer[0])
                                choosenPlayer.removeLast()
                            }
                            withAnimation{
                                show = false
                            }
                            
                        }) {
                            Image("chuteCard")
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width * 0.1015, height: UIScreen.main.bounds.height * 0.245)
                        }.buttonStyle(CardButtonStyle())
                        
                        Button(action: {
                            if rightAnswer {
                                if whichTeam {
                                    winningTeam = false
                                    //azul perdeu
                                } else {
                                    winningTeam = true
                                    //vermelho perdeu
                                }
                                finishGame = true
                            } else {
                                if whichTeam {
                                    bluePoints += 1
                                } else {
                                    redPoints += 1
                                }
                                eliminates.append(choosenPlayer[0])
                                choosenPlayer.removeLast()
                            }
                            withAnimation{
                                show = false
                            }
                        }) {
                            Image("redCard")
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width * 0.1015, height: UIScreen.main.bounds.height * 0.245)
                        }.buttonStyle(CardButtonStyle())
                        
                    }
                    
                }
                
                
            }
            
        }
        
    }
    
}
