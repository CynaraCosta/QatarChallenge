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
    
    let data = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
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
                HStack {
                    HStack {
                        Circle()
                            .fill(.red)
                            .frame(width: UIScreen.main.bounds.width * 0.04, height: UIScreen.main.bounds.height * 0.07, alignment: .center)
                        
                            .modifier(AnimatingNumberOverlay(points: CGFloat(points)))
                        Rectangle()
                            .fill(.blue)
                            .frame(width: UIScreen.main.bounds.width * 0.04, height: UIScreen.main.bounds.height * 0.07, alignment: .center)
                            .cornerRadius(4)
                            .modifier(AnimatingNumberOverlay(points: CGFloat(points)))
                    }
                    Text("Olaaaa eu sou uma dica muito grande e você vai precisar de uma quebra de linha")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 56, weight: .bold))
                    Text("00:\(time < 10 ? zero : "")\(time)")
                        .font(.system(size: 48, weight: .semibold))
                }
                
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
    
    struct AnimatingNumberOverlay: AnimatableModifier {
        
        var points: CGFloat
        var animatableData: CGFloat {
            get {
                points
            }
            
            set {
                points = newValue
            }
            
        }
        
        func body(content: Content) -> some View {
            return content.overlay(Text("\(Int(points))").foregroundColor(.white)
                .font(.system(size: 40, weight: .semibold)))
        }
        
    }
}
