//
//  ViewFlows.swift
//  Remember
//
//  Created by 이지원 on 2022/05/02.
//

import SwiftUI

struct TestToResultView: View {
    @StateObject var appState = AppState(hasOnboarded: false)
    var body: some View {
        if appState.hasOnboarded {
            MainTabView()
                .environmentObject(appState)
        } else {
            Test()
                .environmentObject(appState)
            
        }
    }
}
