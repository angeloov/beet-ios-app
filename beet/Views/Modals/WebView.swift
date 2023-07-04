//
//  WebViewModel.swift
//  beet
//
//  Created by Angelo Voicu on 04/03/23.
//

import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
	var url: URL
	@Binding var showWebView: Bool
	@Binding var isAuthenticated: Bool
	
	func makeUIView(context: Context) -> WKWebView {
		let conf = WKWebViewConfiguration()
		conf.userContentController = WKUserContentController()
		
		let messageHandler = MessageHandlerCoordinator(showWebView: $showWebView, isAuthenticated: $isAuthenticated)
		conf.userContentController.add(messageHandler, name: "sendDataToiOSClient")
		
		let rect = CGRect()
		
		let view = WKWebView(frame: rect, configuration: conf)
		view.load(URLRequest(url: url))
		return view
	}
	
	func updateUIView(_ webView: WKWebView, context: Context) {
		let request = URLRequest(url: url)
		webView.load(request)
	}
	
	class MessageHandlerCoordinator: NSObject, WKScriptMessageHandler {
		var showWebView: Binding<Bool>
		var isAuthenticated: Binding<Bool>
		
		init(showWebView: Binding<Bool>, isAuthenticated: Binding<Bool>) {
			self.showWebView = showWebView
			self.isAuthenticated = isAuthenticated
		}
		
		func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
			let serverResponse = message.body as! NSDictionary // Got this response from the WebView through JavaScript
			
			let auth = Auth(accessToken: serverResponse["access_token"] as! String,
			 								 refreshToken: serverResponse["refresh_token"] as! String)

			let account = "spotify"
			let service = "token"
			
			KeychainHelper.standard.save(auth, service: service, account: account)
			
			showWebView.wrappedValue.toggle()
			isAuthenticated.wrappedValue.toggle()
		}
	}
}
