//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Oscar Fridh on 2022-08-19.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    @State private var score = 0
    @State private var answers: [Bool] = []
    
    @State private var showingResult = false
    @State private var tappedFlagNumber: Int?
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.2, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .font(.subheadline.weight(.heavy))
                            .foregroundStyle(.secondary)
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    flagButtons
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Spacer()
            }
            .alert(scoreTitle, isPresented: $showingScore) {
                Button("Continue", action: askQuestion)
            } message: {
                Text("Your score is \(score)")
            }
            .alert("Result: \(answers.filter { $0 }.count) / \(answers.count)", isPresented: $showingResult) {
                Button("Try again", action: restart)
            }
            .padding()
        }
    }
    
    private var flagButtons: some View {
        ForEach(0..<3) { number in
            let wrongSelection = !(tappedFlagNumber == nil || tappedFlagNumber == number)
            return Button {
                withAnimation {
                    flagTapped(number)
                }
            } label: {
                Image(countries[number])
                    .renderingMode(.original)
                    .clipShape(Capsule())
                    .shadow(radius: 5)
            }
            .rotation3DEffect(
                .degrees(number == tappedFlagNumber ? 360 : 0),
                axis: (x: 0, y: 1, z: 0)
            )
            .opacity(wrongSelection ? 0.25 : 1)
            .scaleEffect(wrongSelection ? 0.8 : 1)
            .rotation3DEffect(
                .degrees(wrongSelection ? 45 : 0),
                axis: (x: CGFloat(number)/3, y: -1.0, z: CGFloat(number)/3)
            )
        }
    }
    
    func flagTapped(_ number: Int) {
        tappedFlagNumber = number
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
            answers.append(true)
        } else {
            scoreTitle = "Wrong! That's the flag of \(countries[number])"
            score = 0
            answers.append(false)
        }
        
        if answers.count == 8 {
            showingResult = true
        } else {
            showingScore = true
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        tappedFlagNumber = nil
    }
    
    func restart() {
        answers = []
        score = 0
        scoreTitle = ""
        askQuestion()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
