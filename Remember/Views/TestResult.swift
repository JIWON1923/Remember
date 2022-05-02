//
//  TestResult.swift
//  Remember
//
//  Created by 이지원 on 2022/05/03.
//

import SwiftUI

struct TestResult: View {
    var body: some View {
        Text("x개 중 y개 맞췄습니다.")
            .navigationBarBackButtonHidden(true)
            .navigationTitle("시험 결과")
    }
}

struct TestResult_Previews: PreviewProvider {
    static var previews: some View {
        TestResult()
    }
}
