import SwiftUI

struct ChosePopUp: View {
    
    @Binding var show: Bool
    @Binding var choosenPlayer: [CardPlayer]
    @Binding var eliminates: [CardPlayer]
    @Binding var answerUser: [CardPlayer]
    
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
                            print("verde")
                            answerUser.append(choosenPlayer[0])
                            choosenPlayer.removeLast()
                            withAnimation{
                                show = false
                            }
                            
                        }) {
                            Image("chuteCard")
                                .resizable()
                                .frame(width: UIScreen.main.bounds.width * 0.1015, height: UIScreen.main.bounds.height * 0.245)
                        }.buttonStyle(CardButtonStyle())
                        
                        Button(action: {
                            print("vermelho")
                            eliminates.append(choosenPlayer[0])
                            choosenPlayer.removeLast()
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
