//
//  Test.swift
//  Remember
//
//  Created by 이지원 on 2022/04/30.
//

import SwiftUI

struct Test: View {
    let words = ["apple", "pear", "cup", "mask", "mouse"]
    var body: some View {
        VStack {
            TabView {
                ForEach(words, id: \.self) { word in
                    Text(word)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .font(.largeTitle)
                        .background(Color("background"))
                }
            }
            .frame(height: 450)
            .tabViewStyle(.page(indexDisplayMode: .always))
            
            Spacer()
            
        CustomTextField(placeHolder: "정답을 입력해주세요")
        }
    }

}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
