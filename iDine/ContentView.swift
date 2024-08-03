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
    @State private var searchText = ""
    var filteredMenu: [MenuSection] {
            if searchText.isEmpty {
                return menu
            } else {
                return menu.map { section in
                    let filteredItems = section.items.filter { item in
                        item.name.localizedCaseInsensitiveContains(searchText) ||
                        item.description.localizedCaseInsensitiveContains(searchText)
                    }
                    return MenuSection(id: UUID(), name: section.name, items: filteredItems)
                }
            }
        }
    
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
            .searchable(text: $searchText, prompt: "Search for a item")
        }
    }
    
    private func ForEachMenuSections() -> some View {
        ForEach(filteredMenu) { section in
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
