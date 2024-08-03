//
//  MainView.swift
//  iDine
//
//  Created by Parth Antala on 2024-01-09.
//

import SwiftUI

struct MainView: View {
    @State private var order = Order()
    var body: some View {
        TabView {
            ContentView(order: order)
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }
            
            OrderView(order: order)
                .tabItem {
                    Label("Order", systemImage: "square.and.pencil")
                }
        }
    }
}

#Preview {
    MainView()
}
