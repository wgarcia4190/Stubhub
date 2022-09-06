//
//  Event.swift
//  Stubhub
//
//  Created by Wilson Garcia on 4/9/22.
//

import Foundation

struct Event: Codable, Identifiable {
    let id: Int
    let name: String
    let events: [EventData]
    let children: [Event]
}

struct EventData: Codable, Identifiable {
    let id: Int
    let name: String
    let venueName: String
    let city: String
    let price: Double
}
