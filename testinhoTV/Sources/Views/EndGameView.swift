import SwiftUI

struct EndGameView: View {
    
    //@Binding var winningTeam: Bool
    // true = azul - false = vermelho
    
    var body: some View {
        ZStack {

            Image("endGameRectangle")
                .resizable()
                .frame(width: UIScreen.main.bounds.width * 0.59, height: UIScreen.main.bounds.height * 0.51, alignment: .center)
            
            HStack {
                
//                Image("\(winningTeam == false ? "blueWins" : "redWins")")
//                    .resizable()
//                    .frame(width: UIScreen.main.bounds.width * 0.16, height: UIScreen.main.bounds.height * 0.28)
//
//                Text("Parabéns, \(winningTeam == false ? "azul" : "vermelho")! \nIsso aqui é ELITE!")
//                    .font(.system(size: 64, weight: .semibold))
//                    .foregroundColor(.black)
                
            }
            
        }
        
    }
}
