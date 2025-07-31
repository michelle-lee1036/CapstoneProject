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
    
    @State private var selectedDestination: String? = nil
    
    var tripName = "Your trip ✈️"
    
    var body: some View {
        NavigationStack {
            
            VStack {
                Text("\(tripName)")
                    .font(.title)
                    .font(.system(size: 50))
                    .fontWeight(.heavy)
                
                //Display dates
                if let d1 = dates1.first, let d2 = dates1.last {
                    Text("Dates in \(dest1): \(formatted(d1)) - \(formatted(d2))")
                }
                
                if let d1 = dates2.first, let d2 = dates2.last {
                    Text("Dates in \(dest2): \(formatted(d1)) - \(formatted(d2))")
                }
                Spacer().frame(height: 50)
                
                VStack {
                    Text(dest1.capitalized)
                        .fontWeight(.bold)
                    Image(destinationImageName(for: dest1))
                        .resizable()
                        .scaledToFill()
                        .frame(height:200)
                        .frame(width:350)
                        .clipped()
                        .cornerRadius(10)
                    NavigationLink(destination: HealthInfo()) {
                        Text("Tap to learn more!")
                    }
                }
                .padding()
                .navigationBarBackButtonHidden(true)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color(red: 0.84, green: 0.92, blue: 0.98))
                        .shadow(color: .gray.opacity(0.6), radius: 5, x: 1, y: 1)
                )
                
                Spacer().frame(height: 40)
                
                VStack {
                    Text(dest2.capitalized)
                        .fontWeight(.bold)
                    Image(destinationImageName(for: dest2))
                        .resizable()
                        .scaledToFill()
                        .frame(height:200)
                        .frame(width:350)
                        .clipped()
                        .cornerRadius(10)
                    NavigationLink(destination: Tokyo()) {
                        Text("Tap to learn more!")
                    }
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color(red: 0.84, green: 0.92, blue: 0.98))
                )
                
            }
            .padding()
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
    
    func formatted(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}



#Preview {
    TripPage(dest1: "Paris",dest2: "Tokyo", dates1: [Date(), Calendar.current.date(byAdding: .day, value: 5, to: Date())!], dates2: [Date(), Calendar.current.date(byAdding: .day, value: 5, to: Date())!])
}
