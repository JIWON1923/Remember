//
//  MyVocabularyTabView.swift
//  Remember
//
//  Created by 이지원 on 2022/04/30.
//

import SwiftUI

struct MyVocabularyTabView: View {
    
    @State private var vocas: [Voca] = [Voca]()
    
    let coreDM: CoreDataManager
    
    var body: some View {
        VStack {
            List {
                ForEach(vocas, id: \.self) { voca in
                    
                    NavigationLink(destination: MyVoca(voca: voca)) {
                        Text(voca.title ?? "")
                    }
                }
            }
        }
        .onAppear(perform: { vocas = coreDM.getAllVoca() })
    }
}

struct MyVocabularyTabView_Previews: PreviewProvider {
    static var previews: some View {
        MyVocabularyTabView(coreDM: CoreDataManager())
    }
}
