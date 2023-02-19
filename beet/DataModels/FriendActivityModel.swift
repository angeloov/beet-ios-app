//
//  FriendIsListeningModel.swift
//  beet
//
//  Created by Angelo Voicu on 16/02/23.
//

import Foundation
import BeetAPI

struct FriendActivity: Identifiable {
	var id: String
	var songName: String
	var artistName: String
	var albumCoverURI: String
	
	// User data
	var username: String
	var profilePicURI: String
}

class FriendActivityGetter: ObservableObject {
	@Published var activities = [FriendActivity]()
	
	func fetchAllFriendActivities() {
		apolloClient.fetch(query: GetAllFriendsActivitiesQuery()) { result in
			guard let data = try? result.get().data else { return }
				
			for friendActivity in data.getAllFriendsActivities {
				self.activities.append(FriendActivity(id: friendActivity?.id ?? "",
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
