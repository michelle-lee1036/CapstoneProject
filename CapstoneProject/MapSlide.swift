//
//  MapSlide.swift
//  CapstoneProject
//
//  Created by Scholar on 7/28/25.
//

import SwiftUI
import MapKit

struct Location {
    let name: String
    let coordinate: CLLocationCoordinate2D
    
}

let locationDict: [String: CLLocationCoordinate2D ] = [
    "Paris": CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522),
    "Tokyo": CLLocationCoordinate2D(latitude: 35.6764, longitude: 139.65),
    "New York": CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060),
    "Washington DC": CLLocationCoordinate2D(latitude: 38.9072, longitude: -77.0369)
]

struct MapSlide: View {
    //Variables
    @State private var position = MapCameraPosition.region(MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 38.91, longitude: -77.04), span: MKCoordinateSpan(latitudeDelta: 80, longitudeDelta: 80)
    )
    )
    @State private var dest1 = ""
    @State private var dest2 = ""
    @State private var showField2 = false
    @State private var showParis = false
    @State private var showTokyo = false
    @State private var showNewYork = false
    @State private var showLine = false
    @State private var showLine2 = false
    
    var body: some View {
        Map (position: $position){
            //Perm DC Marker
            Marker("Washington DC", coordinate: locationDict["Washington DC"]!)
            //Dest 1 marker
            if locationDict[dest1] != nil && showLine == true {
                Marker(dest1, coordinate: locationDict[dest1]!)
                MapPolyline(coordinates: [ locationDict["Washington DC"]!, locationDict[dest1]!])
                    .stroke(.red, lineWidth:3)
            }
            //Dest 2 marker
            if locationDict[dest1] != nil && locationDict[dest2] != nil && showLine2 == true {
                Marker(dest2, coordinate: locationDict[dest2]!)
                MapPolyline(coordinates: [ locationDict[dest1]!, locationDict[dest2]!])
                    .stroke(.red, lineWidth:3)
            }
            
        }
        VStack{
            HStack {
                if (showField2) {
                    TextField("Enter Destination 2", text: $dest2)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button("Submit") {
                        showLine2 = true
                        if locationDict[dest2] != nil {
                            if let coord = locationDict[dest2] {
                                position = MapCameraPosition.region(MKCoordinateRegion(center: coord, span: MKCoordinateSpan(latitudeDelta: 80, longitudeDelta: 80)))
                            }
                        }
                    }
                } else {
                    TextField("Enter Destination 1", text: $dest1)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button("Add") {
                        showLine = true
                        if locationDict[dest1] != nil {
                            if let coord = locationDict[dest1] {
                                position = MapCameraPosition.region(MKCoordinateRegion(center: coord, span: MKCoordinateSpan(latitudeDelta: 80, longitudeDelta: 80)))
                            }
                        }
                        showField2 = true
                        
                    }
                }
            }
            .padding()
            
        }
    }
}

#Preview {
    MapSlide()
}
