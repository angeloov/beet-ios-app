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

	func makeUIView(context: Context) -> WKWebView {
		let conf = WKWebViewConfiguration()
		conf.userContentController = WKUserContentController()
		
		let messageHandler = MessageHandlerCoordinator(showWebView: $showWebView)
		conf.userContentController.add(messageHandler, name: "sendDataToClient")
		
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
		
		init(showWebView: Binding<Bool>) {
			self.showWebView = showWebView
		}
		
		func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
			print(message.body)
			showWebView.wrappedValue.toggle()
		}
	}
}
