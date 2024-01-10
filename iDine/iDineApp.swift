//
//  iDineApp.swift
//  iDine
//
//  Created by Parth Antala on 2024-01-09.
//

import SwiftUI

@main
struct iDineApp: App {
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
