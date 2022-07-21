//
//  ContentView.swift
//  CS193P
//
//  Created by Kyu jin Lee on 2022/07/21.
//

import SwiftUI

struct ContentView: View {
    let emojis = ["🚗" , "🚕" , "🚙" , "🚌" , "🚎" , "🚐" , "🚒" ,  "🚑", "🚓", "🏎️", "🛻" , "🚚" , "🚜" , "🚛" , "🛵" , "🚲" , "🛴" , "🚠" , "🚝" , "🚃" , "🚁" , "🚀" , "🛳️" , "🛸" , "✈️"]
    @State var emojiCount = 1
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.gray)
            
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]){
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            Spacer()
            
            HStack {
                remove
                Spacer()
                add
            }
            .padding(.horizontal)
        }
        .padding()
    }
    
    var remove: some View {
        Button  {
            if emojiCount >= 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")
                .resizable().frame(width: 30, height: 30)
        }
    }
    
    var add: some View {
        Button  {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
                .resizable().frame(width: 30, height: 30)
        }
    }
}


struct CardView: View {
    var content: String
    @State var isFaceUP = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUP {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder()
                Text(content).font(.largeTitle)
            } else {
                shape.fill().foregroundColor(.black)
            }
        }
        .onTapGesture {
            isFaceUP = !isFaceUP
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
