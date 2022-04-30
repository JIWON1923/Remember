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
        
        ZStack {
            Color("background")
            
            NavigationView {
                
                List {
                    ForEach(tests, id: \.self) { test in
                        HStack {
                            NavigationLink(destination: Test()) {
                                Text(test)
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
