//
//  MyVocaburaly.swift
//  Remember
//
//  Created by 이지원 on 2022/04/30.
//

import SwiftUI

struct MyVocaburaly: View {
    let vocaName: String
    let word = ["aaa", "Bbb", "Ccc", "Ddd", "aa","aaa", "Bbb", "Ccc", "Ddd", "aa","aaa", "Bbb", "Ccc", "Ddd", "aa"]
    let meaning = ["1", "2", "3", "4", "5","aaa", "Bbb", "Ccc", "Ddd", "aa","aaa", "Bbb", "Ccc", "Ddd", "aa"]
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(Color("voca"))
                    .frame(width: 350, height: 700)
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
                    .frame(height: 600)
                    
                }
                .frame(width: 300)
            }
            .padding()
        }
        
        .navigationTitle(vocaName)
    }
}

struct MyVocaburaly_Previews: PreviewProvider {
    static var previews: some View {
        MyVocaburaly(vocaName: "토마토")
    }
}
