//
//  TimeLineScreen.swift
//  TimeLine
//
//  Created by Kawai, Tomotaka | Monta | TMO on 2024/12/15.
//

import SwiftUI

struct TimeLineScreen: View {
    @EnvironmentObject private var coordinator: Coordinator
    // Sample data (replace with your actual data)
    let videos: [Video] = [
        Video(title: "The War of the Ring - Part 1", category: "Gaming", thumbnailImage: "war_of_the_ring.jpg", viewCount: 2300),
        Video(title: "The best of Twitch in March", category: "Twitch", thumbnailImage: "twitch_march.jpg", viewCount: 1500000),
        Video(title: "FIFA 22", category: "Gaming", thumbnailImage: "fifa_22.jpg", viewCount: 3400),
        // ... add more videos for Yesterday and Today
    ]

    var body: some View {
        NavigationView {
                List {
                    Section(header: Text("Today")) {
                        ForEach(videos.prefix(3)) { video in // Assuming first 3 are for Today
                            VideoRow(video: video)
                        }
                    }

                    Section(header: Text("Yesterday")) {
                        ForEach(videos.dropFirst(3)) { video in // Assuming rest are for Yesterday
                            VideoRow(video: video)
                        }
                    }
                }
                .navigationTitle("Timeline")
            }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    TimeLineScreen()
}
