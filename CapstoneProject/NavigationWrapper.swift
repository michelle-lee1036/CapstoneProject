//
//  NavigationWrapper.swift
//  CapstoneProject
//
//  Created by Scholar on 7/29/25.
//

import SwiftUI

struct NavigationWrapper<Content: View>: View {
    let title: String
    let content: () -> Content

    init(title: String, @ViewBuilder content: @escaping () -> Content) {
        self.title = title
        self.content = content
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // Custom Navigation Bar with buttons to your pages
                HStack {
                    NavigationLink(destination: ContentView()) {
                        Image(systemName: "house")
                    }
                    Spacer()
                    Text(title)
                        .font(.headline)
                    Spacer()
                    NavigationLink(destination: MapSlide()) {
                        Image(systemName: "map")
                    }
                }
                .padding()
                .background(Color(.systemGray6))

                Divider()

                content()
                    .padding()
            }
            .navigationBarHidden(true)
        }
    }
}
