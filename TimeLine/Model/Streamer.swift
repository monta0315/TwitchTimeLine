//
//  Streamer.swift
//  TimeLine
//
//  Created by Kawai, Tomotaka | Monta | TMO on 2024/12/15.
//

import SwiftUI

struct Streamer: Identifiable, Codable {
    let name: String
    let description: String
    let external_id: String
    let id: UUID
    let login: String
    let profile_image_url: String?
    let created_at: Date?
}

struct SocialMediaLink: Identifiable {
    // TODO: Remove below id and identifiable
    let id = UUID()
    let platform: String
    let url: String
}
