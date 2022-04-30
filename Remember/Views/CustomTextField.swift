//
//  TextField.swift
//  Remember
//
//  Created by 이지원 on 2022/04/30.
//

import SwiftUI

struct CustomTextField: View {
    @State var inputText = ""
    let placeHolder: String
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .frame(height: 50)
            HStack {
                Spacer()
                TextField(placeHolder, text: $inputText)
                    .padding(10)
                    .background(Color("background"))
                    .background(
                            Capsule()
                                //.strokeBorder(Color.black,lineWidth: 0.8)
                                .background(Color.blue)
                                .clipped()
                        )
                        .clipShape(Capsule())
//                    .cornerRadius(20)
                    .lineLimit(1)
//                    .textFieldStyle(.roundedBorder)
                    
                ZStack {
                    Circle()
                        .fill(Color("point"))
                        .frame(width: 30, height: 30)
                    Image(systemName: "checkmark")
                        //.font(Font.title.weight(.semibold))
                        .font(.system(size: 20).weight(.bold))
                        .foregroundColor(.white)
                }
                Spacer()
            }
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(placeHolder: "정답을 입력하세요")
    }
}
