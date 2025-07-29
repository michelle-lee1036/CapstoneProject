//
//  ContentView.swift
//  CapstoneProject
//
//  Created by Scholar on 7/28/25.
// add all the other color, background, dividers, frames, and stuff later. just added a few for now to see how much space left there will be.

import SwiftUI

struct MenuItem: Identifiable {
    var id = UUID()
    let text: String
    let imageName: String
    let handler: () -> Void = {
        print("Tapped Item")
    }
}

struct MenuContent: View {
    let items: [MenuItem] = [
        MenuItem(text: "Home", imageName: "house"),
        MenuItem(text: "Itinerary", imageName: "calendar"),
        MenuItem(text: "Map", imageName: "map"),
        MenuItem(text: "Health", imageName: "cross"),
        MenuItem(text: "something1", imageName: "person.circle"),
        MenuItem(text: "Share", imageName: "square.and.arrow.up")
    ]
    
    var body: some View {
        ZStack {
            Color(UIColor(red: 43/255.0, green: 40/255.0, blue: 74/255.0, alpha: 1))
                .ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 0) {
                ForEach(items) { item in
                    HStack {
                        Image(systemName: item.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                            .frame(width: 32, height: 30, alignment: .center)
                        
                        Text(item.text)
                            .foregroundColor(.white)
                            .bold()
                            .font(.system(size: 22))
                        
                        Spacer()
                    }
                    .onTapGesture {
                        item.handler()
                    }
                    .padding()
                    
                    Divider()
                }
                Spacer()
            }
            .padding(.top, 25)
        }
    }
}

struct SideMenu: View {
    let width: CGFloat
    let menuOpened: Bool
    let toggleMenu: () -> Void
    
    var body: some View {
        ZStack {
            if menuOpened {
                Color.gray.opacity(0.5)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation(.easeIn) {
                            toggleMenu()
                        }
                    }
            }
            
            HStack {
                MenuContent()
                    .frame(width: width)
                    .offset(x: menuOpened ? 0 : -width)
                    .animation(.easeIn, value: menuOpened)
                
                Spacer()
            }
        }
    }
}

struct ContentView: View {
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
                VStack(spacing: 20) {
                    Text("HEALTHMILES")
                        .font(.largeTitle)
                        .foregroundColor(Color(red: 0.416, green: 0.043, blue: 0.763))
                        .frame(width: 300, height: 90)
                        .border(Color.red, width: 5)
                    
                    Divider()
                        .frame(height: 3)
                        .overlay(.black)
                        .padding(.bottom)
                    
                    Text("Home 🏡")
                    
                    if !countdownStarted {
                        VStack {
                            Stepper("Days: \(inputDays)", value: $inputDays, in: 0...365)
                            Stepper("Hours: \(inputHours)", value: $inputHours, in: 0...23)
                            Stepper("Minutes: \(inputMinutes)", value: $inputMinutes, in: 0...59)
                            Stepper("Seconds: \(inputSeconds)", value: $inputSeconds, in: 0...59)
                        }
                        
                        Button("Start Countdown") {
                            let totalSeconds = inputDays * 86400 + inputHours * 3600 + inputMinutes * 60 + inputSeconds
                            timeRemaining = totalSeconds
                            targetDate = Date().addingTimeInterval(Double(totalSeconds))
                            isPaused = false
                            countdownStarted = true
                        }
                    } else {
                        Text("Time remaining: \(formatTime(seconds: timeRemaining))")
                            .onReceive(timer) { _ in
                                if !isPaused && timeRemaining > 0 {
                                    timeRemaining -= 1
                                }
                                if timeRemaining <= 0 {
                                    isPaused = true
                                    showAlert = true
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
                                resetCountdown()
                            }
                        }
                    }
                }
                .padding()
                .blur(radius: menuOpened ? 5 : 0)
                
                SideMenu(width: UIScreen.main.bounds.width * 0.7,
                         menuOpened: menuOpened,
                         toggleMenu: toggleMenu)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        withAnimation {
                            menuOpened.toggle()
                        }
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .imageScale(.large)
                    }
                }
            }
            .navigationTitle("Home")
            .alert("Trip started!", isPresented: $showAlert) {
                Button("OK") {
                    resetCountdown()
                }
            }
        }
    }
    
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


//how to add in navigation bar to the homepage so that the user can actually go to all the different slides that are going to be on the app.
//i tried the .toolbar thing, but it keeps saying that the toolbar thing can't be used in the view scope and i'm not sure why when it literally works in the about me and the navigation app thing we worked on together as a class.
//i also tried the other navigation bar thing that i out in the google doc (day 7), but it just looks unaesthetic, so i'm going to leave it as a last resort, also idk if the button thing on that work. (cause i have to remember that it has to be a navigation bar, not a bunch of displays)
 
