//
//  TripPage.swift
//  CapstoneProject
//
//  Created by Scholar on 7/30/25.
//

import SwiftUI

struct TripPage: View {
    
    let dest1: String
    let dest2: String
    let dates1: [Date]
    let dates2: [Date]
    
    var tripName = "Your trip ✈️"
    var body: some View {
        Text("\(tripName)")
            .font(.title)
            .font(.system(size: 50))
            .fontWeight(.heavy)
    }
}

struct DestinationCard: View {
    let destination: String
    
    var body: some View {
        VStack{
            Text(destination)
            Image(destinationImageName(for: destination))
                .resizable()
            Text("Tap to learn more!")
        }
    }
    
    func destinationImageName(for dest: String) -> String {
        let lower = dest.lowercased()
        if lower.contains("paris") {
            return "paris"
        } else if lower.contains("tokyo") {
            return "tokyo"
        } else if lower.contains("new york") {
            return "newyork"
        } else {
            return "default"
        }
    }
}

#Preview {
    TripPage()
}
