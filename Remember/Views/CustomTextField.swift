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
    @Binding var currentPage: Int
    @Binding var needRefresh: Bool
    @Binding var testResult: [String]
    let voca: Voca
    let coreDM = CoreDataManager()
    var body: some View {
        let meanings = voca.meanings!
        
        ZStack {
            Rectangle()
                .fill(Color.white)
                .frame(height: 50)
            HStack {
                Spacer()
                TextField("정답을 입력해주세요", text: $inputText)
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
                .onTapGesture {
                    if currentPage < meanings.count {
                        isCorrected(index: currentPage, meaning: meanings[currentPage], input: inputText)
                        
                        
                        currentPage += 1
                    } else {
                        needRefresh.toggle()
                    }
                    inputText = ""
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
    func isCorrected(index: Int, meaning: String, input: String) {
        if meaning == input {
            var c = voca.isCorrect
            c![index] += 1
            
            voca.isCorrect = c
            coreDM.updateVoca()
        }
    }
}

struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(currentPage: .constant(0), needRefresh: .constant(false), testResult: .constant(["1"]), voca: Voca())
    }
}
