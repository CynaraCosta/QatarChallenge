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
        VStack(alignment: .center, spacing: 40) {
            Text("Escolha o tema")
                .font(.system(size: 80, weight: .bold))
                .foregroundColor(.primary)
                .padding()

            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(viewModelThemes.cardsThemes) { card in
                        VStack (spacing: 40) {
                            Button {
                                print(card.nameTheme)
                            } label: {
                                Image("premierLeague")
                                
                            }.buttonStyle(CardButtonStyle())
                            
                            Text(card.nameTheme)
                                .foregroundColor(.primary)
                                .font(.system(size: 48, weight: .bold))
                            
                        }
                        
                        
                    }
                }.padding(80)
            }
            .padding(-80)
            
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ThemesView()
    }
}
