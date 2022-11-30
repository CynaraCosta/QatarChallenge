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
    let zero = "0"
    let timerTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 300))
    ]
    
    @State private var points = 1
    
    @ObservedObject var viewModelPlayers = CardPlayerViewModel()
    
    let players = [
        "Vinícius Junior",
        "Gavi",
        "Vlahović",
        "Alisson",
        "Neymar",
        "Messi",
        "Cristiano Ronaldo",
        "Cavani",
        "Aboubakar",
        "Takuma Asano",
        "Son Heung-min",
        "Kylian Mbappé",
        "Lewandowski",
        "Lucas Paquetá",
        "Richarlison"
        
    ]
    
    var body: some View {
        ZStack {
            
            VStack {
                
                HStack{
                    
                    HStack (spacing: 24) {
                        Circle()
                            .fill(.blue)
                            .frame(width: UIScreen.main.bounds.width * 0.04, height: UIScreen.main.bounds.height * 0.07, alignment: .center)
                            .padding()
                        
                        Text("\(points)")
                            .frame(width: UIScreen.main.bounds.width * 0.02, height: UIScreen.main.bounds.height * 0.065)
                            .foregroundColor(.black)
                        
                        Rectangle()
                            .fill(.red)
                            .frame(width: UIScreen.main.bounds.width * 0.04, height: UIScreen.main.bounds.height * 0.07, alignment: .center)
                            .cornerRadius(4)
                            .padding()
                        
                        Text("\(points)")
                            .frame(width: UIScreen.main.bounds.width * 0.02, height: UIScreen.main.bounds.height * 0.065)
                            .foregroundColor(.black)
                        
                        Text("00:\(time < 10 ? zero : "")\(time)")
                            .frame(width: UIScreen.main.bounds.width * 0.05, height: UIScreen.main.bounds.height * 0.065)
                            .font(.system(size: 32, weight: .semibold))
                            .padding()
                            .foregroundColor(.black)
                        
                    }
                    .edgesIgnoringSafeArea(.leading)
                    .frame(width: UIScreen.main.bounds.width * 0.31, height: UIScreen.main.bounds.height * 0.09)
                    
                    .background(Rectangle().fill(.white))
                    .cornerRadius(16)
                    
                    
                    
                    
                    
                    Text("Olaaaa eu sou uma dica muito grande e você vai precisar de uma quebra de linha")
                        .frame(width: UIScreen.main.bounds.width * 0.61, height: UIScreen.main.bounds.height * 0.1)
                        .multilineTextAlignment(.center)
                        .font(.system(size: 40, weight: .semibold))
                        .foregroundColor(.black)
                        .background(.white)
                        .cornerRadius(16)
                    
                    
                }.padding()
                
                LazyVGrid(columns: adaptiveColumns, spacing: 40) {
                    ForEach(players, id: \.self) { player in
                        Button (action: {
                            withAnimation{
                                points += 1
                            }
                            
                        }, label: {
                            ZStack {
                                Rectangle()
                                    .frame(width: UIScreen.main.bounds.width * 0.1, height: UIScreen.main.bounds.height * 0.2)
                                    .cornerRadius(8)
                                    .foregroundColor(.primary)
                                
                                Text("\(player)")
                                    .foregroundColor(.black)
                                    .font(.system(size: 18, weight: .regular))
                            }
                        }).buttonStyle(CardButtonStyle())
                        
                    }
                }.padding()
                
            }
            
        }.onReceive(timerTimer) { _ in
            if time > 0 && timerRunning {
                time -= 1
            } else {
                timerRunning = false
            }
            
            
        }
    }
}
