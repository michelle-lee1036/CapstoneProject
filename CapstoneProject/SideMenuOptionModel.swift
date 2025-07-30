//
//  SideMenuOptionModel.swift
//  TestCapstone
//
//  Created by Scholar on 7/30/25.
// ONLY ONE THIS IS SwiftFile. The other ones are all SwiftUI Files

import Foundation

enum SideMenuOptionModel: Int, CaseIterable {
    case home
    case itinerary
    case map
    case health
    case notifications
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .itinerary:
            return "Itinerary"
        case .map:
            return "Map"
        case .health:
            return "Health"
        case .notifications:
            return "Notifications"
        }
    }
    
    //ORIGINAL things from the video were dashboard, performance, profile, search, and notifications
    var systemImageName: String {
        switch self {
        case .home:
            return"house"
        case .itinerary:
            return "calendar"
        case .map:
            return "map"
        case .health:
        return "cross"
        case .notifications:
            return "bell"
        }
    }
}

extension SideMenuOptionModel: Identifiable {
    var id: Int {return self.rawValue}
}

