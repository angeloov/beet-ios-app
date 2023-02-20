//
//  Autentication.swift
//  beet
//
//  Created by Angelo Voicu on 20/02/23.
//

import SwiftUI

class AuthenticationHandler: ObservableObject {
	@Published var isAuthenticated: Bool
	
	init() {
		isAuthenticated = false
	}
	
	func login(_ username: String, _ password: String) {
		DispatchQueue.main.async {
			print("\(username), \(password)")
			withAnimation {
				self.isAuthenticated.toggle()
			}
		}
	}
}
