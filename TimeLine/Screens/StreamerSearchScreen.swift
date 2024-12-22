//
//  StreamerSearchScreen.swift
//  TimeLine
//
//  Created by Kawai, Tomotaka | Monta | TMO on 2024/12/15.
//

import SwiftUI

struct StreamerSearchScreen: View {
    @State private var searchText = ""
    @FocusState private var isFocused: Bool

    let favoriteStreamers = [
        Streamer(name: "Ninja", games: ["Fortnite", "Call of Duty: Warzone"]),
        Streamer(name: "Ninja2", games: ["Fortnite", "Call of Duty: Warzone"]),
        Streamer(name: "Ninja3", games: ["Fortnite", "Call of Duty: Warzone"])
    ]

    var body: some View {
        List {
            Section(header: Text("Favorite Streamers")) {
                ForEach(filteredStreamers) { streamer in
                    StreamerRow(streamer: streamer)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar(content: toolBar)
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

    @ToolbarContentBuilder
    private func toolBar() -> some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                TextField("Search", text: $searchText)
                    .focused($isFocused)
                    .frame(width: isFocused ? (UIScreen.main.bounds.width * 0.8 - 80) : UIScreen.main.bounds.width * 0.8, height: 32, alignment: .leading)
            }
            .padding(5)
            .background(Color(.systemGray6))
            .cornerRadius(10)
        }
        if isFocused {
            ToolbarItem(placement: .cancellationAction) {
                Button("キャンセル") {
                    searchText = ""
                    isFocused = false
                }
                .frame(width: 72, height: 32)
            }
        }
    }
}

#Preview {
    StreamerSearchScreen()
}
