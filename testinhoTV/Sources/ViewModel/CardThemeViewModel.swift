//
//  CardPlayerViewModel.swift
//  testinhoTV
//
//  Created by Cynara Costa on 26/11/22.
//

import SwiftUI

class CardThemeViewModel: ObservableObject {
    @Published var cardsThemes: [CardTheme] = []
    
    init() {
        addCards()
    }
    
    func addCards() {
        cardsThemes = cardsThemeData
    }
    
}

let cardsThemeData = [
    CardTheme(id: 0, nameTheme: "Copa do Mundo", imageTheme: "laLiga"),
    CardTheme(id: 1, nameTheme: "Seleção Brasileira", imageTheme: "cbf"),
    CardTheme(id: 2, nameTheme: "Lendas do futebol", imageTheme: "premierLeague"),
    CardTheme(id: 3, nameTheme: "Premier League", imageTheme: "cbf"),
    CardTheme(id: 4, nameTheme: "La Liga", imageTheme: "laLiga"),
]
