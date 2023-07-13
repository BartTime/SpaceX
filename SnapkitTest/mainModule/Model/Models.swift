//
//  Model.swift
//  SnapkitTest
//
//  Created by Alex on 16.08.2022.
//

import Foundation

struct InfoForRocket: Decodable {
    var height: Height
    var diameter: Diameter
    var mass: Mass
    var payload_weights: [Payload_weights]
    
    var first_stage: First_stage
    var second_stage: Second_stage
    
    var first_flight: String
    var cost_per_launch: Int
    
    var name: String
    
    var flickr_images: [String]
}

struct Height: Decodable {
    var meters: Double?
    var feet: Double?
}

struct Diameter: Decodable {
    var meters: Double?
    var feet: Double?
}

struct Mass: Decodable {
    var kg: Int
    var lb: Int
}

struct Payload_weights: Decodable {
    var kg: Int
    var lb: Int
}

struct First_stage: Decodable {
    var engines: Int
    var fuel_amount_tons: Double
    var burn_time_sec: Int?
}

struct Second_stage: Decodable {
    var engines: Int
    var fuel_amount_tons: Double
    var burn_time_sec: Int?
}


