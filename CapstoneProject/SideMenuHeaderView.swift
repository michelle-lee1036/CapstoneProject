//
//  SideMenuHeaderView.swift
//  TestCapstone
//
//  Created by Scholar on 7/30/25.
//

import SwiftUI

struct SideMenuHeaderView: View {
    var body: some View {
        HStack {
            Image(systemName: "line.horizontal.3")
                .imageScale(.large)
                .foregroundStyle(.white)
                .frame(width: 43, height: 43)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding(.vertical)
            
            VStack(alignment: .leading, spacing: 6) {
                Text("Navigation Bar")
                    .font(.title)
                
               
            }
        }
    }
}

#Preview {
    SideMenuHeaderView()
}

