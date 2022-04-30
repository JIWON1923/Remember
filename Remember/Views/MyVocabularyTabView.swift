//
//  MyVocabularyTabView.swift
//  Remember
//
//  Created by 이지원 on 2022/04/30.
//

import SwiftUI

struct MyVocabularyTabView: View {
    let vocaBooks = ["hihi", "토마토", "어쩌고", "저쩌고"]
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<vocaBooks.count) { i in
                    NavigationLink(destination: MyVocaburaly(vocaName: vocaBooks[i])) {
                        Text(vocaBooks[i])
                    }
                }
            }
        }
    }
}

struct MyVocabularyTabView_Previews: PreviewProvider {
    static var previews: some View {
        MyVocabularyTabView()
    }
}
