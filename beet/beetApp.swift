//
//  beetApp.swift
//  beet
//
//  Created by Angelo Voicu on 27/12/22.
//

import SwiftUI

@main
struct beetApp: App {
	var body: some Scene {
		WindowGroup {
			TabView {
				ContentView()
					.tabItem {
						Label("Home", systemImage: "house")
					}
				SettingsView()
					.tabItem {
						Label("Settings", systemImage: "gear")
					}
			}
			
		}
	}
}
