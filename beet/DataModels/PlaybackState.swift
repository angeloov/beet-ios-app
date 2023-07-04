//
//  FriendIsListening.swift
//  beet
//
//  Created by Angelo Voicu on 16/02/23.
//

import Foundation

struct PlaybackState: Identifiable {
	var id: String
	var songName: String
	var artistName: String
	var albumCoverURI: String
	
	// User data
	var username: String
	var profilePicURI: String
}
