//
//  TabWrapperView.swift
//  TimeLine
//
//  Created by Kawai, Tomotaka | Monta | TMO on 2024/12/29.
//

import SwiftUI

struct TabWrapperView: View {
    var body: some View {
        TabView {
            TimeLineScreen()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            StreamerSearchScreen()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Browse")
                }
        }
    }
}

#Preview {
    TabWrapperView()
}
