//
//  MainView.swift
//  SwiftUILearning
//
//  Created by Ivan Lesko on 6/25/24.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var order: Order
    
    enum Tab {
        case menu
        case order
    }
    
    @State var selectedTab: Tab = .menu
    
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
                .tag(Tab.menu)
            
            OrderView()
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil")
                }
                .tag(Tab.order)
                .badge(order.items.count)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(Order())
    }
}
