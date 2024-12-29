//
//  TimeLineScreen.swift
//  TimeLine
//
//  Created by Kawai, Tomotaka | Monta | TMO on 2024/12/15.
//

import SwiftUI

struct TimeLineScreen: View {
    // Sample data (replace with your actual data)
    let videos: [Video] = [
        Video(title: "The War of the Ring - Part 1", category: "Gaming", thumbnailImage: "war_of_the_ring.jpg", videoURL: "https://youtu.be/El0qgOa0BW4?si=ZoVUeNb7sdTx21FG", viewCount: 2300, streamerName: "a"),
        Video(title: "The War of the Ring - Part 1", category: "Gaming", thumbnailImage: "war_of_the_ring.jpg", videoURL: "https://youtu.be/El0qgOa0BW4?si=ZoVUeNb7sdTx21FG", viewCount: 2300, streamerName: "a"),
        Video(title: "The War of the Ring - Part 1", category: "Gaming", thumbnailImage: "war_of_the_ring.jpg", videoURL: "https://youtu.be/El0qgOa0BW4?si=ZoVUeNb7sdTx21FG", viewCount: 2300, streamerName: "a"),
        // ... add more videos for Yesterday and Today
    ]

    var body: some View {
        NavigationView {
                List {
                    Section(header: Text("Today")) {
                        ForEach(videos.prefix(3)) { video in // Assuming first 3 are for Today
                            NavigationLink(destination: VideoDetailScreen(video: video)) {
                                VideoRow(video: video)
                            }
                        }
                    }

                    Section(header: Text("Yesterday")) {
                        ForEach(videos.dropFirst(3)) { video in // Assuming rest are for Yesterday
                            NavigationLink(destination: VideoDetailScreen(video: video)) {
                                VideoRow(video: video)
                            }
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
