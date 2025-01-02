//
//  StreamerRow.swift
//  TimeLine
//
//  Created by Kawai, Tomotaka | Monta | TMO on 2024/12/15.
//

import SwiftUI

struct StreamerRow: View {
    let streamer: Streamer

    var body: some View {
        HStack {
            Image(systemName: "person.circle.fill")
                .foregroundColor(.blue)
            VStack(alignment: .leading) {
                Text(streamer.name)
                    .font(.headline)
                Text(streamer.games.joined(separator: ", "))
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            Image(systemName: "star.fill")
                .foregroundColor(.blue)
        }
    }
}

#Preview {
    StreamerRow(streamer: TestData.testStreamer)
}
