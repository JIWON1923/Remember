//
//  TestResult.swift
//  Remember
//
//  Created by 이지원 on 2022/05/03.
//

import SwiftUI

struct TestResult: View {
    @Binding var shouldPopToRootView : Bool
    let testResult: [Int]
    var body: some View {
        let correct = testResult.filter { $0 != 0 }
        let _ = print(correct)
        let _ = print(testResult)
        
        VStack {
        Text("\(testResult.count)개 중 \(correct.count)개 맞췄습니다.")
            .navigationBarBackButtonHidden(true)
            .navigationTitle("시험 결과")
        
//            NavigationLink(destination: MainTabView()) {
//                RoundedButton(buttonText: "돌아가기")
//                    TAB1
//            }
            RoundedButton(buttonText: "돌아가기")
                .onTapGesture {
                    shouldPopToRootView = false
                }
        }
        
    }
}


struct TestResult_Previews: PreviewProvider {
    static var previews: some View {
        TestResult(
            shouldPopToRootView: .constant(false),
            testResult: [1, 2, 3])
    }
}
