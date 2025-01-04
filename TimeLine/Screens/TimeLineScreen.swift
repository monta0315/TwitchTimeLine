//
//  TimeLineScreen.swift
//  TimeLine
//
//  Created by Kawai, Tomotaka | Monta | TMO on 2024/12/15.
//

import SwiftUI

struct TimeLineScreen: View {
    @ObservedObject var viewModel = TimelineScreenViewModel()
    @State private var viewDidLoad = false

    var body: some View {
        NavigationView {
            if viewModel.isLoading {
                ProgressView()
            } else {
                timeLines
                .navigationTitle("Timeline")
            }
        }
        .onAppear {
            guard !viewDidLoad else {
                return
            }
            Task {
                viewDidLoad = true
                await viewModel.getTimelineVideos()
            }
        }
        .refreshable {
            guard !viewModel.isLoading else { return }
            await viewModel.getTimelineVideos()
        }
        .preferredColorScheme(.dark)
    }

    private var timeLines: some View {
        List {
            Section(header: Text("Today")) {
                ForEach(viewModel.today) { video in // Assuming first 3 are for Today
                    NavigationLink(destination: VideoDetailScreen(video: video)) {
                        VideoRow(video: video)
                    }
                }
            }
            Section(header: Text("Yesterday")) {
                ForEach(viewModel.yesterday) { video in // Assuming rest are for Yesterday
                    NavigationLink(destination: VideoDetailScreen(video: video)) {
                        VideoRow(video: video)
                    }
                }
            }
            Section(header: Text("Within A Week")) {
                ForEach(viewModel.aWeek) { video in // Assuming rest are for Yesterday
                    NavigationLink(destination: VideoDetailScreen(video: video)) {
                        VideoRow(video: video)
                    }
                }
            }
            Section(header: Text("Past")) {
                ForEach(viewModel.past) { video in // Assuming rest are for Yesterday
                    NavigationLink(destination: VideoDetailScreen(video: video)) {
                        VideoRow(video: video)
                    }
                }
            }
        }
    }
}

#Preview {
    TimeLineScreen()
}
