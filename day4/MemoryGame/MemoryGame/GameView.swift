//
//  ContentView.swift
//  MemoryGame
//
//  Created by Kiyong Kim on 2022/07/13.
//

import SwiftUI

struct GameView: View {
    var prefix: String
    @ObservedObject var game = GameModel()
    var body: some View {
        VStack {
            HStack {
                Text("Memory Game")
                Spacer()
                Text("Flips: \(game.flips)")
            }
            .padding(.horizontal)
            GridStack(rows: GameModel.rows, columns: GameModel.cols) { row, column in
                CardView(prefix: prefix, card: game.card(row: row, col: column))
                    .gesture(
                        TapGesture().onEnded {
                            game.open(row: row, col: column)
                        }
                    )
            }
            .aspectRatio(CGSize(width: GameModel.cols, height: GameModel.rows), contentMode: .fit)
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(prefix: "f")
    }
}
