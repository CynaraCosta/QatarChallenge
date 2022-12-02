import SwiftUI

class ClueAnswerViewModel: ObservableObject {
    @Published var clues: [ClueAnswer] = []
    
    init() {
        addClues()
    }
    
    func addClues() {
        clues = cluesData
    }
    
}

let cluesData = [
    ClueAnswer(clues: ["Antes do Qatar, já joguei uma copa",
                       "Já joguei no futebol inglês",
                       "Já ganhei quatro competições diferentes por um mesmo time",
                       "Fiz mais de 100 gols",
                       "Já joguei a Libertadores",
                       "Nunca disputei uma final pela minha seleção",
                       "Fui camisa 9 no PSG"
                      ], answer: "Cavani")
]
