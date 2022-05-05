//
//  CreateVocabulary.swift
//  Remember
//
//  Created by 이지원 on 2022/04/30.
//

import SwiftUI

struct CreateVocabulary: View {
    
   // @ObservedObject var viewModel = ViewModel()
    
    @State var pressButton: Bool = false
    @State var vocabularyName = ""
    @State var word = [String](repeating: "", count: 20)
    @State var meaning = [String](repeating: "", count: 20)
    @State var papago = [String](repeating: "", count: 20)
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
                                             meaning: $meaning[index], papago: $papago[index])
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
            var mean: String
            if w[i] == "" || m[i] == "" { continue }
            
//            if w[i] == "" { continue }
//            else if m[i] == "" { mean = papago[i] }
//            else { mean = m[i] }
            word.append(w[i])
            meaning.append(m[i])
        }
        let score = [Int](repeating: 0, count: word.count)
        let isCorrect = [Bool](repeating: false, count: word.count)
        let date = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        let dateString = dateFormatter.string(from: date as Date)
        
        if word.count != 0, title != "" {
            print("\(Date()) hihihihi")
            coreDM.saveVoca(title: title, words: word,
                            meanings: meaning, score: score, date: dateString, count: 0, isCorrect: isCorrect)
            
            coreDM.saveTest(title: title, words: word,
                            meanings: meaning, score: score, date: dateString, count: 0, isCorrect: isCorrect)
            return false
            
        } else {
            return true
        }
    }
}

struct VocaburalyColumn: View {
    
    @ObservedObject var viewModel = ViewModel()
    @Binding var word: String
    @Binding var meaning: String
    @Binding var papago: String
    @State var placeHolder = ""
    
    var body: some View {
        
        
        VStack {
            HStack(alignment: .firstTextBaseline, spacing: 10) {
                
                TextField("", text: $word)
                    .onSubmit {
                        //isComplete.toggle()
//                        placeHolder = viewModel.requestAPI(sentence: word)
//                        print(placeHolder)
//                        print("hihihi")
//                        viewModel.requestAPI(sentence: word)
//                        print(placeHolder)
//                        print("hihihi")
                        viewModel.requestAPI(sentence: word)
                        papago = viewModel.text
                        
                    }
                
                Divider()
                Spacer()
                TextField(viewModel.text, text: $meaning)
                    .onSubmit {
                        if meaning == "" {
                            meaning = viewModel.text
                        }
                    }
                
                
                //meaning = viewModel.requestAPI(sentence: word)
                //Text(viewModel.requestAPI(sentence: word))
//                TextField(placeHolder, text: $meaning)
            }
            .frame(width: 300, height:50)
            
            Divider()
                .frame(width: 350)
        }//.onAppear(perform: word = viewModel.requestAPI(sentence: word))
    }
    
//    func getMeaning() -> String {
//        viewModel.requestAPI(sentence: word)
//    }
   
    
}

struct CreateVocabulary_Previews: PreviewProvider {
    static var previews: some View {
        CreateVocabulary(coreDM: CoreDataManager())
    }
}


