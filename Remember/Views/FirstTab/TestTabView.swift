//
//  TestTabView.swift
//  Remember
//
//  Created by 이지원 on 2022/04/30.
//

import SwiftUI

struct TestTabView: View {
    
    @State var isActive: Bool = false
    @State private var tests = [TestVoca]()
    @State var move = false
    
    let coreDM: CoreDataManager
    
    var body: some View {
        
        //var tests = getTestVoca()
        
        ZStack {
            if tests.count != 0 {
                Rectangle()
                    .fill(Color.white)
                    .frame(height: CGFloat(tests.count * 50) + 100)
                
                VStack(alignment: .leading) {
                    Text ("오늘의 퀴즈")
                        .fontWeight(.bold)
                    
                    ZStack {
                        VStack {
                            
                            // MARK : 질문
                            ForEach(tests, id: \.self) { test in
                                NavigationLink(
                                    destination: TestToResultView(coreDM: coreDM, voca: test)
                                    //Test(rootIsActive: $isActive,
                                    //            coreDM: coreDM, voca: test)
                                    //, isActive: $isActive
                                ) {
                                    ZStack(alignment: .leading) {
                                        HorizontalButton()
                                        Text(test.title ?? "")
                                            .padding()
                                            .foregroundColor(.black)
                                    }
                                }
                                .isDetailLink(false)
                            }
                        }
                        
                    }
                }
            }
        }.onAppear(perform: { tests = coreDM.getAllTestVoca() })
    }
    
    func getTestVoca() {
        let vocas = coreDM.getAllVoca()
        //var tests: [Voca] = []
        
        let date = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        let dateString = dateFormatter.string(from: date as Date)
        
        for voca in vocas {
            
            let calendar = Calendar.current
            let currentDate = Date()
            let dateFormatter = DateFormatter()
            var daysCount: Int = 0
            
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let startDate = dateFormatter.date(from: voca.date!)
            daysCount = calendar.dateComponents([.day], from: startDate!, to: currentDate).day! + 1
            
            if daysCount == 1 {
                coreDM.saveTest(title: voca.title!, words: voca.words!, meanings: voca.meanings!, score: voca.score!, date: dateString, count: voca.count+1, isCorrect: voca.isCorrect!)
                
            }
        }
    }
    
    
}


struct TestTabView_Previews: PreviewProvider {
    static var previews: some View {
        TestTabView(coreDM: CoreDataManager())
    }
}
