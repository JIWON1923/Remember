//
//  TodayWords.swift
//  Remember
//
//  Created by 이지원 on 2022/04/29.
//

import SwiftUI

struct TodayWords: View {
    
    let words = ["tomato", "tiger", "t-shirts"]
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .fill(Color.white)
                .frame(height: 270)
            
            VStack(alignment: .leading) {
                
                Text("오늘의 단어")
                
                ForEach(words, id:  \.self) { word in
                    
                    ZStack(alignment: .leading){
                        HorizontalButton()
                        
                        Text(word)
                            .fontWeight(.bold)
                            .padding()
                    }
                }
            }
            
        }
    }
}

struct TodayWords_Previews: PreviewProvider {
    static var previews: some View {
        TodayWords()
    }
}
