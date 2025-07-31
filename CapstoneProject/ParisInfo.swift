//
//  HealthInfo.swift
//  CapstoneProject
//
//  Created by Scholar on 7/29/25.8
//

import SwiftUI

struct HealthInfo: View {
    var body: some View {
        
        Text("Paris")
            .font(.title)
            .fontWeight(.bold)
            .padding(.bottom, 22.0)
        
        Text("Paris, the capital of France is one of Europes most popular cities. Known for its iconic landmarks, world-class art and fashion, vibrant cafe culture, and romantic atmosphere. A popular and great place to travel")
            .padding(.bottom, 23.0)
        
        VStack() {
            Image("paris")
                .renderingMode(.none)
                .resizable(capInsets: EdgeInsets())
                .aspectRatio(contentMode: .fit)
            Text("Paris!")
                .font(.title)
                .fontWeight(.bold)
            Text(" ")
            
            Text("Common Illnesses:")
                .font(.title3)
                .fontWeight(.bold)
            
            Text("- Respiratory infections: Common cold, Flu, Bronchitis")
            Text("- Gastrointestinal illnesses: Traveler’s Diarrhea")
            Text(" ")
            
            Text("Air Quality:")
                .font(.title3)
                .fontWeight(.bold)
            
            Text("- Occasional problems with air quality")
            Text(" ")
            Text("Other things to note:")
                .font(.title3)
                .fontWeight(.bold)
            
            Text("- Pickpocketing")
            Text("- Bedbugs and measles")
            Text("- Terrorist groups threatening the city")
        }
    }
    }

#Preview {
    HealthInfo()
}
