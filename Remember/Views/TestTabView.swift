//
//  TestTabView.swift
//  Remember
//
//  Created by 이지원 on 2022/04/30.
//

import SwiftUI

struct TestTabView: View {
    let coreDM: CoreDataManager
    @State var isActive: Bool = false
    @State private var tests: [Voca] = [Voca]()
    @State var move = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .frame(height: CGFloat(tests.count * 50) + 100)
            
            VStack(alignment: .leading) {
                
                Text ("오늘의 퀴즈")
                    .fontWeight(.bold)
                
                ZStack {
                    VStack {
                        ForEach(tests, id: \.self) { test in
                            NavigationLink(destination: Test(rootIsActive: $isActive, voca: test),
                                           isActive: self.$isActive) {
                                ZStack(alignment: .leading) {
                                    HorizontalButton()
                                    Text(test.title ?? "")
                                        .padding()
                                }
                            }
                        }
                    }
                }
            }
        }
        .onAppear(perform: {
            tests = coreDM.getAllVoca()
        })
    }
}


struct TestTabView_Previews: PreviewProvider {
    static var previews: some View {
        TestTabView(coreDM: CoreDataManager())
    }
}
