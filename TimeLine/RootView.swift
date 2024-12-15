//
//  RootView.swift
//  TimeLine
//
//  Created by Kawai, Tomotaka | Monta | TMO on 2024/12/15.
//

import Foundation
import SwiftUI


struct RootView: View {
    @StateObject private var coordinator = Coordinator()

    var body: some View {
        VStack {
            NavigationStack(path: $coordinator.path) {
                VStack {
                    TimeLineScreen()
                }
                .navigationDestination(for: String.self) { id in
                    if id == String(describing: TimeLineScreen.self) {
                        TimeLineScreen()
                    }
                    else if id == String(describing: StreamerSearchScreen.self) {
                        StreamerSearchScreen()
                    }
                }
            }
            .environmentObject(coordinator)
        }
    }
}
