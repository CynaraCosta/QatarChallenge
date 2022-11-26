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
    CardTheme(id: 0, nameTheme: "Copa do Mundo", imageTheme: .red),
    CardTheme(id: 1, nameTheme: "Seleção Brasileira", imageTheme: .blue),
    CardTheme(id: 2, nameTheme: "Lendas do futebol", imageTheme: .green),
    CardTheme(id: 3, nameTheme: "Premier League", imageTheme: .yellow),
    CardTheme(id: 4, nameTheme: "La Liga", imageTheme: .systemPink),
]
