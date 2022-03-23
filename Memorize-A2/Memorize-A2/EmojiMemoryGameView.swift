//
//  EmojiMemoryGameView.swift
//  Memorize-A2
//
//  Created by Jake Mac on 3/11/22.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
   
    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle)
            HStack {
                Text("Score: \(game.score)").fontWeight(.bold)
                Spacer()
                Text("\(game.themeName)").fontWeight(.bold)
            }
            .padding(.horizontal)
            
            AspectVGrid(items: game.cards, aspectRatio: 2/3, content: { card in
                if card.isMatched && !card.isFaceUp {
                    Rectangle().opacity(0)
                } else {
                CardView(of: card)
                    .padding(4)
                    .onTapGesture {
                        game.choose(card)
                    }
                }
            })
            newGameBtn(game)
        }
        .foregroundColor(game.cardColor)
        .padding(.horizontal)
    }
}

func newGameBtn(_ game: EmojiMemoryGame) -> some View {
    return ZStack {
            let shape = RoundedRectangle(cornerRadius: 15)
            shape.fill()
            Button("New Game") {
                game.newGame()
            }
            .padding(.all)
            .font(.largeTitle)
            .foregroundColor(.white)
            
        }.fixedSize() // Ensures the box stays inside the size of the text container
}

struct CardView: View {
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.65
        static let circlePadding: CGFloat = 5
        static let circleOpacity: CGFloat = 0.5
    }
    
    private let card: EmojiMemoryGame.Card
    
    init(of card: EmojiMemoryGame.Card) {
        self.card = card
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: DrawingConstants.cornerRadius)
                if card.isFaceUp {
                    shape.fill().foregroundColor(.white)
                    shape.strokeBorder(lineWidth: DrawingConstants.lineWidth)
                    Pie(startAngle: Angle(degrees: 0-90), endAngle: Angle(degrees: 110-90))
                        .padding(DrawingConstants.circlePadding)
                        .opacity(DrawingConstants.circleOpacity)
                    Text(card.content).font(font(in: geometry.size))
                } else if card.isMatched {
                    shape.opacity(0)
                } else {
                    shape.fill()
                }
            }
        }
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
    
}









































struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // Default to fruit theme for testing
        let game = EmojiMemoryGame(theme: EmojiMemoryGameTheme.themes[1])
        // One way of testing our game without changing our actual MemoryGame vars
        //game.choose(game.cards.first!)
//        EmojiMemoryGameView()
//            .preferredColorScheme(.dark)
        return EmojiMemoryGameView(game: game)
            .preferredColorScheme(.light)
    }
}
