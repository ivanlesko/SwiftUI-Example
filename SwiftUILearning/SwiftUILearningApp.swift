//
//  SwiftUILearningApp.swift
//  SwiftUILearning
//
//  Created by Ivan L on 6/2/24.
//

import SwiftUI

@main
struct SwiftUILearningApp: App {
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
