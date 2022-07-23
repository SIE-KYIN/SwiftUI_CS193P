//
//  EmojiMemoryGame.swift
//  CS193P
//
//  Created by Kyu jin Lee on 2022/07/23.
//
// ViewModel

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static let emojis = ["🚗" , "🚕" , "🚙" , "🚌" , "🚎" , "🚐" , "🚒" ,  "🚑", "🚓", "🏎️", "🛻" , "🚚" , "🚜" , "🚛" , "🛵" , "🚲" , "🛴" , "🚠" , "🚝" , "🚃" , "🚁" , "🚀" , "🛳️" , "🛸" , "✈️"]
    
    static func createMemoryGame(_ num: Int) -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: num) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame(4)
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
        
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
