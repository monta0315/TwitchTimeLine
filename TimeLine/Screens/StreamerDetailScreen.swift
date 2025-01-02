//
//  StreamerDetailScreen.swift
//  TimeLine
//
//  Created by Kawai, Tomotaka | Monta | TMO on 2025/01/02.
//

import SwiftUI

struct StreamerDetailScreen: View {
    let streamer: Streamer

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                AsyncImage(url: URL(string: streamer.profileImageUrl)) { image in
                    image.resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .clipShape(Circle())
                } placeholder: {
                    ProgressView()
                }
                .frame(width: UIScreen.main.bounds.width)

                Text(streamer.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 16)

                Text("Games: \(streamer.games.joined(separator: ", "))")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .padding(.top, 8)

                // Social Media Links
                VStack(alignment: .leading) {
                    ForEach(streamer.socialMediaLinks) { link in
                        Link(destination: URL(string: link.url)!) {
                            HStack {
                                Image(systemName: "globe")
                                Text(link.platform)
                            }
                        }
                    }
                }
                .padding(.top, 16)

                // Recent Videos (Example)
                Text("Recent Videos")
                    .font(.headline)
                    .padding(.top, 16)

                List {
                    ForEach(streamer.recentVideos) { video in
                        VideoRow(video: video)
                    }
                }
                .frame(height: 200) // Adjust height as needed
            }
            .padding()
        }
        .navigationTitle(streamer.name)
    }
}

#Preview {
    StreamerDetailScreen(streamer: TestData.testStreamer)
}
