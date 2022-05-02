//
//  TextField.swift
//  Remember
//
//  Created by 이지원 on 2022/04/30.
//

import SwiftUI

struct CustomTextField: View {
    @State var inputText = ""
    @State var keyboardHeight: CGFloat = 0
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
                                .background(Color.blue)
                                .clipped()
                        )
                        .clipShape(Capsule())
                    .lineLimit(1)
                    
                ZStack {
                    Circle()
                        .fill(Color("point"))
                        .frame(width: 30, height: 30)
                    Image(systemName: "checkmark")
                        .font(.system(size: 20).weight(.bold))
                        .foregroundColor(.white)
                }
                Spacer()
            }
            .padding()
        }
        .padding(.bottom, self.keyboardHeight)
        .onAppear() {
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardDidShowNotification, object: nil, queue: .main) { (data) in
                let h = data.userInfo![UIResponder.keyboardFrameEndUserInfoKey]
                    as! NSValue
                self.keyboardHeight = h.cgRectValue.height - 240
            }
            
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardDidHideNotification, object: nil, queue: .main) { (data) in
                self.keyboardHeight = 0
            }
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(placeHolder: "정답을 입력하세요")
    }
}
