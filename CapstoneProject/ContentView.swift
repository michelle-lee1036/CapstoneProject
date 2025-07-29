//
//  ContentView.swift
//  CapstoneProject
//
//  Created by Scholar on 7/28/25.
//

import SwiftUI

struct ContentView: View {
    @State private var inputDays = 0
    @State private var inputHours = 0
    @State private var inputMinutes = 0
    @State private var inputSeconds = 0
    
    @State private var targetDate = Date()
    @State private var timeRemaining = 0
    @State private var isPaused = true
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var countdownStarted = false
    
    var body: some View {
        VStack(spacing: 20) {
            if !countdownStarted {
                VStack {
                    HStack {
                        Stepper("Days: \(inputDays)", value: $inputDays, in: 0...365)
                    }
                    HStack {
                        Stepper("Hours: \(inputHours)", value: $inputHours, in: 0...23)
                    }
                    HStack {
                        Stepper("Minutes: \(inputMinutes)", value: $inputMinutes, in: 0...59)
                    }
                    HStack {
                        Stepper("Seconds: \(inputSeconds)", value: $inputSeconds, in: 0...59)
                    }
                }

            Button("Start Countdown") {
                             let totalSeconds = inputDays * 86400 + inputHours * 3600 + inputMinutes * 60 + inputSeconds
                             timeRemaining = totalSeconds
                             targetDate = Date().addingTimeInterval(Double(totalSeconds))
                             isPaused = false
                             countdownStarted = true
                         }
                     } else {
                         // Countdown display
                         Text("Time remaining: \(formatTime(seconds: timeRemaining))")
                             .onReceive(timer) { _ in
                                 if !isPaused && timeRemaining > 0 {
                                     timeRemaining -= 1
                                 }
                                 if timeRemaining <= 0 {
                                     isPaused = true
                                 }
                             }

                         HStack {
                             Button("Pause") {
                                 isPaused = true
                             }

                             Button("Resume") {
                                 isPaused = false
                             }

                             Button("Reset") {
                                 isPaused = true
                                 countdownStarted = false
                                 inputDays = 0
                                 inputHours = 0
                                 inputMinutes = 0
                                 inputSeconds = 0
                                 timeRemaining = 0
                             }
                         }
                     }
                 }
                 .font(.title2)
                 .padding()
             }

             func formatTime(seconds: Int) -> String {
                 let d = seconds / 86400
                 let h = (seconds % 86400) / 3600
                 let m = (seconds % 3600) / 60
                 let s = seconds % 60
                 return String(format: "%02dd %02dh %02dm %02ds", d, h, m, s)
             }
         }


#Preview {
    ContentView()
}
