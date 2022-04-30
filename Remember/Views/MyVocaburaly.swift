//
//  MyVocaburaly.swift
//  Remember
//
//  Created by 이지원 on 2022/04/30.
//

import SwiftUI

struct MyVocaburaly: View {
    let vocaName: String
    let data = Array(1...100).map { "목록 \($0)" }
    let columns = [ GridItem(.flexible()), GridItem(.flexible()) ]
    
    var body: some View {
        
        ZStack {
            Rectangle()
                .fill(Color("background"))
                .frame(width: 350, height: 600)
            
            VStack(alignment: .leading) {
                Text(vocaName)
                    .fontWeight(.bold)
                    .padding()
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(data, id: \.self) { i in
                            Text(i)
                        }
                    }
                }.frame(width: 350, height: 550)
            }
        }
    }
}

struct MyVocaburaly_Previews: PreviewProvider {
    static var previews: some View {
        MyVocaburaly(vocaName: "토마토")
    }
}
