import SwiftUI

struct ChangeTeamView: View {
    
    @Binding var whichTeam: Bool
    @Binding var isTimeUp: Bool
    @Binding var time: Int
    @Binding var howManyTimes: Int
    
    let timerTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var intervalTime: Int = 5
    
    var body: some View {
        ZStack {
            Image("ChangeTeamRectangle")
                .resizable()
                .frame(width: UIScreen.main.bounds.width * 0.67, height: UIScreen.main.bounds.height * 0.168)
            
            Text("Passe o controle para o time \(whichTeam == true ? "Azul" : "Vermelho")")
                .font(.system(size: 48, weight: .semibold))
                .foregroundColor(.black)
        }.onReceive(timerTimer) { _ in
            if intervalTime > 0 && isTimeUp {
                intervalTime -= 1
            } else {
                isTimeUp = false
                time = 59
                howManyTimes += 1
                whichTeam.toggle()
            }
        }
    }
}
