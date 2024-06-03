//
//  ContentView.swift
//  SwiftUILearning
//
//  Created by Ivan Lesko on 6/2/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
        
        NavigationStack {
            List {
                ForEach(menu) { section in
                    Section(section.name) {
                        ForEach(section.items) { item in
                            ItemRow(item: item)
                        }
                    }
                }
            }
        }
        .navigationTitle("Menu")
        .listStyle(.grouped)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
