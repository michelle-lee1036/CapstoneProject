//
//  ContentView.swift
//  CapstoneProject
//
//  Created by Scholar on 7/28/25.
//

import SwiftUI

struct ContentView: View {
    @State private var timeElapsed = 0
    @State private var startDate = Date()
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var isPaused = false

    var body: some View {
        VStack(spacing: 20) {
            Text("Hello")
            Text("Time Elapsed: \(timeElapsed) sec")
                .onReceive(timer) { firedDate in
                    if !isPaused {
                        timeElapsed = Int(firedDate.timeIntervalSince(startDate))
                    }
                }

            HStack(spacing: 20) {
                Button("Pause") {
                    isPaused = true
                }

                Button("Resume") {
                    isPaused = false
                    startDate = Date().addingTimeInterval(-Double(timeElapsed)) // keep time continuity
                }

                Button("Reset") {
                    isPaused = true
                    timeElapsed = 0
                    startDate = Date()
                }
            }
        }
        .font(.largeTitle)
        .padding()
    }
}


#Preview {
    ContentView()
}
