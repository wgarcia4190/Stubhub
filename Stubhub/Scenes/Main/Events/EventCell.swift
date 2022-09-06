//
//  EventCell.swift
//  Stubhub
//
//  Created by Wilson Garcia on 4/9/22.
//

import SwiftUI

struct EventCell: View {
    let event: EventData
    
    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 10
        ) {
            Text(event.name)
            Text(event.city)
            Text("$\(event.price)")
        }
    }
}
