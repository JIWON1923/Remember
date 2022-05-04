//
//  RecommendVoca.swift
//  Remember
//
//  Created by 이지원 on 2022/05/04.
//

import SwiftUI

struct RecommendDetail: View {
    
    let voca: RecommendVoca
    let coreDM: CoreDataManager
    
    var body: some View {
        
        let word = voca.words
        let meaning = voca.meanings
        
        VStack {
            ZStack {
                Rectangle()
                    .fill(Color("voca"))
                    .frame(width: 350, height: 600)
                    .cornerRadius(30)
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    HStack(alignment: .center) {
                        
                        Text("word").padding(.leading, 30)
                        Spacer()
                        Text("meaning")
                    }
                    .frame(width: 300)
                    
                    Divider()
                    
                    ScrollView(showsIndicators: false) {
                        ForEach(0..<word.count, id: \.self) { index in
                            
                            HStack(spacing: 10) {
                                Text(word[index])
                                    .frame(width: 150)
                                
                                Spacer()
                                Divider()
                                
                                Text(meaning[index])
                                    .frame(width: 150)
                            }
                            .frame(width: 300, height:50)
                            
                        }
                    }
                    .frame(height: 500)
                    
                }
                .frame(width: 300)
            }
            .padding()
            
            RoundedButton(buttonText: "가져오기")
                .onTapGesture {
                    let score = [Int](repeating: 0, count: word.count)
                    let isCorrect = [Bool](repeating: false, count: word.count)
                    coreDM.saveVoca(title: voca.title , words: voca.words,
                                    meanings: voca.meanings, score: score, date: Date(),
                                    count: 0, isCorrect: isCorrect)
                    NavigationUtil.popToRootView()
                }
        }
        .navigationTitle(voca.title)
    }
}

//
//struct RecommendDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        RecommendDetail()
//    }
//}
