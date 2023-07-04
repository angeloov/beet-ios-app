//
//  PlaybackStatesModel.swift
//  beet
//
//  Created by Angelo Voicu on 03/07/23.
//

import Foundation
import BeetAPI

class PlaybackStatesModel: ObservableObject {
	@Published var activities = [PlaybackState]()
	@Published var myActivity: PlaybackState?
	
	func getMyState(accessToken: String) {
		DispatchQueue.main.async {
			let url = URL(string: "https://api.spotify.com/v1/me/player")!
			
			var request = URLRequest(url: url)
			request.httpMethod = "GET"
			request.setValue("Authorization", forHTTPHeaderField: "Bearer \(accessToken)")
		
			let task = URLSession.shared.dataTask(with: request) { data, response, error in
				if let data = data {
					let str = String(decoding: data, as: UTF8.self)
					print(str)
				} else if let error = error {
					print("HTTP Request Failed \(error)")
				}
			}
			
			task.resume()
		}
	}
	
	func fetchAllFriendActivities() {
		apolloClient.fetch(query: GetAllFriendsActivitiesQuery()) { result in
			guard let data = try? result.get().data else { return }
				
			for friendActivity in data.getAllFriendsActivities {
				self.activities.append(PlaybackState(id: friendActivity?.id ?? "",
																							songName: friendActivity?.songName ?? "",
																							artistName: friendActivity?.artistName ?? "",
																							albumCoverURI: friendActivity?.albumCoverURI ?? "",
																							username: friendActivity?.friend.username ?? "",
																							profilePicURI: friendActivity?.friend.profilePicURI ?? ""))
			}
		}
	}
	
	func emptyActivitiesArray() {
		activities.removeAll()
	}
}
