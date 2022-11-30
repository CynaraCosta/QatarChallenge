
//
//  CardPlayerViewModel.swift
//  testinhoTV
//
//  Created by Cynara Costa on 25/11/22.
//

import SwiftUI

class CardPlayerViewModel: ObservableObject {
    @Published var cardsPlayers: [CardPlayer] = []
    
    init() {
        addCards()
    }
    
    func addCards() {
        cardsPlayers = cardsData
    }
    
    func shuffleCards(){
        cardsPlayers.shuffled()
    }
    
}

let cardsData = [
    CardPlayer(name: "Harry Kane", image: "fotinhaa", nacionality: "Inglesa", club: "Spurs", rating: 85, position: "ST"),
    CardPlayer(name: "Kylian Mbappé", image: "fotinhaa", nacionality: "Francesa", club: "Paris Saint-Germain", rating: 92, position: "ST"),
    CardPlayer(name: "Heung Min Son", image: "fotinhaa", nacionality: "Sul Coreana", club: "Tottenham", rating: 89, position: "LW"),
]
