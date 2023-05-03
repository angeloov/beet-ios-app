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
			
			let url = URL(string: "http://192.168.178.59/api/login")!
			
			var request = URLRequest(url: url)
			request.httpMethod = "POST"
			request.setValue("application/json", forHTTPHeaderField: "Content-Type")
			
			let parameters = ["username": username, "password": password]
			let jsonData = try? JSONSerialization.data(withJSONObject: parameters)

			request.httpBody = jsonData

			let task = URLSession.shared.dataTask(with: request) { data, response, error in
				if let data = data {
					let str = String(decoding: data, as: UTF8.self)
					print(str)
				} else if let error = error {
					print("HTTP Request Failed \(error)")
				}
			}
			
			task.resume()
			
			withAnimation {
				// self.isAuthenticated.toggle()
			}
		}
	}
}
