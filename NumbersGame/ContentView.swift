//
//  ContentView.swift
//  NumbersGame
//
//  Created by adrian on 16.04.26.
//

import SwiftUI

struct ContentView: View {
    @State private var input = ""
    @State private var firstNumber = Int.random(in: 1...100)
    @State private var secondNumber = Int.random(in: 1...100)
    @State private var score = 0
    @State private var amountQuestions = 0
    @State private var showResultsAlert = false
    
    private let totalQuestions = 10
    
    var body: some View {
        NavigationStack {
            VStack (alignment: .leading){
                VStack (alignment: .leading){
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                                        .fill(Color.accentColor.opacity(0.14))
                                        .frame(width: 46, height: 46)
                                        .overlay {
                                            Image(systemName: "plus.slash.minus")
                                                .font(.system(size: 19, weight: .semibold))
                                                .foregroundStyle(Color.accentColor)
                                        }
                    Text("NumbersGame")
                        .font(.largeTitle.bold())
                    
                    Text("A simple app to improve your mental math skills.")
                }
                .frame(maxWidth: .infinity, alignment: .leading)

                Spacer()

                /*Text(newEquation())
                    .font(.largeTitle.bold())
                    .foregroundStyle(.tint)*/
                
                VStack (alignment: .leading){
                    HStack {
                        Text("\(firstNumber)")
                            .font(.system(size: 48).bold())
                            .foregroundStyle(.tint)
                       Text("+")
                            .font(.largeTitle.bold())
                        Text("\(secondNumber)")
                            .font(.system(size: 48).bold())
                            .foregroundStyle(.tint)
                    }
                    
                    TextField("Type your answer", text: $input)
                        .foregroundStyle(answerColor)
                        .onSubmit {
                           checkAnswer()
                        }
                }
                
                Spacer()
                
                HStack {
                    Text("Score: \(score)")
                    Spacer()
                    Text("Questions asked: \(amountQuestions)")
                }
              
                Button("Reset game") {
                    resetGame()
                }
                // Text("\(result)")
                /*Button("New number") {
                    generateNewNumbers()
                }*/
                    
            }
            .padding()
            .alert("", isPresented: $showResultsAlert) {
                Button("Next round") {
                   resetGame()
                }
            } message: {
                Text("\(score) / \(totalQuestions)")
            }
            .navigationTitle("NumbersGame")
        }
    }

    func newEquation() -> String {
        return "\(firstNumber) + \(secondNumber)"
    }
    
    func checkAnswer() {
        if Int(input) == result {
            score = score + 1
        }
        generateNewNumbers()
        input = ""
    }
    
  var result: Int {
        return firstNumber + secondNumber
}
    
    func generateNewNumbers() {
        amountQuestions = amountQuestions + 1
        
        if amountQuestions == totalQuestions {
            showResultsAlert = true
            return
        }
        
        firstNumber = Int.random(in: 1...100)
        secondNumber = Int.random(in: 1...100)
    }
    
    var evaluateInput: Bool {
        if Int(input) == result {
            return true
        } else {
            return false
        }
    }
    
    var answerColor: Color {
        if evaluateInput {
            return Color.green
        } else {
            return Color.red
        }
    }
    
    func resetGame() {
        score = 0
        amountQuestions = 0
        generateNewNumbers()
    }
}

#Preview {
    ContentView()
        .frame(maxWidth: 300, maxHeight: 400)
}
