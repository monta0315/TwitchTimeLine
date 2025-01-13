//
//  StreamerSearchScreenViewModel.swift
//  TimeLine
//
//  Created by Kawai, Tomotaka | Monta | TMO on 2025/01/04.
//

import Foundation

class StreamerSearchViewModel: ObservableObject {
    let favoriteStreamers = [
        TestData.testStreamer,
        TestData.testStreamer,
        TestData.testStreamer,
        TestData.testStreamer
    ]

    let recommendStreamers = [
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
