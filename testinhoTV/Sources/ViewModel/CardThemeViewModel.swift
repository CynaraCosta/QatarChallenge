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
    CardTheme(id: 0, nameTheme: "Copa do Mundo", imageTheme: "copaDoMundo"),
    CardTheme(id: 1, nameTheme: "Seleção Brasileira", imageTheme: "selecaoBrasileira"),
    CardTheme(id: 2, nameTheme: "Melhores do mundo", imageTheme: "melhoresDoMundo"),
    CardTheme(id: 3, nameTheme: "Champions League", imageTheme: "championsLeague"),
    CardTheme(id: 4, nameTheme: "Brasileirão feminino", imageTheme: "brasileiraoFeminino"),
]
