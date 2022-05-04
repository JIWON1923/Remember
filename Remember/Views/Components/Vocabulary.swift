//
//  Vocabulary.swift
//  Remember
//
//  Created by 이지원 on 2022/05/04.
//

import SwiftUI

struct Vocabulary: View {
    
    let word: String
    let meaning: String
    
    @State var isTapped = false
    
    var body: some View {

        ZStack(alignment: .leading) {
            Rectangle()
                .fill(.clear)
                .frame(width: 300, height: 50)
                .cornerRadius(10)
            
            HStack(spacing: 10) {
                
                Text(word)
                    .frame(width: 100)
                
                Spacer()
                Divider()
                
                if isTapped {
                    Text (meaning)
                        .frame(width: 100)
                    
                } else {
                    Text("")
                    .frame(width: 100) }
            }
            .frame(width: 250)
        }
        .background(Color("voca"))
        .onTapGesture {
            isTapped.toggle()
        }
        
    }
}

                  
                  
struct Vocabulary_Previews: PreviewProvider {
    static var previews: some View {
        Vocabulary(word: "Apple", meaning: "사과")
    }
}
