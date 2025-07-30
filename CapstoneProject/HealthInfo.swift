//
//  HealthInfo.swift
//  CapstoneProject
//
//  Created by Scholar on 7/29/25.
//

import SwiftUI

struct HealthInfo: View {
    var body: some View {
        Text("Paris")
            .font(.title)
            .fontWeight(.bold)
        Text("Common Illness")
            .font(.title3)
        Text("Respiratory infections: Common cold, Flu, Bronchitis")
        Text("Gastrointestinal illnessnes: Travelers Diarrhea")
        Text("Air Quality")
            .font(.title3)
        Text("Occsional problems with air quality")
        Text("Other things of note")
            .font(.title3)
        Text("Pick pocketing")
        Text("Bedbugs")
        Text("Terrorist groups threating the city")
        
    }
}

#Preview {
    HealthInfo()
}
