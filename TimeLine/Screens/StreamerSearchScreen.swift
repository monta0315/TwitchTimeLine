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
    @ObservedObject private var viewModel = StreamerSearchViewModel()
    @State private var isLoading = false

    var body: some View {
        NavigationView {
            streamersLists
            .navigationBarBackButtonHidden(true)
            .toolbar(content: toolBar)
            .overlay(isLoading ? ProgressView() : nil)
            .preferredColorScheme(.dark)
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
                    .frame(width: isFocused ? (UIScreen.main.bounds.width * 0.8 - 72) : UIScreen.main.bounds.width * 0.8, height: 32, alignment: .leading)
            }
            .onSubmit {
                Task {
                    isLoading = true
                    await viewModel.getSearchedStreamers(searchText)
                    isLoading = false
                }
            }
            .padding(5)
            .background(Color(.systemGray6))
            .cornerRadius(10)
        }
        if isFocused {
            ToolbarItem(placement: .cancellationAction) {
                HStack {
                    Button("キャンセル") {
                        searchText = ""
                        isFocused = false
                    }
                    .frame(width: 72, height: 32, alignment: .leading)
                }
            }
        }
    }

    private var streamersLists: some View {
        List {
            if !viewModel.searchedStreamers.isEmpty {
                Section(header: Text("Searched Streamers")) {
                    ForEach(viewModel.searchedStreamers) { streamer in
                        NavigationLink(destination: StreamerDetailScreen(streamer: streamer)) {
                            StreamerRow(streamer: streamer)
                        }
                    }
                }
            }
            if !viewModel.favoriteStreamers.isEmpty {
                Section(header: Text("Favorite Streamers")) {
                    ForEach(viewModel.favoriteStreamers) { streamer in
                        NavigationLink(destination: StreamerDetailScreen(streamer: streamer)) {
                            StreamerRow(streamer: streamer)
                        }
                    }
                }
            }
            if !viewModel.recommendStreamers.isEmpty {
                Section(header: Text("Recommend Streamers")) {
                    ForEach(viewModel.favoriteStreamers) { streamer in
                        NavigationLink(destination: StreamerDetailScreen(streamer: streamer)) {
                            StreamerRow(streamer: streamer)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    StreamerSearchScreen()
}
