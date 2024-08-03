//
//  ContentView.swift
//  iDine
//
//  Created by Parth Antala on 2024-01-09.
//

import SwiftUI

struct ContentView: View {
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    var order: Order
    var body: some View {
      NavigationStack {
            List {
                ForEachMenuSections()
            }
            .navigationDestination(for: MenuItem.self, destination: { item in
                ItemDetail(item: item, order: order)
            })
            .navigationTitle("Menu")
            .listStyle(.grouped)
        }
    }
    
    private func ForEachMenuSections() -> some View {
         ForEach(menu) { section in
             Section(section.name) {
                 ForEachSectionItems(section: section)
             }
         }
     }

     private func ForEachSectionItems(section: MenuSection) -> some View {
         ForEach(section.items) { item in
             NavigationLink(value: item) {
                 ItemRow(item: item)
             }
         }
     }
}

#Preview {
    ContentView(order: Order())
}
