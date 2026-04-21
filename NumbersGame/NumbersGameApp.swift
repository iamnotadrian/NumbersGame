//
//  NumbersGameApp.swift
//  NumbersGame
//
//  Created by adrian on 16.04.26.
//

import SwiftUI

@main
struct NumbersGameApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .frame(maxWidth: 300, maxHeight: 400)
        }
        .windowResizability(.contentSize)
    }
}
