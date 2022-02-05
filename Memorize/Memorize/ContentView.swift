//
//  ContentView.swift
//  Memorize
//
//  Created by Jake Rhoads on 1/26/22.
//

import SwiftUI

struct ContentView: View {
    let vehicles = ["🚀","🚁","🚜","🚗","🚙","🚒","🚐","🚚","🚢","🛶","🚃","🛸"]
    
    let food = ["🍔","🌭","🍆","🍒","🍑","🍉","🍩","🥑","🥓","🍟","🥩","🧀"]
   
    let flags = ["🇨🇦","🇯🇵","🇻🇳","🏴‍☠️","🇧🇪","🇲🇨","🇺🇸","🏳️‍🌈","🇬🇧","🏴󠁧󠁢󠁷󠁬󠁳󠁿","🇦🇱","🏴󠁧󠁢󠁳󠁣󠁴󠁿"]
    
    //defaults to vehicles
    @State var currEmojis: [String] = ["🚀","🚁","🚜","🚗","🚙","🚒","🚐","🚚","🚢","🛶","🚃","🛸"]
    
    
    //Default starting number of cards to match vehicle theme
    @State var numOfCards: Int = 8
    
    var body: some View {
        VStack {
            title
            Spacer()
            ScrollView {
                LazyVGrid (columns: [GridItem(.adaptive(minimum: 65))]){
                    ForEach(currEmojis[0..<numOfCards], id: \.self) {
                        emoji in CardView(content: emoji)
                        .aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            .padding(.top)
            Spacer()
            HStack {
                vehicleThemeBtn
                Spacer()
                foodThemeBtn
                Spacer()
                flagThemeBtn
            }
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
    var title: some View {
        HStack {
            Text("Memorize!").font(.largeTitle)
            Image(systemName: "square.stack.3d.up").font(.largeTitle)
        }
    }
    
    var vehicleThemeBtn: some View{
        Button {
            currEmojis = vehicles.shuffled()
            numOfCards = 8
        } label: {
            VStack {
                Image(systemName:"car")
                    .font(.largeTitle)
                Text("Vehicles")
            }
        }
    }
    
    
    var foodThemeBtn: some View {
        Button {
            currEmojis = food.shuffled()
            numOfCards = 10
        } label: {
            VStack {
                //Wish there was a better icon for food!
                Image(systemName:"hare")
                    .font(.largeTitle)
                Text("Food")
            }
        }
    }

    var flagThemeBtn: some View{
        Button {
            currEmojis = flags.shuffled()
            numOfCards = 12
        } label: {
            VStack {
                Image(systemName:"flag")
                    .font(.largeTitle)
                Text("Flags")
            }
        }
    }
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View{
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 10.0)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
                
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}

































struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.dark)
.previewInterfaceOrientation(.landscapeRight)
            ContentView()
        }
    }
}
