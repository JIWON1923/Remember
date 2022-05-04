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
    @State var testResult = [String](repeating: "", count: 20)
    
    let coreDM: CoreDataManager
    
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
                
                Button(action: {}) {
                    NavigationLink(destination: TestResult(shouldPopToRootView: $rootIsActive,
                                                           testResult: testResult,
                                                           voca: voca)) {
                        Text("제출하기")
                    }
                                                           .isDetailLink(false)
                } .tag(words!.count)
            }
            .frame(height: 450)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .unredacted()
            
            Spacer()
            
            CustomTextField(currentPage: $currentPage, testResult: $testResult, voca: voca, coreDM: coreDM)
        }
        .navigationTitle("오늘의 퀴즈")
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test(rootIsActive: .constant(false), coreDM: CoreDataManager(), voca: Voca())
    }
}

