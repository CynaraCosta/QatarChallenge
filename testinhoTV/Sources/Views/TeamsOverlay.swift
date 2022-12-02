//
//  TeamsOverlay.swift
//  testinhoTV
//
//  Created by LoreVilaca on 02/12/22.
//

import Foundation
import SwiftUI


struct TeamsOverlay: View {
    
    var body: some View {
        ZStack {
            HStack{
                VStack{
                    Image(ImageConstants.shared.BLUE_TEAM)
                    Text("Azul")
                        .font(.system(size: 62, weight: .semibold))
                        .foregroundColor(.black)
                }
                Text("VS")
                    .font(.system(size: 116, weight: .bold))
                    .foregroundColor(.black)
                VStack{
                    Image(ImageConstants.shared.RED_TEAM)
                    Text("Vermelho")
                        .font(.system(size: 62, weight: .semibold))
                        .foregroundColor(.black)
                }
                
            }
        }
    }
}

struct Countdown: View {
    var body: some View {
        Text ("3")
            .font(.system(size: 320, weight: .bold))
            .foregroundColor(.black)
        
    }
}
