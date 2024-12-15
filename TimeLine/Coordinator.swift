//
//  Coordinator.swift
//  TimeLine
//
//  Created by Kawai, Tomotaka | Monta | TMO on 2024/12/15.
//

import Foundation
import SwiftUI

// Idea from https://stackoverflow.com/questions/61304700/swiftui-how-to-avoid-navigation-hardcoded-into-the-view/72530071#72530071
class Coordinator: ObservableObject {
    @Published var path = NavigationPath()

    func show<V>(_ viewType: V.Type) where V: View {
        path.append(String(describing: viewType.self))
    }

    func popToRoot() {
        path.removeLast(path.count)
    }
}
