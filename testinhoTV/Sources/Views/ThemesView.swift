//
//  ContentView.swift
//  testinhoTV
//
//  Created by Cynara Costa on 25/11/22.
//

import SwiftUI

struct ThemesView: View {
    
    @ObservedObject var viewModelThemes = CardThemeViewModel()
    @State private var isCountdown = false
    @State private var blurAmount: CGFloat = 32.0
    
    var body: some View {
        ZStack{
            Image("Background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .blur(radius: isCountdown ? blurAmount: 0.0)
            
            if !isCountdown{
                ZStack {
                    NavigationStack{
                        VStack(alignment: .center,spacing: 80) {
                            VStack(spacing: 70){
                                Image(ImageConstants.shared.TITLE_RECTANGLE)
                                    .overlay(TitleOverlay(),alignment: .center)
                                
                                ScrollView(.horizontal) {
                                    HStack(spacing: -60){
                                        ForEach(viewModelThemes.cardsThemes) { card in
                                            Button (action: {
                                                withAnimation {
                                                    isCountdown = true
                                                    print(card)
                                                }
                                            }, label: {
                                                Image(card.imageTheme)
                                                    .resizable()
                                                
                                            }).buttonStyle(CardButtonStyle())
                                        }.padding(80)
                                    }
                                    .frame(height: 700, alignment: .center)
                                    .padding(-80)
                                }.focusSection()
                                
                                HStack {
                                    Spacer()
                                    
                                    NavigationLink(destination: RulesView()){
                                        Button ("Instru????es"){}
                                            .font(.system(size: 40, weight: .semibold))
                                            .background(Color(UIColor(red: 20/255, green: 140/255, blue: 0/255, alpha: 1.0)))
                                            .foregroundColor(.white)
                                            .cornerRadius(8)
                                            .buttonStyle(PlainButtonStyle())
                                    }
                                    .padding(.bottom, 10)
                                    .buttonStyle(CardButtonStyle())
                                    
                                    Spacer()
                                    
                                }.focusSection()
                                
                            }
                            
                        }
                    }
                }.background(
                    Image(ImageConstants.shared.BACKGROUND)
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all)
                )
            } else {
                CountdownPopUp(show: $isCountdown)
            }
        }
    }
}

@ViewBuilder func getThemeView(Theme: CardTheme) -> some View {
    switch Theme.id {
    case 0: CupView()
    case 1: BRView()
    case 2: LegendsView()
    case 3: PremierView()
    case 4: LaLigaView()
    default: EmptyView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ThemesView()
    }
}
