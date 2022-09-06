//
//  Event+Extension.swift
//  Stubhub
//
//  Created by Wilson Garcia on 4/9/22.
//

import Foundation

extension Event {
    
    func getEventsDetail() -> [EventData] {
        var events = self.events
        
        if self.children.isEmpty {
            return events
        }
        
        events.append(contentsOf: iterateChildren(self))
        return events
        
    }
    
    private func iterateChildren(_ event: Event) -> [EventData] {
        var events = self.events
        
        if event.children.isEmpty {
            return event.events
        }
        
        event.children.forEach { child in
            events.append(contentsOf: iterateChildren(child))
        }
        
        return events
    }
}
