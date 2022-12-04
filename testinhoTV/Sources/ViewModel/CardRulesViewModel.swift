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
    
    CardRules(id: 1, nameRule: "Aquecimento", ruleDescription: "1. Junte de 2 a 10 pessoas.\n\n2. Dividam-se em 2 times, vermelho e azul. O vermelho sempre começa!\n\n3. Cada rodada possui 1 minuto de duração, viu?\n\n4. E, a cada rodada, uma dica será revelada."),
    
    CardRules(id: 2, nameRule: "Tá na hora do jogo!", ruleDescription: "Cartão Vermelho → Retira a carta do tabuleiro\n\nChute → Escolhe o jogador da rodada antes da rodada final\n\nPipocar → Passa a rodada para o time adversário"),
    CardRules(id: 3, nameRule: "Pontuação", ruleDescription: "A cada cartão vermelho dado corretamente, o time ganha 1 ponto.\nO time que acertar o jogador da rodada, ganha 5 pontos!"),
    
    CardRules(id: 4, nameRule: "Apita o árbitro", ruleDescription: "O jogo finaliza ao acabarem as rodadas ou quando o jogador da rodada é descoberto. E seu time pode ganha-lo pela pontuação conquistada ou eliminação do adversário.\n\nAgora, se liga: um time pode ser eliminado por dar cartão vermelho ao jogador da rodada ou chutar o jogador errado."),
    
    CardRules(id: 5, nameRule: "Prorrogação", ruleDescription: "Iiih... e se o jogador da rodada não for descoberto ao final das dicas? Pois é, vocês vão pra Prorrogação. Aqui, os times têm 2 rodadas para chutar ou pipocar! **Sim, o cartão vermelho não é permitido.**\n\nO time que acertar o jogador no chute, ganha 5 pontos! Agora, caso os times pipoquem, o jogo será definido pela pontuação conquistada pelos cartões vermelhos."),

]
