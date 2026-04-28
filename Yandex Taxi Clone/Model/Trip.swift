//
//  Trip.swift
//  Yandex Taxi Clone
//
//  Created by Nurtore on 28.04.2026.
//

import CoreLocation

enum TripState: Int {
    case requested
    case denied
    case accepted
    case driverArrived
    case inProgress
    case arrivedAtDestination
    case completed
}

struct Trip {
    var pickupCoordinates: CLLocationCoordinate2D!
    var destinationCoordinates: CLLocationCoordinate2D!
    let passengerUid: String!
    var driverUid: String?
    var state: TripState!
    
    init(passengerUid: String, dictionary: [String: Any]) {
        self.passengerUid = passengerUid
        
        if let pickupCoordiantes = dictionary["pickupCoordinates"] as? NSArray {
            guard let lat = pickupCoordiantes[0] as? CLLocationDegrees else { return }
            guard let long = pickupCoordiantes[1] as? CLLocationDegrees else { return }
            self.pickupCoordinates = CLLocationCoordinate2D.init(latitude: lat, longitude: long)
        }
        
        if let destinationCoordinates = dictionary["destinationCoordinates"] as? NSArray {
            guard let lat = destinationCoordinates[0] as? CLLocationDegrees else { return }
            guard let long = destinationCoordinates[1] as? CLLocationDegrees else { return }
            self.destinationCoordinates = CLLocationCoordinate2D.init(latitude: lat, longitude: long)
        }
        
        self.driverUid = dictionary["driverUid"] as? String ?? ""
        
        if let state = dictionary["state"] as? Int {
            self.state = TripState(rawValue: state)
        }
    }
}
