//
//  TodayWords.swift
//  Remember
//
//  Created by 이지원 on 2022/04/29.
//

import SwiftUI

struct TodayWords: View {
    
    let words = ["deplete","fatigue","diagnosis"]
    let meanings = ["고갈시키다","피로","진단"]
    @State var isTapped = [Bool](repeating: false, count: 3)
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .fill(Color.white)
                .frame(height: 270)
            
            VStack(alignment: .leading) {
                
                Text("오늘의 단어")
                    .fontWeight(.bold)
                    //.font(.custom("나눔손글씨 세계적인 한글", size: 35))
                
                ForEach(0 ..< words.count, id:  \.self) { i in
                    
                    ZStack(alignment: .leading) {
                        
                        HorizontalButton()
                            .onTapGesture {
                                isTapped[i].toggle()
                            }
                        
                        Text(meanings[i])
                            .padding()
                            .opacity(isTapped[i] ? 1 : 0)
                        
                        Text(words[i])
                            .padding()
                            .opacity(isTapped[i] ? 0 : 1)
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
