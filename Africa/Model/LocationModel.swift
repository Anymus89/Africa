//
//  LocationModel.swift
//  Africa
//
//  Created by Manuel Martinez on 05/07/22.
//

import Foundation
import MapKit

struct NationalParkLocation: Codable, Identifiable {
    let id: String
    let name: String
    let image: String
    let latitude: Double
    let longitude: Double
    
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: self.latitude, longitude: self.longitude)
    }
}
