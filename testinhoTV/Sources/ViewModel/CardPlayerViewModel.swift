
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
    CardPlayer(name: "messi", image: "messiURL"),
    CardPlayer(name: "lewandowski", image: "lewandowskiURL"),
    CardPlayer(name: "aboubakar", image: "aboubakarURL"),
    CardPlayer(name: "messi", image: "messiURL"),
    CardPlayer(name: "lewandowski", image: "lewandowskiURL"),
    CardPlayer(name: "aboubakar", image: "aboubakarURL"),
    CardPlayer(name: "messi", image: "messiURL"),
    CardPlayer(name: "lewandowski", image: "lewandowskiURL"),
    CardPlayer(name: "aboubakar", image: "aboubakarURL"),
    CardPlayer(name: "messi", image: "messiURL"),
    CardPlayer(name: "lewandowski", image: "lewandowskiURL"),
    CardPlayer(name: "aboubakar", image: "aboubakarURL"),
    CardPlayer(name: "messi", image: "messiURL"),
    CardPlayer(name: "lewandowski", image: "lewandowskiURL"),
    CardPlayer(name: "aboubakar", image: "aboubakarURL"),
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
