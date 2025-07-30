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
    @State private var selectedDates: Set<DateComponents> = []
    @State private var showNextButton = false
    @State private var whichDest = 1
    var body: some View {
        if whichDest == 1 {
            VStack {
                Text("\(dest1)")
                    .foregroundColor(Color.blue)
                    .frame(alignment: .leading)
                    .font(.system(size:40))
                    .fontWeight(.ultraLight)
                Text("Itinerary")
                    .frame(alignment: .leading)
                    .font(.system(size:50))
                    .fontWeight(.heavy)
                summary
                if let days = tripLength {
                    if days > 1 {
                        Text("You will spend \(days) days in \(dest1)")
                    }
                }
                MultiDatePicker("Select a Date", selection: $selectedDates, in: Date.now...)
                    .frame(height: 400)
                    .onChange(of: selectedDates) {
                        if sortedDates.count == 2 {
                            showNextButton = true
                        } else {
                            showNextButton = false
                        }
                    }
                Button("Clear Dates") {
                    selectedDates = []
                }
                if showNextButton == true {
                    Button("Next"){
                        whichDest = 2
                    }
                }
            }
        } else if whichDest == 2 {
            VStack {
                Text("Itinerary")
                    .frame(alignment: .leading)
                    .font(.system(size:40))
                    .fontWeight(.heavy)
                summary
                if let days = tripLength {
                    if days > 1 {
                        Text("You will spend \(days) days in \(dest2)")
                    }
                }
                MultiDatePicker("Select a Date", selection: $selectedDates, in: Date.now...)
                    .frame(height: 400)
                    .onChange(of: selectedDates) {
                        if sortedDates.count == 2 {
                            showNextButton = true
                        } else {
                            showNextButton = false
                        }
                    }
                Button("Clear Dates") {
                    selectedDates = []
                }
                if showNextButton == true {
                    Button("Next"){
                        whichDest = 2
                    }
                }
            }
        }
    }
    var sortedDates: [Date] {
        selectedDates.compactMap { calendar.date(from: $0) }.sorted()
    }
    var summary: Text {
        if sortedDates.count == 2 {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return Text("From \(formatter.string(from: sortedDates.first!)) to \(formatter.string(from: sortedDates.last!))")
        } else if sortedDates.count > 2 {
            return Text("Select only two dates for the start and end!")
                .foregroundColor(.red)
        } else {
            return Text("Select a start and end date")
        }
    }
    var tripLength: Int? {
        guard let start = sortedDates.first, let end = sortedDates.last else {
            return nil
        }; return calendar.dateComponents([.day], from: start, to: end).day.map {$0 + 1}
    }
}

#Preview {
    Itinerary(dest1: "Paris",dest2:"New York")
}
