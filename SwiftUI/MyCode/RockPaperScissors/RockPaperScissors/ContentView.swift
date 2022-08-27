//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Oscar Fridh on 2022-08-27.
//

import SwiftUI

struct ContentView: View {
    @State private var game = RockPaperScissorsGame(size: 3)
    
    @State private var showAlert = false
    @State private var message = ""
    
    var body: some View {
        ZStack {
            backgroundView
                .ignoresSafeArea()
            gameContentView
                .padding(50)
                .background(.thinMaterial)
                //.clipShape(RoundedRectangle(cornerRadius: 20))
                .clipShape(Circle())
                .shadow(radius: 10)
        }
    }
    
    var gameContentView: some View {
        VStack(spacing: 20) {
            Text("Score: \(game.score)")
                .font(.title)
            if !game.finished {
                Text("App move: \(game.appChoice.emoji)")
                Text("Try to **\(game.shouldWin ? "win" : "lose")**")
                HStack {
                    ForEach(Move.allCases) { move in
                        Button(move.emoji) {
                            playerSelected(move: move)
                        }
                        .font(.system(size: 50))
                    }
                }
            } else {
                Button("Restart") {
                    game.restart()
                }
            }
        }
        .alert(message, isPresented: $showAlert) {
            Button("OK") {}
        }
    }
    
    var backgroundView: some View {
        RadialGradient(colors: [.blue, .black], center: .center, startRadius: 100, endRadius: 500)
    }
    
    func playerSelected(move: Move) {
        message = "The player tapped \(move.emoji), the player was trying to \(game.shouldWin ? "win" : "loose"), and the app chose \(game.appChoice.emoji)"
        let correct = game.select(move: move)
        message += ", so \(correct ? "add" : "remove") 1 point"
        showAlert = true
    }
}

extension Move {
    var emoji: String {
        switch self {
        case .rock: return "🪨"
        case .paper: return "📄"
        case .scissors: return "✂️"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
