//
//  TestResult.swift
//  Remember
//
//  Created by 이지원 on 2022/05/03.
//

import SwiftUI

struct TestResult: View {
    
    @Binding var shouldPopToRootView : Bool
    
    @State var testResult: [String]
    @State var voca: Voca
    
    var body: some View {
        VStack {
            
            let result = voca.isCorrect
            
            Text("\((result?.filter{ $0 == 0 }.count)!)개 틀렸습니다.")
            
            MyVocaburaly(voca: voca)
            
            RoundedButton(buttonText: "돌아가기")
                .onTapGesture {
                    //shouldPopToRootView = false
                    NavigationUtil.popToRootView()
                    
                }
        }
    }
}


struct TestResult_Previews: PreviewProvider {
    static var previews: some View {
        TestResult(
            shouldPopToRootView: .constant(false),
            testResult: ["1", "2", "3"], voca: Voca())
    }
}
