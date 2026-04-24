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
                .frame(minWidth: 300, minHeight: 400)
        }
        .windowResizability(.contentSize)
    }
}
