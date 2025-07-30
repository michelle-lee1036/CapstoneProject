//
//  MainView.swift
//  CapstoneProject
//
//  Created by Scholar on 7/30/25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack {
            TabView {
                ContentView()
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }

                MapSlide()
                    .tabItem {
                        Label("Map", systemImage: "map")
                    }
            }
            .navigationTitle("Home") // Set a shared title here or in each tab
        }
    }
}

#Preview {
    MainView()
}
