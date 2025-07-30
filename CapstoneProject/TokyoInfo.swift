//
//  TokyoInfo.swift
//  CapstoneProject
//
//  Created by Scholar on 7/30/25.
//

import SwiftUI

struct TokyoInfo: View {
    var body: some View {
        Text("Tokyo")
            .font(.title)
            .fontWeight(.bold)
            .padding(.bottom, 25.0)
        Text("Tokyo is one of Japans most infamous cities. It is known for its beautiful mix of modern and traditional architecture and amazing food. ")
            .padding(.bottom, 23.0)
        
        Text("Common Illnesses")
            .font(.title3)
        Text("Respiratory infections: Common cold, influenza")
        Text("Gastorintestinal  illnesses: Travelers diarrhea, stomach flu")
            .padding(.bottom, 25.0)
        
        Text("Air Quality")
            .font(.title3)
        Text("Generally good with occasional pollen")
            .padding(.bottom, 25.0)
        Text("Other Things of note")
            .font(.title3)
        Text("Possible natrual disasters: Earthquakes, typhoons, flooding")
    }
}

#Preview {
    TokyoInfo()
}
