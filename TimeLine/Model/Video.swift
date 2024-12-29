//
//  Video.swift
//  TimeLine
//
//  Created by Kawai, Tomotaka | Monta | TMO on 2024/12/15.
//
import SwiftUI

struct Video: Identifiable {
    let id = UUID()
    let title: String
    let category: String
    let thumbnailImage: String // Assuming you have image URLs
    let videoURL: String
    let viewCount: Int
    let streamerName: String
}
