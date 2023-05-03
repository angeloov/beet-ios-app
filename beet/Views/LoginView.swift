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
	
	@State private var showWebView = false
	
	var body: some View {
		VStack {
			Text("Login")
				.bold()
			
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
			
			
			Button {
				showWebView.toggle()
			} label: {
				Text("Link")
			}
			.sheet(isPresented: $showWebView) {
				WebView(url: URL(string: "http://localhost:8888/login")!, showWebView: $showWebView)
			}
			
		}
	}
}

struct LoginView_Previews: PreviewProvider {
	static var previews: some View {
		LoginView()
	}
}
