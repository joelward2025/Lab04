//
//  ContentView.swift
//  Lab04
//
//  Created by Joel Ward on 9/13/24.
//

import SwiftUI

var cards = ["A❤️", "2❤️", "3❤️", "4❤️", "5❤️", "6❤️", "7❤️", "8❤️", "9❤️", "10❤️", "J❤️", "Q❤️", "K❤️","A♣️", "2♣️", "3♣️", "4♣️", "5♣️", "6♣️", "7♣️", "8♣️", "9♣️", "10♣️", "J♣️", "Q♣️", "K♣️","A♦️", "2♦️", "3♦️", "4♦️", "5♦️", "6♦️", "7♦️", "8♦️", "9♦️", "10♦️", "J♦️", "Q♦️", "K♦️","A♠️", "2♠️", "3♠️", "4♠️", "5♠️", "6♠️", "7♠️", "8♠️", "9♠️", "10♠️", "J♠️", "Q♠️", "K♠️"]

struct CardView: View {
    @State private var hovering = false
    var suitRank: String
    var body: some View {
        ZStack {
            //card
            RoundedRectangle(cornerRadius: 10.0)
                .aspectRatio(CGSize(width: 2, height: 3), contentMode: .fill)
                .foregroundStyle(.white)
                .overlay(RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 3)
                        .foregroundColor(hovering ? .blue : .black))
            // center
            Text(suitRank)
                .font(.largeTitle)
                .foregroundStyle(.black)
            VStack {
                // top corner
                HStack {
                    Text(suitRank)
                        .foregroundStyle(.black)
                        .padding(5)
                    Spacer()
                }
                Spacer()
                // bottom corner
                HStack {
                    Spacer()
                    Text(suitRank)
                        .padding(5)
                        .foregroundStyle(.black)
                        .rotationEffect(Angle(degrees: 180))
                }
            }
        }
        .onTapGesture {
            hovering = !hovering
        }
    }
}

struct ContentView: View {
    var body: some View {
        ScrollView{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], content: {
                ForEach(cards.shuffled(), id: \.self) { item in
                    CardView(suitRank: item)
                }
            }).padding()
        }
    }
}

#Preview {
    ContentView()
}
