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

let locations = [
    Location(name: "Paris", coordinate: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522)),
    Location(name: "Tokyo", coordinate: CLLocationCoordinate2D(latitude: 35.6764, longitude: 139.65)),
    Location(name: "New York", coordinate: CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060))
    
]

struct MapSlide: View {
    @State private var position = MapCameraPosition.region(MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 38.91, longitude: -77.04), span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
        )
    )
    var body: some View {
        Map {
            ForEach(locations, id: \.name) { location in
                Marker(location.name, coordinate: location.coordinate)
            }
        }
        VStack{
            HStack(spacing: 50) {
                Button("Paris") {
                    position = MapCameraPosition.region(
                        MKCoordinateRegion(
                            center: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522),
                            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
                        )
                    )
                }

                Button("Tokyo") {
                    position = MapCameraPosition.region(
                        MKCoordinateRegion(
                            center: CLLocationCoordinate2D(latitude: 35.6897, longitude: 139.6922),
                            span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)
                        )
                    )
                }
            }
        }
        
    }
}

#Preview {
    MapSlide()
}
