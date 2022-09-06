//
//  EventListViewModel.swift
//  Stubhub
//
//  Created by Wilson Garcia on 4/9/22.
//

import Foundation

class EventListViewModel: ObservableObject {
    @Published private(set) var filterEvents = [EventData]()
    private var events = [EventData]()
    
    func getEvents()  {
        guard let url = Bundle.main.url(forResource: "data", withExtension: "json") else {
            print("Json file not found")
            return
        }
            
        let data = try? Data(contentsOf: url)
        let event = try? JSONDecoder().decode(Event.self, from: data!)
        events = event?.getEventsDetail() ?? []
        filterEvents = events
    }
    
    func filterEvents(city: String, price: Double) {
        if !city.isEmpty && price > 0.0 {
            filterEvents = events.filter {
                $0.city.contains(city) && $0.price <= price
            }
            return
        }
        
        if !city.isEmpty {
            filterEvents = events.filter {
                $0.city.contains(city)
            }
            return
        }
        
        if price > 0.0 {
            filterEvents = events.filter {
                $0.price <= price
            }
            return
        }
        
        filterEvents = events
    }
}
