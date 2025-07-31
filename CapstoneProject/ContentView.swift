//
//  ContentView.swift
//  CapstoneProject
//
//  Created by Scholar on 7/28/25.
//

import SwiftUI

struct ContentView: View {
    @State private var showMenu = false
    @State private var selectedTab = 0
    
    @State private var newToDoItem = ItemNeeded(title: "", isImportant: false)
    @State private var showNewTask = false
    
    @State private var dest1 = ""
    @State private var dest2 = ""
    @State private var dates1: [Date] = []
    @State private var dates2: [Date] = []
    
    var body: some View {
        NavigationStack {
            ZStack {
                TabView(selection: $selectedTab) {
                    HomePage()
                        .tag(0)
                    
                    MapSlide()
                        .tag(1)
                    
                    Itinerary(dest1: dest1, dest2: dest2)
                        .tag(2)
                    
                    TripPage(dest1: dest1, dest2: dest2, dates1: dates1, dates2: dates2)
                        .tag(3)
                    
                    PackingList()
                        .tag(4)
                    
                }
                
                SideMenuView(isShowing: $showMenu, selectedTab: $selectedTab)
            }
            .toolbar(showMenu ? .hidden: .visible, for: .navigationBar)
                .navigationTitle("HealthMiles")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {
                            showMenu.toggle()
                        }, label: {
                            Image(systemName: "line.3.horizontal")
                        })
                    }
                }
            }
        }
    }

#Preview {
    ContentView()
}
        
        //how to add in navigation bar to the homepage so that the user can actually go to all the different slides that are going to be on the app. (NEED BUTTONS, but HOW)
        //figured out the navigation bar thing
        //need to figure out how to make the countdown clock less work for user
        //we need to do the calculation, not them adding in all the hours, minutes, and seconds, and stuff
        
        //at the very end make everything look aesthetic with the nice colors

