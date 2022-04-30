//
//  CreateVocabulary.swift
//  Remember
//
//  Created by 이지원 on 2022/04/30.
//

import SwiftUI

struct note: View {
    @State var inputText = ""
    var body: some View {
        ZStack {
        Rectangle()
            .fill(.white)
            .cornerRadius(10)
            .frame(width: 160, height: 50)
            TextField("입력해주세요", text: $inputText)
                .frame(width: 150)
        }
    }
}

struct CreateVocabulary: View {
    @State var vocabularyName = ""
    let data = Array(1...15).map { "목록 \($0)" }
    let columns = [ GridItem(.flexible()), GridItem(.flexible()) ]
    
    var body: some View {
        VStack {
        ZStack {
            Color("background")
                .frame(width: 350, height: 600)
                .cornerRadius(10)
            
            VStack(alignment: .leading) {
                TextField("단어장 이름", text: $vocabularyName)
                    .frame(width: 300)
                
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(0 ..< 16) { i in
                            note()
                        }
                    }
                }
                .frame(width: 350, height: 550)
            }
        }
            RoundedButton(buttonText: "등록하기")
        }
        
    }
}

struct CreateVocabulary_Previews: PreviewProvider {
    static var previews: some View {
        CreateVocabulary()
        //note()
    }
}
