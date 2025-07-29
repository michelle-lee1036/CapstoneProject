//
//  CapstoneProjectApp.swift
//  CapstoneProject
//
//  Created by Scholar on 7/28/25.
//

import SwiftUI
import SwiftData

@main
struct CapstoneProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: ItemNeeded.self)
        }
    }
}
