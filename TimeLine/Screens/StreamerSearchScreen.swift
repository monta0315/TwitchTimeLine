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
            List {
                Section(header: Text("Searched Streamers")) {
                    ForEach(viewModel.searchedStreamers) { streamer in
                        NavigationLink(destination: StreamerDetailScreen(streamer: streamer)) {
                            StreamerRow(streamer: streamer)
                        }
                    }
                }
                Section(header: Text("Favorite Streamers")) {
                    ForEach(viewModel.favoriteStreamers) { streamer in
                        NavigationLink(destination: StreamerDetailScreen(streamer: streamer)) {
                            StreamerRow(streamer: streamer)
                        }
                    }
                }
            }
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
                    .onSubmit {
                        Task {
                            isLoading = true
                            await viewModel.getSearchedStreamers(searchText)
                            isLoading = false
                        }
                    }
                    .frame(width: isFocused ? (UIScreen.main.bounds.width * 0.8 - 80) : UIScreen.main.bounds.width * 0.8, height: 32, alignment: .leading)
            }
            .padding(5)
            .background(Color(.systemGray6))
            .cornerRadius(10)
        }
        if isFocused {
            ToolbarItem(placement: .cancellationAction) {
                HStack {
                    Spacer(minLength: 8)
                    Button("キャンセル") {
                        searchText = ""
                        isFocused = false
                    }
                    .frame(width: 72, height: 32)
                }
            }
        }
    }
}

#Preview {
    StreamerSearchScreen()
}

class StreamerSearchViewModel: ObservableObject {
    let favoriteStreamers = [
        TestData.testStreamer,
        TestData.testStreamer,
        TestData.testStreamer,
        TestData.testStreamer
    ]

    @Published var searchedStreamers: [Streamer] = []

    func getSearchedStreamers(_ searchText: String) async {
        searchedStreamers = []

        let result = [
            TestData.testStreamer,
            TestData.testStreamer,
            TestData.testStreamer
        ]

        try? await Task.sleep(for: .seconds(2))

        searchedStreamers.append(contentsOf: result)
    }
}
