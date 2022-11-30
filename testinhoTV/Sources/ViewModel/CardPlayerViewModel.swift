
//
//  CardPlayerViewModel.swift
//  testinhoTV
//
//  Created by Cynara Costa on 25/11/22.
//

import SwiftUI

class CardPlayerViewModel: ObservableObject {
    @Published var cardsPlayers: [CardPlayer] = []
    @Published var cardsPlayers2 = players
    
    init() {
        addCards()
    }
    
    func addCards() {
        cardsPlayers = cardsData
    }
    
}

let cardsData = [
    CardPlayer(name: "Harry Kane", image: "fotinhaa", nacionality: "Inglesa", club: "Spurs", rating: 85, position: "ST"),
    CardPlayer(name: "Kylian Mbappé", image: "fotinhaa", nacionality: "Francesa", club: "Paris Saint-Germain", rating: 92, position: "ST"),
    CardPlayer(name: "Heung Min Son", image: "fotinhaa", nacionality: "Sul Coreana", club: "Tottenham", rating: 89, position: "LW"),
]

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
