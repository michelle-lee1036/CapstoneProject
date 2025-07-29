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
            MenuItem(text: "Share", imageName: "square.and.arrow.up"),
    ]
    
    var body: some View {
        ZStack {
            Color(UIColor(red: 43/255.0,
                          green: 40/255.0,
                          blue: 74/255.0, alpha: 1))
            
            VStack(alignment: .leading, spacing: 0)  {
                ForEach(items) { item in
                    HStack {
                        Image(systemName: item.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.white)
                            .frame(width: 32, height: 30, alignment: .center)
                        
                        Text(item.text)
                            .foregroundColor(Color.white)
                            .bold()
                            .font(.system(size:22))
                            .multilineTextAlignment(.leading)
                        
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
            //Dimmed background
            GeometryReader { _ in
             EmptyView()
            }
            .background(Color.gray.opacity(0.5))
            .opacity(self.menuOpened ? 1 : 0)
            .onTapGesture {
                withAnimation(.easeIn.delay(0.25)) {
                    self.toggleMenu()
                }
            }
            
            //MenuContent
            HStack {
                MenuContent()
                    .frame(width: width)
                    .offset(x: menuOpened ? 0 : -width)
              
                
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
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var countdownStarted = false
    
    //attempt at navigation bar
    @State var menuOpened = false
    
    var body: some View {
        NavigationStack {
            ZStack {
            if !menuOpened {
                Button(action: {
                    //Open Menu
                    self.menuOpened.toggle()
                }, label: {
                    Text("Open Menu")
                        .bold()
                        .foregroundColor(Color.white)
                        .frame(width: 50, height: 50, alignment: .center)
                        .background(Color(.systemBlue))
                })
                
                SideMenu(width: UIScreen.main.bounds.width/1.6,
                         menuOpened: menuOpened,
                         toggleMenu: toggleMenu)
            }
            //.edgesIgnoringSafeArea(.all)
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    self.menuOpened.toggle()
                }) {
                    Image(systemName: "line.horizontal.3")
                        .imageScale(.large)
                }
            }
        }
        .navigationTitle("Home")
    }
        //maybe add back the v stack
        Text("HEALTHMILES")
            .font(.largeTitle)
            .foregroundColor(Color(red: 0.416, green: 0.043, blue: 0.763))
        //above is the color of the text
            .frame(width:300, height:90)
            .border(Color.red, width: 5)
        //above is the color of the frame
        
        Divider()
            .frame(height: 3)
            .overlay(.black)
            .padding()
        Text("Home 🏡")
        
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
        .padding()
        
    }

             func formatTime(seconds: Int) -> String {
                 let d = seconds / 86400
                 let h = (seconds % 86400) / 3600
                 let m = (seconds % 3600) / 60
                 let s = seconds % 60
                 return String(format: "%02dd %02dh %02dm %02ds", d, h, m, s)
                 
                 //when the timer ends, it kinda just stays at the 00days, 00hours, 00minutes, 00seconds screen.
                 //so basically figure out how to properly add in the alert notification that the time is up and a way so that when the button is clicked, the program acknowledges that the user knows the time is up and then reverts back to the original page where you can set up another countdown timer
             }
    func toggleMenu() {
        menuOpened.toggle()
    }
         }


//how to add in navigation bar to the homepage so that the user can actually go to all the different slides that are going to be on the app.
//i tried the .toolbar thing, but it keeps saying that the toolbar thing can't be used in the view scope and i'm not sure why when it literally works in the about me and the navigation app thing we worked on together as a class.
//i also tried the other navigation bar thing that i out in the google doc (day 7), but it just looks unaesthetic, so i'm going to leave it as a last resort, also idk if the button thing on that work. (cause i have to remember that it has to be a navigation bar, not a bunch of displays)
        
#Preview {
    ContentView()
}

