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
    @State private var skippedQuestionCount = 0
    @State private var showResultsAlert = false
    
    @FocusState private var isFocused: Bool
    
    private let totalQuestions = 10
    
    var body: some View {
        NavigationStack {
            VStack (alignment: .center){
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(Color.accentColor.opacity(0.14))
                        .frame(width: 46, height: 46)
                        .overlay {
                            Image(systemName: "plus.slash.minus")
                                .font(.system(size: 19, weight: .semibold))
                                .foregroundStyle(Color.accentColor)
                        }
                    VStack (alignment: .center){
                        Text("NumbersGame")
                            .font(.largeTitle.bold())
                        
                        Text("A simple app to improve your mental math skills.")
                    }
                
                Spacer()
                
                VStack {
                    VStack {
                        HStack {
                            Text("\(firstNumber)")
                                .font(.system(size: 60).bold())
                                .foregroundStyle(.tint)
                            Text("+")
                                .font(.largeTitle.bold())
                            Text("\(secondNumber)")
                                .font(.system(size: 60).bold())
                                .foregroundStyle(.tint)
                        }
                        
                        TextField(text: $input, prompt: Text("Type your answer")) {
                        }
                        
                        .font(.title3)
                        .foregroundStyle(answerColor)
                        .onAppear {
                            isFocused = true
                        }
                        .onSubmit {
                            checkAnswer()
                            isFocused = true
                        }
                    }
       
                    Text("Press return to submit answer")
                        .font(.footnote)
                        .foregroundStyle(.gray)
                        .padding(.top, 4)
                }
                
                
                HStack {
                    Text("Score: \(score)")
                    Spacer()
                    Text("Questions asked: \(amountQuestions)")
                    Spacer()
                    Text("Skipped questions: \(skippedQuestionCount)")
                }
                
                HStack (alignment: .center){
                    Button("Skip question") {
                        skipQuestion()
                    }
                    
                    Button("Reset game") {
                        resetGame()
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 16)
            }
            
            
            // Text("\(result)")
            /*Button("New number") {
             generateNewNumbers()
             }*/
            
        }
        .padding()
        .alert("Well done!", isPresented: $showResultsAlert) {
            Button("Next round") {
                resetGame()
            }
        } message: {
            Text("""
                Score: \(score) / \(totalQuestions)
                Questions skipped: \(skippedQuestionCount)
                """)
        }
        .navigationTitle("NumbersGame")
    }
    
    func newEquation() -> String {
        return "\(firstNumber) + \(secondNumber)"
    }
    
    func skipQuestion() {
        generateNewNumbers()
        skippedQuestionCount = skippedQuestionCount + 1
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
        if input.isEmpty {
            return Color.white
        } else if Int(input) == result {
            return Color.green
        } else {
            return Color.red
        }
    }
    
    func resetGame() {
        score = 0
        amountQuestions = 0
        input = ""
        skippedQuestionCount = 0
        amountQuestions = 0
        generateNewNumbers()
    }
}

#Preview {
    ContentView()
}
