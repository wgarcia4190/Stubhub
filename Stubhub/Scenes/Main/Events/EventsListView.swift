//
//  EventsListView.swift
//  Stubhub
//
//  Created by Wilson Garcia on 4/9/22.
//

import SwiftUI

struct EventsListView: View {
    @StateObject var viewModel = EventListViewModel()
    @State private var city: String = ""
    @State private var price: String = ""
    
    var body: some View {
        VStack(
            alignment: .leading,
            spacing: 10
        ) {
            HStack(
                alignment: .center, spacing: 10
            ) {
                VStack(
                    alignment: .leading
                ) {
                    HStack{
                      Text("City:")
                      TextField(
                        "Enter city..",
                        text: $city
                      ).padding()
                    }
                    
                    HStack{
                      Text("Price:")
                      TextField(
                        "Enter price..",
                        text: $price
                      ).keyboardType(.numberPad).padding()
                    }
                }
                Button(
                    action: {
                        viewModel.filterEvents(city: city, price: Double(price) ?? 0.0)
                    }, label: {
                        Text("Filter")
                    }
                )
            }.padding(.horizontal, 10)
            
            List(viewModel.filterEvents) { event in
                EventCell(event: event)
            }
            .listStyle(PlainListStyle())
            .onAppear {
                viewModel.getEvents()
            }
        }
        
    }
}
