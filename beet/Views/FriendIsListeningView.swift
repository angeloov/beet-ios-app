//
//  FriendIsListeningView.swift
//  beet
//
//  Created by Angelo Voicu on 28/12/22.
//

import SwiftUI

struct FriendIsListeningView: View {
	var profilePicURI: String
	var username: String
	var songName: String
	var artistName: String
	var albumCoverURI: String
	
	var body: some View {
		VStack {
			HStack {
				AsyncImage(url: URL(string: profilePicURI)) { image in
					image.resizable()
				} placeholder: {
					ProgressView()
				}
					.frame(width: 48, height: 48)
					.cornerRadius(10.0)
				
				Text("\(username) sta ascoltando")
					.font(Font.custom("Helvetica Now Display", size: 16))
			}
			.frame(maxWidth: .infinity, alignment: .leading)
			
			HStack {
				AsyncImage(url: URL(string: albumCoverURI)) { image in
					image.resizable()
				} placeholder: {
					ProgressView()
				}
					.frame(width: 120, height: 120)
					.cornerRadius(12)
				
				VStack(alignment: .leading) {
					Spacer()
					Text(songName)
						.font(Font.custom("Helvetica Now Display", size: 20))
						.fontWeight(.bold)
					
					Text("di \(artistName)")
						.font(Font.custom("Helvetica Now Display", size: 16))
				}
				.frame(maxHeight: 120)
			}
			.frame(maxWidth: .infinity, alignment: .leading)
			
		}
		.padding(16)
		.background(Color.init(hex: 0x1E1E1E))
		.cornerRadius(20.0)
	}
}

struct FriendIsListeningView_Previews: PreviewProvider {
	static var previews: some View {
		FriendIsListeningView(profilePicURI: "https://dummyimage.com/48/dedff7/fff", username: "Angelo", songName: "Ready For It?", artistName: "Taylor Swift", albumCoverURI: "https://dummyimage.com/120/ababab/fff").preferredColorScheme(ColorScheme.dark)
		
	}
}
