//
//  StubhubApp.swift
//  Stubhub
//
//  Created by Wilson Garcia on 4/9/22.
//

import SwiftUI

@main
struct StubhubApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                EventsListView()
                .navigationTitle("Event List")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
