//
//  StreamerSearchScreenViewModel.swift
//  TimeLine
//
//  Created by Kawai, Tomotaka | Monta | TMO on 2025/01/04.
//

import Foundation

class StreamerSearchViewModel: ObservableObject {
    private let supabaseClient = SupabaseManager.shared.client
    var favoriteStreamers = [
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

//    func getSearchedStreamers(_ searchText: String) async {
//        searchedStreamers = []
//
//        let result = [
//            TestData.testStreamer,
//            TestData.testStreamer,
//            TestData.testStreamer
//        ]
//
//        try? await Task.sleep(for: .seconds(2))
//
//        searchedStreamers.append(contentsOf: result)
//    }

    func fetchStreamers(_ searchText: String) async -> Void {
        do {
            let response: [Streamer] = try await supabaseClient
                .from("streamers")
                .select()
                .execute()
                .value

            searchedStreamers = response
        } catch {
            print("Error fetching streamers:\(error)")
        }
    }

//    func fetchFavoriteStreamers(userId: UUID) async -> Void {
//        do {
//            let response = try await supabaseClient
//                .from("favorite_streamers")
//                .select()
//                .eq("user_id", userId.uuidString)
//                .execute()
//
//            favoriteStreamers = try response.decoded(to: [FavoriteStreamer].self)
//        } catch {
//            print("Error fetching favorite streamers:\(error)")
//        }
//    }
}
