//
//  HealthInfo.swift
//  CapstoneProject
//
//  Created by Scholar on 7/29/25.8
//

import SwiftUI

struct Tokyo: View {
    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            Image("tokyo")
                .renderingMode(.none)
                .resizable(capInsets: EdgeInsets())
                .aspectRatio(contentMode: .fit)
            Text("Tokyo!")
                .font(.title)
                .fontWeight(.bold)
            Text(" ")

            Text("Common Illnesses:")
                .font(.title3)
                .fontWeight(.bold)

            Text("- Respiratory infections: Common cold, influenza")
            Text("- Gastorintestinal illnesses: Travelers diarrhea, stomach flu")
            Text(" ")

            Text("Air Quality:")
                .font(.title3)
                .fontWeight(.bold)

            Text("- Generally good with occasional pollen")
            Text(" ")
            Text("Other things to note:")
                .font(.title3)
                .fontWeight(.bold)

            Text("- Possible natrual disasters: Earthquakes, typhoons, flooding")
                }
        }
}

#Preview {
    Tokyo()
}
