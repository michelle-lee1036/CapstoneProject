//
//  HomePage.swift
//  CapstoneProject
//
//  Created by Scholar on 7/30/25.
//

import SwiftUI
struct HomePage: View {
    @State private var inputDays = 0
    @State private var inputHours = 0
    @State private var inputMinutes = 0
    @State private var inputSeconds = 0
    @State private var targetDate = Date()
    @State private var timeRemaining = 0
    @State private var isPaused = true
    @State private var countdownStarted = false
    @State private var showAlert = false
    @State private var menuOpened = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(red: 1.9, green: 0.93, blue: 0.86)
                    .ignoresSafeArea()
                VStack(spacing: 20) {
                    Text("HEALTHMILES")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(Color(red: 0.91, green: 0.55, blue: 0.18))
                        .frame(width: 280, height: 85)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color(red: 1.0, green: 0.91, blue: 0.93))
                        )
                        .border(Color(red: 0.99, green: 0.69, blue: 0.64), width: 5)

                    Divider()
                        .frame(height: 3)
                        .overlay((Color(red: 0.91, green: 0.55, blue: 0.18)))
                        .padding()
                    Text("Countdown Clock ⏰")
                        .font(.title)
                        .bold()
                        .foregroundColor(Color(red: 0.29, green: 0.76, blue: 0.65)) //color of CountdownClock Text
                    
                    Group {
                        if !countdownStarted {
                            VStack {
                                Stepper("Days: \(inputDays)", value: $inputDays, in: 0...365)
                                    .tint(Color(red: 0.91, green: 0.55, blue: 0.18))
                                    .foregroundColor(Color(red: 0.29, green: 0.76, blue:0.65))
                                Stepper("Hours: \(inputHours)", value: $inputHours, in: 0...23)
                                    .tint(Color(red: 0.91, green: 0.55, blue: 0.18))
                                    .foregroundColor(Color(red: 0.29, green: 0.76, blue:0.65))
                                Stepper("Minutes: \(inputMinutes)", value: $inputMinutes, in: 0...59)
                                    .tint(Color(red: 0.91, green: 0.55, blue: 0.18))
                                    .foregroundColor(Color(red: 0.29, green: 0.76, blue:0.65))
                                Stepper("Seconds: \(inputSeconds)", value: $inputSeconds, in: 0...59)
                                    .tint(Color(red: 0.91, green: 0.55, blue: 0.18))
                                    .foregroundColor(Color(red: 0.29, green: 0.76, blue:0.65))
                            }
                            Button("Start Countdown") {
                                let totalSeconds = inputDays * 86400 + inputHours * 3600 + inputMinutes * 60 + inputSeconds
                                timeRemaining = totalSeconds
                                targetDate = Date().addingTimeInterval(Double(totalSeconds))
                                isPaused = false
                                countdownStarted = true
                            }
                            .buttonStyle(.borderedProminent)
                            .tint(Color(red: 0.99, green: 0.69, blue: 0.64))
                            //button coloring above for start countdown
                        } else {
                            Text("Time remaining: \(formatTime(seconds: timeRemaining))")
                                .font(.title2)
                                .foregroundColor(Color(red: 0.91, green: 0.55, blue: 0.18))
                                .onReceive(timer) { _ in
                                    if !isPaused && timeRemaining > 0 {
                                        timeRemaining -= 1
                                    }
                                    if timeRemaining <= 0 {
                                        isPaused = true
                                        showAlert = true
                                    }
                                }
                            
                            HStack(spacing: 20) {
                                Button("Pause") {
                                    isPaused = true
                                }
                                .buttonStyle(.bordered)
                                .tint(Color(red: 0.99, green: 0.69, blue: 0.64))
                                //pause button coloring above
                                
                                Button("Resume") {
                                    isPaused = false
                                }
                                .buttonStyle(.bordered)
                                .tint(Color(red: 0.99, green: 0.69, blue: 0.64))
                                
                                Button("Reset") {
                                    resetCountdown()
                                }
                                .buttonStyle(.bordered)
                                .tint(Color(red: 0.99, green: 0.69, blue: 0.64))
                                
                            }
                        }
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 15)
                        .fill(Color(red: 1.0, green: 0.91, blue: 0.93))
                        .padding()
                    )
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color(red: 0.99, green: 0.69, blue: 0.64), lineWidth: 4)
                            .padding()
                    )
                
                    .alert("Trip has started!!!", isPresented: $showAlert) {
                        Button("OK") {
                            resetCountdown()
                        }
                    }
                } //end brace of group function
            }
            //above is the closing brace for the zstack
        }
        //above is the closing brace for the navigation stack
    }
    // above is the closing brace for the var body some view
    func formatTime(seconds: Int) -> String {
        let d = seconds / 86400
        let h = (seconds % 86400) / 3600
        let m = (seconds % 3600) / 60
        let s = seconds % 60
        return String(format: "%02dd %02dh %02dm %02ds", d, h, m, s)
    }
    func resetCountdown() {
        isPaused = true
        countdownStarted = false
        inputDays = 0
        inputHours = 0
        inputMinutes = 0
        inputSeconds = 0
        timeRemaining = 0
    }
    func toggleMenu() {
        menuOpened.toggle()
    }
}
#Preview {
    ContentView()
}
        
        //fix the countdown clock later
        //how to add in navigation bar to the homepage so that the user can actually go to all the different slides that are going to be on the app. (NEED BUTTONS, but HOW)
        //figured out the navigation bar thing
        //need to figure out how to make the countdown clock less work for user
        //we need to do the calculation, not them adding in all the hours, minutes, and seconds, and stuff
        
        //at the very end make everything look aesthetic with the nice colors


