//
//  WatchAppApp.swift
//  WatchApp WatchKit Extension
//
//  Created by user on 06.06.2021.
//

import SwiftUI

@main
struct WatchAppApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
