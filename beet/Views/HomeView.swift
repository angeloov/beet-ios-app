//
//  HomeView.swift
//  beet
//
//  Created by Angelo Voicu on 27/12/22.
//

import SwiftUI

struct HomeView: View {
	@Environment(\.colorScheme) var colorScheme
	@ObservedObject var playbackStates = PlaybackStatesModel()
	
	var body: some View {
		NavigationView {
			VStack {
				Section {
					Image(colorScheme == ColorScheme.dark ?
								"beet-logo-dark" : "beet-logo-light")
				}
				.padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
				
				ScrollView {
					VStack(alignment: .leading) {
						Text("Ciao, Angelo")
							.font(Font.custom("Helvetica Now Display", size: 28))
							.fontWeight(.heavy)
							.applyBeetGradient()
						
						Text("Ecco cosa stanno ascoltando i tuoi amici")
							.font(Font.custom("Helvetica Now Display", size: 18))
							.fontWeight(.medium)
							.applyBeetGradient()
						
						// Text()
						
						ForEach(playbackStates.activities, id: \.id, content: { el in
							FriendIsListeningView(profilePicURI: el.profilePicURI, username: el.username, songName: el.songName, artistName: el.artistName, albumCoverURI: el.albumCoverURI)
						})
						
					}
					.padding(12.0)
					.frame(maxWidth: .infinity, alignment: .leading)

					Spacer()
				}
				Spacer()
			}
		}
		.onAppear(perform: {
			// playbackStates.emptyActivitiesArray()
			// playbackStates.fetchAllFriendActivities()
			
			let credentials = KeychainHelper.standard.read(service: "token", account: "spotify", type: Auth.self)
			
			if (credentials != nil) {
				print("\n\n\n\n\n")
				print(credentials!.accessToken)
				
				playbackStates.getMyState(accessToken: credentials!.accessToken)
			}
			
			
		})
		
	}
		
	
}

struct HomeView_Previews: PreviewProvider {
	static var previews: some View {
		HomeView().preferredColorScheme(ColorScheme.dark)
	}
}
