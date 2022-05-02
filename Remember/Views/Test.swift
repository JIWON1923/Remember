//
//  Test.swift
//  Remember
//
//  Created by 이지원 on 2022/04/30.
//

import SwiftUI

struct Test: View {

    @State var keyboardHeight: CGFloat = 0
    @State var currentPage: Int = 0
    
    let words = ["apple", "pear", "cup", "mask", "mouse"]
    
    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                ForEach(0..<words.count, id: \.self) { word in
                    Text(words[word])
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .font(.largeTitle)
                        .background(Color("background"))
                        .tag(word)
                }
                Button(action: {
                }) {
                    NavigationLink(destination: TestResult()) {
                        Text("제출하기")
                    }
                } .tag(words.count)
            }
            .frame(height: 450)
            .tabViewStyle(.page(indexDisplayMode: .never))
            .unredacted()
            
            Spacer()
            
            CustomTextField(currentPage: $currentPage, length: words.count, placeHolder: "정답을 입력해주세요")
        }
        .navigationTitle("오늘의 퀴즈")
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}

