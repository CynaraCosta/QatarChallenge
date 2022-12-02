//
//  RulesView.swift
//  testinhoTV
//
//  Created by egln on 02/12/22.
//

import SwiftUI

struct RulesView: View {
    
    @ObservedObject var viewModelThemes = CardRulesViewModel()
    //@ObservedObject var vuiewModelThemes = CardThemeViewModel()
    
    var body: some View {
        ZStack {
            
            NavigationView {
                VStack(alignment: .center, spacing: 40) {
                    //                    Text("Escolha o tema")
                    //                        .font(.system(size: 80, weight: .bold))
                    //                        .foregroundColor(.primary)
                    //                        .padding()
                    
                    
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(viewModelThemes.cardsRules) { card in
                                
                                //NavigationLink{//destination: getRulesView(Rules: card)) {
                                ZStack {
                                    Image("RulesCardImage")
                                        .clipShape(RoundedRectangle(cornerRadius: 12 ))
                                    VStack{
                                        Text(card.nameRule)
                                            .foregroundColor(.black)
                                            .font(.system(size: 88, weight: .bold))
                                            .padding()
                                        
                                        Text(card.ruleDescription)
                                            .foregroundColor(.black)
                                            .font(.system(size: 20, weight: .bold))
                                            .padding()
                                    }//.frame(maxHeight: .infinity)
                                }
                                
                            }.buttonStyle(PlainButtonStyle())
                            
                            
                            //                        }
                            
                            
                        }
                    }.padding(80)
                }
                .padding(-80)
                
            }
            
        }
    }
    
    
}



struct CountentView_Previews: PreviewProvider {
    static var previews: some View {
        RulesView()
    }
}

