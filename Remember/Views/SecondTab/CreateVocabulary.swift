//
//  CreateVocabulary.swift
//  Remember
//
//  Created by 이지원 on 2022/04/30.
//

import SwiftUI

struct CreateVocabulary: View {
    
    @State var pressButton: Bool = false
    @State var vocabularyName = ""
    @State var word = [String](repeating: "", count: 20)
    @State var meaning = [String](repeating: "", count: 20)
    @State var success = false
    
    let coreDM: CoreDataManager
    
    var body: some View {
        
        VStack {
            ZStack {
                
                Rectangle()
                    .fill(Color("voca"))
                    .frame(width: 350, height: 550)
                    .cornerRadius(30)
                
                VStack (alignment: .leading, spacing: 10) {
                    
                    TextField("Vocaburaly Name", text: $vocabularyName)
                        .frame(width: 300, height: 40)
                        .padding(.leading, 20)
                    
                    Divider()
                        .frame(width: 350)
                    
                    HStack(alignment: .center) {
                        
                        Text("word").padding(.leading, 30)
                        Spacer()
                        Text("meaning")
                        
                    }
                    .frame(width: 300)
                    
                    Divider()
                    
                    ScrollView {
                        ForEach(0..<20, id: \.self) { index in
                            VocaburalyColumn(word: $word[index],
                                             meaning: $meaning[index])
                        }
                        .frame(width: 350)
                    }
                    .frame(height: 400)
                }
            }.padding()
            
            RoundedButton(buttonText: "등록하기")
                .onTapGesture {
                    
                    success = saveInfo(w: word, m: meaning, title: vocabularyName)
                    
                    if !success {
                        word = [String](repeating: "", count: 20)
                        meaning = [String](repeating: "", count: 20)
                        vocabularyName = ""
                    }
                }
                .alert(isPresented: $success) {
                    Alert(title: Text("단어장 제목 혹은 내용이 비어있습니다."))
                }
        }
        
    }
    
    func saveInfo(w: [String], m: [String], title: String) -> Bool {
        
        var word = [String]()
        var meaning = [String]()
        
        for i in 0 ..< w.count {
            
            if w[i] == "" || m[i] == "" { continue }
            
            word.append(w[i])
            meaning.append(m[i])
        }
        let isCorrect = [Int](repeating: 0, count: word.count)
        
        if word.count != 0, title != "" {
            coreDM.saveVoca(title: title, words: word,
                            meanings: meaning, isCorrect: isCorrect, date: Date())
            return false
            
        } else {
            return true
        }
    }
}

struct VocaburalyColumn: View {
    
    @Binding var word: String
    @Binding var meaning: String
    
    var body: some View {
        
        VStack {
            HStack(alignment: .firstTextBaseline, spacing: 10) {
                
                TextField("", text: $word)
                
                Divider()
                Spacer()
                
                TextField("", text: $meaning)
            }
            .frame(width: 300, height:50)
            
            Divider()
                .frame(width: 350)
        }
    }
}

struct CreateVocabulary_Previews: PreviewProvider {
    static var previews: some View {
        CreateVocabulary(coreDM: CoreDataManager())
    }
}


