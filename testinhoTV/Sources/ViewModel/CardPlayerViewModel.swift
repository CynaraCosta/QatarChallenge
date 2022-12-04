
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
    
    func whichImage(eliminatedList: [CardPlayer],
                    player: CardPlayer,
                    placeholder: String,
                    playerImage: String) -> String {
        if eliminatedList.first(where: {$0 == player}) != nil {
            return placeholder
            
        } else {
            return playerImage
        }
    }
    
}

let cardsData = [
    CardPlayer(name: "messi", image: "messiURL", imageOff: "messiOffURL"),
    CardPlayer(name: "lewandowski", image: "lewandowskiURL", imageOff: "lewandowskiOffURL"),
    CardPlayer(name: "aboubakar", image: "aboubakarURL", imageOff: "aboubakarOffURL"),
    CardPlayer(name: "vinijr", image: "vinijrURL", imageOff: "vinijrOffURL"),
    CardPlayer(name: "gavi", image: "gaviURL", imageOff: "gaviOffURL"),
    CardPlayer(name: "vlahovic", image: "vlahovicURL", imageOff: "vlahovicOffURL"),
    CardPlayer(name: "alisson", image: "alissonURL", imageOff: "alissonOffURL"),
    CardPlayer(name: "neymar", image: "neymarURL", imageOff: "neymarOffURL"),
    CardPlayer(name: "cr7", image: "cr7URL", imageOff: "cr7OffURL"),
    CardPlayer(name: "son", image: "sonURL", imageOff: "sonOffURL"),
    CardPlayer(name: "debruyne", image: "debruyneURL", imageOff: "debruyneOffURL"),
    CardPlayer(name: "cavani", image: "cavaniURL", imageOff: "cavaniOffURL"),
    CardPlayer(name: "richarlison", image: "richarlisonURL", imageOff: "richarlisonOffURL"),
    CardPlayer(name: "mbappe", image: "mbappeURL", imageOff: "mbappeOffURL"),
    CardPlayer(name: "neuer", image: "neuerURL", imageOff: "neuerOffURL"),
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
