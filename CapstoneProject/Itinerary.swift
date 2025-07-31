//
//  Itinerary.swift
//  CapstoneProject
//
//  Created by Scholar on 7/29/25.
//

import SwiftUI

struct Itinerary: View {
    
    let dest1: String
    let dest2: String
    
    @Environment(\.calendar) var calendar
    @State private var selectedDatesDest1: Set<DateComponents> = []
    @State private var selectedDatesDest2: Set<DateComponents> = []
    @State private var showNextButton = false
    @State private var whichDest = 1
    @State private var goToTripPage = false
    var body: some View {
            NavigationStack{
                ZStack(alignment: .top) {
                    Color(red:1.0,green:0.91,blue:0.93)
                        .ignoresSafeArea()
                    
                    Group {
                        if whichDest == 1 {
                            VStack (alignment: .center) {
                                VStack (spacing: 5) {
                                    Text("\(dest1)")
                                        .foregroundColor(Color(red:0.29,green:0.76,blue:0.655))
                                        .frame(alignment: .leading)
                                        .font(.system(size:40))
                                        .fontWeight(.ultraLight)
                                    Text("Itinerary")
                                        .frame(alignment: .leading)
                                        .font(.system(size:50))
                                        .fontWeight(.heavy)
                                        .foregroundColor(Color.black)
                                    summary1
                                    if let days = tripLength1 {
                                        if days > 1 {
                                            Text("You will spend \(days) days in \(dest1)")
                                        }
                                    }
                                }
                                .padding(.bottom, 80)
                                VStack {
                                    MultiDatePicker("Select a Date", selection: $selectedDatesDest1, in: Date.now...)
                                        .frame(height: 400)
                                        .onChange(of: selectedDatesDest1) {
                                            if sortedDatesDest1.count == 2 {
                                                showNextButton = true
                                            } else {
                                                showNextButton = false
                                            }
                                        }
                                        .background(Color(red: 0.85,green:0.40,blue:0.47))
                                        .cornerRadius(15)
                                        .overlay (
                                            RoundedRectangle(cornerRadius: 15)
                                                .stroke(Color(red:0.29,green:0.76,blue:0.655),lineWidth: 8)
                                        )
                                        .shadow(color: .gray.opacity(0.8), radius: 4, x: 5, y: -3)
                                        .frame(height: 400)
                                }
                                .padding(.bottom, 50)
                                VStack {
                                    Button("Clear Dates") {
                                        selectedDatesDest1 = []
                                    }
                                    if showNextButton == true {
                                        Button("Next"){
                                            whichDest = 2
                                            showNextButton = false
                                        }
                                    }
                                }
                            }
                        } else if whichDest == 2 {
                            VStack {
                                VStack (spacing: 5) {
                                    Text("\(dest2)")
                                        .foregroundColor(Color(red:0.91,green:0.55,blue:0.18))
                                        .frame(alignment: .leading)
                                        .font(.system(size:40))
                                        .fontWeight(.ultraLight)
                                    Text("Itinerary")
                                        .frame(alignment: .leading)
                                        .font(.system(size:40))
                                        .fontWeight(.heavy)
                                        .foregroundColor(Color.black)
                                    summary2
                                    if let days = tripLength2 {
                                        if days > 1 {
                                            Text("You will spend \(days) days in \(dest2)")
                                        }
                                    }
                                }
                                .padding(.bottom, 80)
                                VStack {
                                    MultiDatePicker("Select a Date", selection: $selectedDatesDest2, in: Date.now...)
                                        .frame(height: 400)
                                        .onChange(of: selectedDatesDest2) {
                                            if sortedDatesDest2.count == 2 {
                                                showNextButton = true
                                            } else {
                                                showNextButton = false
                                            }
                                        }
                                        .background(Color(red: 0.85,green:0.40,blue:0.47))
                                        .cornerRadius(15)
                                        .overlay (
                                            RoundedRectangle(cornerRadius: 15)
                                                .stroke(Color(red:0.91,green:0.55,blue:0.18),lineWidth: 8)
                                        )
                                        .shadow(color: .gray.opacity(0.8), radius: 4, x: 5, y: -3)
                                        .frame(height: 400)
                                }
                                .padding(.bottom, 50)
                                VStack {
                                    if !overlappingDates.isEmpty {
                                        Text("Your selected dates for \(dest2) overlap with your time in \(dest1) ⚠️")
                                            .multilineTextAlignment(.center)
                                            .foregroundColor(.red)
                                            .padding(.horizontal)
                                    }
                                    Button("Clear Dates") {
                                        selectedDatesDest2 = []
                                    }
                                    if showNextButton == true {
                                        Button("Confirm"){
                                            //                       confirmationScreen()
                                            goToTripPage = true
                                        }
                                        .disabled(!overlappingDates.isEmpty)
                                    }
                                }
                            }
                        }
                    }
                        .navigationDestination(isPresented: $goToTripPage) {
                        TripPage(dest1: dest1, dest2: dest2, dates1: sortedDatesDest1, dates2: sortedDatesDest2)
                    }
                }
        }
        
        
        var sortedDatesDest1: [Date] {
            selectedDatesDest1.compactMap { calendar.date(from: $0) }.sorted()
        }
        
        var sortedDatesDest2: [Date] {
            selectedDatesDest2.compactMap { calendar.date(from: $0) }.sorted()
        }
        
        var overlappingDates: [Date]{
            let dates1 = selectedDatesDest1.compactMap { calendar.date(from: $0) }
            let dates2 = selectedDatesDest2.compactMap { calendar.date(from: $0) }
            return dates1.filter { dates2.contains($0) }
        }
        
        var summary1: Text {
            if sortedDatesDest1.count == 2 {
                let formatter = DateFormatter()
                formatter.dateStyle = .long
                return Text("From \(formatter.string(from: sortedDatesDest1.first!)) to \(formatter.string(from: sortedDatesDest1.last!))")
            } else if sortedDatesDest1.count > 2 {
                return Text("Select only two dates for the start and end!")
                    .foregroundColor(.red)
            } else {
                return Text("Select a start and end date")
            }
        }
        
        var summary2: Text {
            if sortedDatesDest2.count == 2 {
                let formatter = DateFormatter()
                formatter.dateStyle = .long
                return Text("From \(formatter.string(from: sortedDatesDest2.first!)) to \(formatter.string(from: sortedDatesDest2.last!))")
            } else if sortedDatesDest2.count > 2 {
                return Text("Select only two dates for the start and end!")
                    .foregroundColor(.red)
            } else {
                return Text("Select a start and end date")
            }
        }
        
        
        var tripLength1: Int? {
            guard let start = sortedDatesDest1.first, let end = sortedDatesDest1.last else {
                return nil
            }; return calendar.dateComponents([.day], from: start, to: end).day.map {$0 + 1}
        }
        
        var tripLength2: Int? {
            guard let start = sortedDatesDest2.first, let end = sortedDatesDest2.last else {
                return nil
            }; return calendar.dateComponents([.day], from: start, to: end).day.map {$0 + 1}
        }
    }
    
//    func confirmationScreen() -> String {
//        let formatter = DateFormatter()
//        formatter.dateStyle = .long
//        return ("Your trip in \(dest1) is from \(formatter.string(from: sortedDatesDest1.first!)) to \(formatter.string(from: sortedDatesDest1.last!)). Your trip in \(dest2) is from \(formatter.string(from:sortedDatesDest2.first!)) to \(formatter.string(from:sortedDatesDest2.last!))")
//    }
}

#Preview {
    Itinerary(dest1: "Paris",dest2:"Tokyo")
}
