//
//  RulesView.swift
//  testinhoTV
//
//  Created by egln on 02/12/22.
//

import SwiftUI

struct RulesView: View {
    
    @ObservedObject var viewModelThemes = CardRulesViewModel()
    var body: some View {
        ZStack{
            Image("Background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            
            NavigationView {
                ScrollView(.horizontal) {
                    HStack(spacing: 0){
                        ForEach(viewModelThemes.cardsRules) { card in
                            Button(action: {}){
                                ZStack(alignment: .topLeading){
                                    Image("RulesCardImage")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                    //.frame(height: 650)
                                        .frame(height: UIScreen.main.bounds.height * 0.65)
                                        .clipShape(RoundedRectangle(cornerRadius: 12 ))
                                    
                                    VStack(alignment: .leading){
                                        Text(card.nameRule)
                                            .foregroundColor(.black)
                                            .font(.system(size: 64, weight: .bold))
                                            .padding()
                                            .frame(maxWidth: UIScreen.main.bounds.width * 0.85, alignment: .leading)
                                        Text(card.ruleDescription)
                                            .padding()
                                            .foregroundColor(.black)
                                            .font(.system(size: 40, weight: .regular))
                                            .fixedSize(horizontal: false, vertical: true)
                                    }.padding(100)
                                        .frame(maxWidth: UIScreen.main.bounds.width * 0.85)
                                }
                            }.buttonStyle(PlainButtonStyle())
                            
                            
                        }
                    }
                    //                }.padding(90)
                    //                    .padding(-90)
                }
            }
        }
        //            .padding(90)
        //            .padding(-90)
        
    }
    
}


struct CountentView_Previews: PreviewProvider {
    static var previews: some View {
        RulesView()
    }
}

