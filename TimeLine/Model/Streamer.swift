//
//  Streamer.swift
//  TimeLine
//
//  Created by Kawai, Tomotaka | Monta | TMO on 2024/12/15.
//

import SwiftUI

struct Streamer: Identifiable {
    let id = UUID()
    let name: String
    let games: [String]
    let profileImageUrl: String
    let socialMediaLinks: [SocialMediaLink]
    let recentVideos: [Video]
}

struct SocialMediaLink: Identifiable {
    // TODO: Remove below id and identifiable
    let id = UUID()
    let platform: String
    let url: String
}
