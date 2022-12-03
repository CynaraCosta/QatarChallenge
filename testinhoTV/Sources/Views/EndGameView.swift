import SwiftUI

struct EndGameView: View {
    
    var body: some View {
        ZStack {
            
            Image("premierLeague")
                .resizable()
                .scaledToFill()
            
            Text("Acabou o jogo")
                .font(.system(size: 40, weight: .semibold))
                .foregroundColor(.red)
        }
        
    }
}
