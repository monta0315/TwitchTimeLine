//
//  StreamerSearchScreen.swift
//  TimeLine
//
//  Created by Kawai, Tomotaka | Monta | TMO on 2024/12/15.
//

import SwiftUI

struct StreamerSearchScreen: View {
    @State private var searchText = ""
    let favoriteStreamers = [
        Streamer(name: "Ninja", games: ["Fortnite", "Call of Duty: Warzone"]),
        Streamer(name: "Ninja2", games: ["Fortnite", "Call of Duty: Warzone"]),
        Streamer(name: "Ninja3", games: ["Fortnite", "Call of Duty: Warzone"])
    ]

    var body: some View {
        NavigationView {
            List {
                // Search Bar
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Search", text: $searchText)
                }
                .padding()
                .background(Color(.systemGray6))

                // Favorite Streamers Section
                Section(header: Text("Favorite Streamers")) {
                    ForEach(filteredStreamers) { streamer in
                        StreamerRow(streamer: streamer)
                    }
                }
            }
            .navigationTitle("Search")
            .navigationBarItems(trailing: Button(action: {}) {
                Image(systemName: "star.fill")
                    .foregroundColor(.blue)
            })
        }
        .preferredColorScheme(.dark)
    }

    var filteredStreamers: [Streamer] {
        if searchText.isEmpty {
            return favoriteStreamers
        } else {
            return favoriteStreamers.filter { streamer in
                streamer.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
}
