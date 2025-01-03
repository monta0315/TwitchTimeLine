//
//  VideoDetailScreen.swift
//  TimeLine
//
//  Created by Kawai, Tomotaka | Monta | TMO on 2024/12/29.
//

import SwiftUI

struct VideoDetailScreen: View {
    let video: Video

    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                Image(video.thumbnailImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .clipped() // Clip the image to fit the frame

                HStack {
                    Button(action: {
                        if let url = URL(string: video.videoURL) {
                            UIApplication.shared.open(url)
                        }
                    }) {
                        Image(systemName: "play.fill")
                            .font(.system(size: 40))
                            .foregroundColor(.white)
                    }
                }
                .padding()
            }

            Text(video.streamerName)
                .font(.headline)

            Text("\(video.title) • \(video.viewCount)")
                .font(.subheadline)
                .foregroundColor(.gray)

            HStack {
                Button("Follow") {
                    // Handle follow action
                }
                .buttonStyle(.borderedProminent)

                Button("Share") {
                    // Handle share action
                }
                .buttonStyle(.bordered)
            }
            .padding(.top)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}

#Preview {
    return VideoDetailScreen(video: TestData.testVideo())
}
