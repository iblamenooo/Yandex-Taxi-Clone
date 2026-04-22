//
//  Service.swift
//  Yandex Taxi Clone
//
//  Created by Nurtore on 22.04.2026.
//


import Firebase
import CoreLocation
import GeoFire

//MARK: - DatabaseRefs

let DB_REF = Database.database().reference()
let REF_USERS = DB_REF.child("users")
let REF_DRIVER_LOCATIONS = DB_REF.child("driver-locations")
let REF_TRIPS = DB_REF.child("trips")
