//
//  ContentView.swift
//  testinhoTV
//
//  Created by Cynara Costa on 25/11/22.
//

import SwiftUI

struct ThemesView: View {
    
    @ObservedObject var viewModelThemes = CardThemeViewModel()
    
    var body: some View {
        ZStack {
            
            NavigationView {
                VStack(alignment: .center, spacing: 40) {
                    Text("Escolha o tema")
                        .font(.system(size: 80, weight: .bold))
                        .foregroundColor(.primary)
                        .padding()
                    
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(viewModelThemes.cardsThemes) { card in
                                    
                                NavigationLink(destination: getThemeView(Theme: card)) {
                                        VStack {
                                            Image("premierLeague")
                                                .clipShape(RoundedRectangle(cornerRadius: 12 ))
                                            Text(card.nameTheme)
                                                .foregroundColor(.primary)
                                                .font(.system(size: 48, weight: .bold))
                                                .padding()
                                                
                                        }
                                    
                                    }.buttonStyle(PlainButtonStyle())
                                    
                                    
        //                        }
                                
                                
                            }
                        }.padding(80)
                    }
                    .padding(-80)
                    
                }
                
            }
        }.background(
            Image("bgFut")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        )
        
        
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
