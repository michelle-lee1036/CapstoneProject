//
//  SideMenuRowView.swift
//  TestCapstone
//
//  Created by Scholar on 7/30/25.
//

import SwiftUI

struct SideMenuRowView: View {
    let option: SideMenuOptionModel
    @Binding var selectedOption: SideMenuOptionModel?
    
    private var isSelected: Bool {
        return selectedOption == option
    }
    
    var body: some View {
        HStack {
            Image(systemName: option.systemImageName)
                .foregroundColor(.white)
                .imageScale(.small)
                
            Text(option.title)
                .foregroundColor(.white)
                .font(.subheadline)
            
            Spacer()
        }
        .padding(.leading)
        .foregroundStyle(isSelected ? .blue: .primary)
        .frame(width: 216, height: 44)
        .background(
            isSelected
            ? Color(red: 1.10, green: 0.69, blue: 0.64).opacity(0.15)
            : .clear
        )
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    SideMenuRowView(option: .home, selectedOption: .constant(.home))
}

