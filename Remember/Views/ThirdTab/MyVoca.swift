//
//  MyVoca.swift
//  Remember
//
//  Created by 이지원 on 2022/05/05.
//

import SwiftUI

struct MyVoca: View {
    
    let voca: Voca
    
    var body: some View {
        
        let word = voca.words
        let meaning = voca.meanings
        let isCorrect = voca.isCorrect
        
        VStack {
            ZStack {
                Rectangle()
                    .fill(Color("voca"))
                    .frame(width: 350, height: 600)
                    .cornerRadius(30)
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    HStack(alignment: .center) {
                        
                        Text("word")
                            .fontWeight(.bold)
                            .frame(width: 100)
                        Spacer()
                        Text("meaning")
                            .fontWeight(.bold)
                            .frame(width: 100)
                    }
                    .frame(width: 250)
                    
                    Divider()
                    
                    ScrollView(showsIndicators: false) {
                        ForEach(0..<word!.count, id: \.self) { index in
                            
                            Vocabulary2(word: word![index], meaning: meaning![index])
                            
                        }
                    }
                    .frame(height: 500)
                    
                }
                .frame(width: 300)
            }
            .padding()
        }
        .navigationTitle(voca.title!)
    }
}
//
//struct MyVocaburaly_Previews: PreviewProvider {
//    static var previews: some View {
//        MyVocaburaly(voca: Voca())
//    }
//}
