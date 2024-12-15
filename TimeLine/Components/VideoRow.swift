//
//  VideoRow.swift
//  TimeLine
//
//  Created by Kawai, Tomotaka | Monta | TMO on 2024/12/15.
//

import SwiftUI

struct VideoRow: View {
    let video: Video

    var body: some View {
        HStack {
            AsyncImage(url: URL(string: video.thumbnailImage)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80)
            } placeholder: {
                ProgressView()
            }

            VStack(alignment: .leading) {
                Text(video.title)
                    .font(.headline)
                Text("\(video.category) • \(String(format: "%.1fM", Double(video.viewCount) / 1000000)) views")
                    .font(.subheadline)
            }
        }
    }
}

#Preview {
    VideoRow(video: Video(title: "The War of the Ring - Part 1", category: "Gaming", thumbnailImage: "war_of_the_ring.jpg", viewCount: 2300))
}
