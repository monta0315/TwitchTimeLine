//
//  TestData.swift
//  TimeLine
//
//  Created by Kawai, Tomotaka | Monta | TMO on 2025/01/02.
//

import Foundation

let socialMediaLink = SocialMediaLink(platform: "Twitter", url: "https://x.com/lazvell?ref_src=twsrc%5Egoogle%7Ctwcamp%5Eserp%7Ctwgr%5Eauthor")
let sampleImageUrl = "https://zetadivision.com/wp-content/uploads/2020/04/ZETADIVISION_Laz_square-3.jpg"
let sampleVideoUrl = "https://www.twitch.tv/videos/2334640849"


enum TestData {
    static let testStreamer = Streamer(name: "test", games: ["APEX, VALORANT"], profileImageUrl: sampleImageUrl, socialMediaLinks: [socialMediaLink, socialMediaLink, socialMediaLink], recentVideos: [testVideo(), testVideo(), testVideo()])
    static func testVideo() -> Video { 
        let randomDate = { Calendar.current.date(byAdding: .day, value: -Int.random(in: 0...15), to: Date())!}()
        return Video(title: "本番！- でびくら杯 本選日", category: "Game", thumbnailImage: sampleImageUrl, videoURL: sampleVideoUrl, viewCount: 30000, streamerName: "Laz", started_at: randomDate)
    }
}
