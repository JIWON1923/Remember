//
//  MyPageTabView.swift
//  Remember
//
//  Created by 이지원 on 2022/04/30.
//

import SwiftUI

struct MyPageTabView: View {
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text("학습 현황")
                .fontWeight(.bold)
            
            Rectangle()
                .fill(Color.white)
                .cornerRadius(10)
                .frame(width: 350, height: 300)
                .shadow(color: Color("shadow"), radius: 5)
                .padding(3)
            
            Text("총 192개의 단어를 외웠어요!")
        }
    }
}

struct MyPageTabView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageTabView()
    }
}
