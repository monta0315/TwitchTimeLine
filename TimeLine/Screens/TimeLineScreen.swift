//
//  TimeLineScreen.swift
//  TimeLine
//
//  Created by Kawai, Tomotaka | Monta | TMO on 2024/12/15.
//

import SwiftUI

struct TimeLineScreen: View {
    @ObservedObject var viewModel = TimelineScreenViewModel()

    var body: some View {
        NavigationView {
            if viewModel.isLoading {
                ProgressView()
            } else {
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
                .navigationTitle("Timeline")
            }
        }
        .onAppear {
            Task {
                await viewModel.getTimelineVideos()
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    TimeLineScreen()
}
