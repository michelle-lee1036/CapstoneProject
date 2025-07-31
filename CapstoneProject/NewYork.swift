//
//  NewYork.swift
//  CapstoneProject
//
//  Created by Scholar on 7/29/25.8
//

import SwiftUI

struct NewYork: View {
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            Image("newyork")
                .renderingMode(.none)
                .resizable(capInsets: EdgeInsets())
                .aspectRatio(contentMode: .fit)

            Text("New York!")
                .font(.title)
                .fontWeight(.bold)
            Text("  ")

            Text("Common Illnesses:")
                .font(.title3)
                .fontWeight(.bold)

            Text("- Legionnaires disease, transmitted through inhaling contaminated water vapor")
            Text(" ")
            
            Text("Air Quality:")
                .font(.title3)
                .fontWeight(.bold)

            Text("- Wildfire smoke")
            Text("- Pollution")
            Text("- High ozone days (often in July-August)")
            Text(" ")
            Text("Other things to note:")
                .font(.title3)
                .fontWeight(.bold)

            Text("- Petty theft")
            Text("- Scams targeting tourists")
            Text("- Drug use in public spaces")
        }
            }
}

#Preview {
    NewYork()
}
