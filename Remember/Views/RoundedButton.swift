//
//  RoundedButton.swift
//  Remember
//
//  Created by 이지원 on 2022/04/30.
//

import SwiftUI

struct RoundedButton: View {
    
    let buttonText: String
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color("point"))
                .frame(width: 150, height: 40)
                .cornerRadius(20)
            
            Text(buttonText)
                .fontWeight(.bold)
                .foregroundColor(.white)
            
        }
    }
}

struct RoundedButton_Previews: PreviewProvider {
    static var previews: some View {
        RoundedButton(buttonText: "돌아가기")
    }
}
