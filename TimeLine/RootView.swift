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
        TabWrapperView()
    }
}
