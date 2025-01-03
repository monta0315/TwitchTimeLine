//
//  TimelineScreenViewModel.swift
//  TimeLine
//
//  Created by Kawai, Tomotaka | Monta | TMO on 2025/01/03.
//

import Foundation

class TimelineScreenViewModel: ObservableObject {
    private var videos: [Video] = [] {
        didSet {
            splitVideos()
        }
    }

    var isLoading = false

    @Published var today: [Video] = []
    @Published var yesterday: [Video] = []
    @Published var aWeek: [Video] = []
    @Published var past: [Video] = []

    private func splitVideos() {
        // TODO: Need to clean logic
        let calendar = Calendar.current
        let _today = Date()
        let _yesterday = calendar.date(byAdding: .day, value: -1, to: _today)!
        let aWeekAgo = calendar.date(byAdding: .day, value: -7, to: _today)!

        today = videos.filter { calendar.isDate($0.started_at, inSameDayAs: _today) }

        yesterday = videos.filter { calendar.isDate($0.started_at, inSameDayAs: _yesterday) }

        aWeek = videos.filter { $0.started_at > aWeekAgo && !calendar.isDate($0.started_at, inSameDayAs: _today) && !calendar.isDate($0.started_at, inSameDayAs: _yesterday) }

        past = videos.filter { $0.started_at <= aWeekAgo }
    }

    func getTimelineVideos() async {
        // TODO: Will update to handle result function
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [self] in // Simulate API call delay
            self.videos = [
                TestData.testVideo(),
                TestData.testVideo(),
                TestData.testVideo(),
                TestData.testVideo(),
                TestData.testVideo(),
                TestData.testVideo(),
                TestData.testVideo(),
                TestData.testVideo(),
                TestData.testVideo(),
                TestData.testVideo(),
                TestData.testVideo(),
                TestData.testVideo(),
            ]
            self.isLoading = false
        }
    }
}
