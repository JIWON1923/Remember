//
//  TestTabView.swift
//  Remember
//
//  Created by 이지원 on 2022/04/30.
//

import SwiftUI

struct TestTabView: View {
    @State var move = false
    let tests = ["수능 단어", "모의 토익 단어", "수능 특강", "ss"]
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .frame(height: CGFloat(tests.count * 50) + 100)
            
            VStack(alignment: .leading) {
                
                Text ("오늘의 퀴즈")
                    .fontWeight(.bold)
                
                ZStack {
                    VStack{
                        ForEach(tests, id: \.self) { test in
                            NavigationLink(destination: TestToResultView()) {
                                ZStack(alignment: .leading) {
                                    HorizontalButton()
                                    Text(test)
                                        .padding()
                                        
                                }
                            }.buttonStyle(PlainButtonStyle())
                        }
                    }
                }
            }
        }
    }
}


struct TestTabView_Previews: PreviewProvider {
    static var previews: some View {
        TestTabView()
    }
}
