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
                                //mandar pra tela de fim de jogo
                            } else {
                                if whichTeam {
                                    //azul perdeu
                                } else {
                                    //vermelho perdeu
                                }
                                //mandar pra tela de fim de jogo, time que chutou perdeu
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
                                    //azul perdeu
                                } else {
                                    //vermelho perdeu
                                }
                                //mandar pra tela de fim de jogo, o time que estiver na rodada perde
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
