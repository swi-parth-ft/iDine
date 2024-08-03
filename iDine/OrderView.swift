//
//  OrderView.swift
//  iDine
//
//  Created by Parth Antala on 2024-01-09.
//

import SwiftUI

struct OrderView: View {
    
   var order: Order
    
    var body: some View {
        NavigationStack {
            List {
                Section{
                    ForEach(order.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                    }
                    .onDelete(perform: deleteItems)
                }
                
                Section {
                    NavigationLink("Place Order") {
                        CheckoutView(order: order)
                    }
                }
                .disabled(order.items.isEmpty)
            }
            .navigationTitle("Order Details")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                EditButton()
            }
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        order.items.remove(atOffsets: offsets)
    }
}

#Preview {
    OrderView(order: Order())
}
