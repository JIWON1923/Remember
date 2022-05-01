//
//  TestTabView.swift
//  Remember
//
//  Created by 이지원 on 2022/04/30.
//

import SwiftUI

struct TestTabView: View {
    let tests = ["수능 단어", "모의 토익 단어", "수능 특강"]
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text ("오늘의 퀴즈")
                .fontWeight(.bold)
                .padding()
            
            ZStack {
                VStack{
                    ForEach(tests, id: \.self) { test in
                        NavigationLink(destination: Test()) {
                            ZStack(alignment: .leading) {
                                HorizontalButton()
                                Text(test)
                                    .padding()
                            }
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
