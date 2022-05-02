//
//  RememberApp.swift
//  Remember
//
//  Created by 이지원 on 2022/04/29.
//

import SwiftUI
// Define your observable
class AppState: ObservableObject {
    @Published var hasOnboarded: Bool

    init(hasOnboarded: Bool) {
        self.hasOnboarded = hasOnboarded
    }
}
@main
struct RememberApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
