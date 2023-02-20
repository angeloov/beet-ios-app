//
//  LoginView.swift
//  beet
//
//  Created by Angelo Voicu on 20/02/23.
//

import SwiftUI

@MainActor
struct LoginView: View {
	@EnvironmentObject var authentication: AuthenticationHandler
	
	@State private var username: String = ""
	@State private var password: String = ""
	
	var body: some View {
		VStack {
			Form {
				TextField("Username", text: $username)
					.textInputAutocapitalization(.never)
					.disableAutocorrection(true)
				
				SecureField("Password", text: $password)
					.textInputAutocapitalization(.never)
					.disableAutocorrection(true)
				
				Button(action: {
					authentication.login(username, password)
				}, label: {
					Text("Login")
				})
			}
		}
	}
}

struct LoginView_Previews: PreviewProvider {
	static var previews: some View {
		LoginView()
	}
}
