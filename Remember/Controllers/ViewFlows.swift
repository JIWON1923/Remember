//
//  ViewFlows.swift
//  Remember
//
//  Created by 이지원 on 2022/05/02.
//

import SwiftUI

class AppState: ObservableObject {
    @Published var hasOnboarded: Bool

    init(hasOnboarded: Bool) {
        self.hasOnboarded = hasOnboarded
    }
}

struct TestToResultView: View {
    
    @StateObject var appState = AppState(hasOnboarded: false)
    @State var testResult = [String](repeating: "", count: 20)
    
    let coreDM: CoreDataManager
    let voca: TestVoca
    
    var body: some View {
        
        if appState.hasOnboarded {
            TestResult(shouldPopToRootView: .constant(false), testResult: testResult,
                       voca: voca, coreDM: coreDM)
                .environmentObject(appState)
            
        } else {
            Test(rootIsActive: .constant(false), coreDM: coreDM, voca: voca)
                .environmentObject(appState)
        }
    }
}

//struct CreateVocaToMain: View {
//    @StateObject var appState = AppState(hasOnboarded: false)
//
//    var body: some View {
//        if appState.hasOnboarded {
//            MainTabView()
//                .environmentObject(appState)
//        } else {
//            CreateVocabulary()
//                .environmentObject(appState)
//        }
//    }
//}

//struct CreateVocaToMain: View {
//    @State var finish = false
//    var body: some View {
//        if finish {
//            MainTabView()
//        } else {
//            CreateVocabulary(finish: $finish)
//        }
//    }
//}
