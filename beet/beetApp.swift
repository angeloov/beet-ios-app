//
//  beetApp.swift
//  beet
//
//  Created by Angelo Voicu on 27/12/22.
//

import SwiftUI

@main
struct beetApp: App {
	@StateObject var authentication = AuthenticationHandler()
	
	var body: some Scene {
		WindowGroup {
			if authentication.isAuthenticated {
				ContentView()
					.environmentObject(authentication)
			} else {
				LoginView()
					.environmentObject(authentication)
			}
			
		}
	}
}
