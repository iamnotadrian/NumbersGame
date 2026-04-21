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
    
    var body: some View {
        VStack {
            VStack (alignment: .leading){
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("NumbersGame")
                    .font(.largeTitle.bold())
                    .padding(.bottom, 4)
                
                Text("Ein Spiel um deine Kopfrechenfähigkeiten zu verbessern.")
            }
            
            Spacer()
            
            Text("Gestellte Fragen: \(stop())")
            Text(newEquation())
            TextField("Solution", text: $input)
                .foregroundStyle(answerColor)
                .onSubmit {
                   checkAnswer()
                }
            
            Spacer()
            
           // Text("\(result)")
            Text("Score: \(score)")
          
            /*Button("New number") {
                generateNewNumbers()
            }*/
                
        }
        .padding()
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
    
    func stop() -> String{
        if amountQuestions <= 10 {
            "\(amountQuestions)"
        } else {
            "10 Fragen hast du gestellt"
        }
    }
}

#Preview {
    ContentView()
        .frame(maxWidth: 300, maxHeight: 400)
}
