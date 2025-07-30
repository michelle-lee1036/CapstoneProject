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
            .padding(.bottom, 25.0)
            
        Text("Paris, the capital of France is one of Europes most popular cities. Known for its iconic landmarks, world-class art and fashion, vibrant cafe culture, and romantic atmosphere. A popular and great place to travel")
            .padding(.bottom, 23.0)
            
        Text("Common Illness")
            .font(.title3)
        Text("Respiratory infections: Common cold, Flu, Bronchitis")
        Text("Gastrointestinal illnessnes: Travelers Diarrhea")
            .padding(.bottom, 25.0)

        Text("Air Quality")
            .font(.title3)
        Text("Occsional problems with air quality")
            .padding(.bottom, 25.0)

        
        Text("Other things of note")
            .font(.title3)
        Text("Pick pocketing")
        Text("Bedbugs")
        Text("Terrorist groups threating the city as of 2025")
        
        
    }
}

#Preview {
    HealthInfo()
}
