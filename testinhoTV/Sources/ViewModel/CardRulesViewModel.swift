//
//  CardRulesViewModel.swift
//  testinhoTV
//
//  Created by egln on 02/12/22.
//

import SwiftUI

class CardRulesViewModel: ObservableObject {
    @Published var cardsRules: [CardRules] = []
    
    init() {
        addCards()
    }
    
    func addCards() {
        cardsRules = cardsRulesData
    }
    
}

let cardsRulesData = [
    CardRules(id: 0, nameRule: "Bola Fora", ruleDescription: "Chegou a hora de descobrir qual time manja mais de futebol! Descubra quem é o jogador da rodada antes do apito final. Vai dar essa bola fora não, né?"),
    CardRules(id: 1, nameRule: "Aquecimento", ruleDescription: "Não faça nada Junte de 2 a 10 pessoas.Dividam-se em 2 times, vermelho e azul. O vermelho sempre começa! Cada rodada possui 1 minuto de duração, viu? E, a cada rodada, uma dica será revelada."),
    CardRules(id: 2, nameRule: "Tá na hora do jogo!", ruleDescription: "Não faça nada"),
    CardRules(id: 3, nameRule: "Tá na hora do jogo!", ruleDescription: "Não faça nada"),
    CardRules(id: 4, nameRule: "Tá na hora do jogo!", ruleDescription: "Não faça nada"),
    CardRules(id: 5, nameRule: "Tá na hora do jogo!", ruleDescription: "Não faça nada"),
    CardRules(id: 6, nameRule: "Tá na hora do jogo!", ruleDescription: "Não faça nada"),
    CardRules(id: 7, nameRule: "Tá na hora do jogo!", ruleDescription: "Não faça nada"),
    CardRules(id: 8, nameRule: "Tá na hora do jogo!", ruleDescription: "Não faça nada"),
    CardRules(id: 9, nameRule: "Tá na hora do jogo!", ruleDescription: "Não faça nada"),
    
//    CardRules(id: 0, nameTheme: "Copa do Mundo", imageTheme: "laLiga"),
//    CardTheme(id: 1, nameTheme: "Seleção Brasileira", imageTheme: "cbf"),
//    CardTheme(id: 2, nameTheme: "Lendas do futebol", imageTheme: "premierLeague"),
//    CardTheme(id: 3, nameTheme: "Premier League", imageTheme: "cbf"),
//    CardTheme(id: 4, nameTheme: "La Liga", imageTheme: "laLiga"),
]
