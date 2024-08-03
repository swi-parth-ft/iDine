//
//  ItemDetail.swift
//  iDine
//
//  Created by Parth Antala on 2024-01-09.
//

import SwiftUI

struct ItemDetail: View {
    
    let item: MenuItem
    
    var order: Order
    @State private var added = false
    var body: some View {
        VStack(alignment: .leading) {
            
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            Text(item.description)
                .padding()
            
            HStack {
                Button(added ? "Added to cart" : "Order This") {
                    order.add(item: item)
                    added = true
                }
                .foregroundColor(.white)
                .padding()
                .background(.black)
                .clipShape(Capsule())
                .padding(.leading)
                
                Button("",systemImage: "trash.slash") {
                    added = false
                    order.remove(item: item)
                }
                .opacity(added ? 1 : 0)
                .padding(.leading)
            }
            
            
            
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        ItemDetail(item: MenuItem.example, order: Order())
    }
}
