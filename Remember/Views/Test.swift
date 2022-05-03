//
//  Test.swift
//  Remember
//
//  Created by 이지원 on 2022/04/30.
//

import SwiftUI

struct Test: View {
    @Binding var rootIsActive: Bool
    @State var keyboardHeight: CGFloat = 0
    @State var currentPage: Int = 0
    @State var needRefresh: Bool = false
    @State var testResult = [String](repeating: "", count: 20)
    
    var voca: Voca
    
    var body: some View {
        
        let words = voca.words
        
        VStack {
            TabView(selection: $currentPage) {
                ForEach(0..<words!.count, id: \.self) { index in
                    Text(words![index])
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .font(.largeTitle)
                        .background(Color("background"))
                        .tag(index)
                }
                Button(action: {
                }) {
                    NavigationLink(destination: TestResult(shouldPopToRootView: $rootIsActive, testResult: testResult, voca: voca)) {
                        Text("제출하기")
                    }
                } .tag(words!.count)
            }
            .frame(height: 450)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .unredacted()
            
            Spacer()
            
            CustomTextField(currentPage: $currentPage, needRefresh: $needRefresh, testResult: $testResult, voca: voca)
        }
        .navigationTitle("오늘의 퀴즈")
        //.onAppear()
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test(rootIsActive: .constant(false), voca: Voca())
    }
}

