//
//  ContentView.swift
//  CS193P
//
//  Created by Kyu jin Lee on 2022/07/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.gray)
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]){
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}


struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUP {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder()
                Text(card.content).font(.largeTitle)
            } else {
                shape.fill().foregroundColor(.black)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
    }
}
