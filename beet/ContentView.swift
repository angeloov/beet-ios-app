//
//  ContentView.swift
//  beet
//
//  Created by Angelo Voicu on 27/12/22.
//

import SwiftUI

struct ContentView: View {
	var body: some View {
		TabView {
			HomeView()
				.padding()
				.tabItem {
					Label("Home", systemImage: "house")
				}
			SettingsView()
				.padding()
				.tabItem {
					Label("Settings", systemImage: "gear")
				}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
