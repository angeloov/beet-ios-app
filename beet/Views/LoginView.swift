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
				Text("Spotify Login")
			}
			.sheet(isPresented: $showWebView) {
				let spotifyURLString = "https://accounts.spotify.com/authorize?response_type=code&client_id=bc8a41fc9f824cfc80b879e43a2c6c59&scope=user-read-private%20user-read-email%20user-read-playback-state&redirect_uri=http://localhost/api/spotify-login-callback/"
				
				let spotifyURL = URL(string: spotifyURLString)!
				
				WebView(url: spotifyURL, showWebView: $showWebView, isAuthenticated: $authentication.isAuthenticated)
			}
		}
	}
}

struct LoginView_Previews: PreviewProvider {
	static var previews: some View {
		LoginView()
	}
}
