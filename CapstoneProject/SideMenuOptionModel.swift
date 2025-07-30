//
//  SideMenuOptionModel.swift
//  TestCapstone
//
//  Created by Scholar on 7/30/25.
// ONLY ONE THIS IS SwiftFile. The other ones are all SwiftUI Files

import Foundation

enum SideMenuOptionModel: Int, CaseIterable {
    case home
    case map
    case itinerary
    case health
    case packinglist
    case notifications
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .map:
            return "Map"
        case .itinerary:
            return "Itinerary"
        case .health:
            return "Health"
        case .packinglist:
            return"Packing List"
        case .notifications:
            return "Notifications"
        }
    }
    
    //ORIGINAL things from the video were dashboard, performance, profile, search, and notifications
    var systemImageName: String {
        switch self {
        case .home:
            return"house"
        case .map:
            return "map"
        case .itinerary:
            return "calendar"
        case .health:
        return "cross"
        case .packinglist:
            return "backpack"
        case .notifications:
            return "bell"
        }
    }
}

extension SideMenuOptionModel: Identifiable {
    var id: Int {return self.rawValue}
}

