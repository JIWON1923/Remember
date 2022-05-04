//
//  TextField.swift
//  Remember
//
//  Created by 이지원 on 2022/04/30.
//

import SwiftUI

struct CustomTextField: View {
    
    @EnvironmentObject var appState: AppState
    
    @State var inputText = ""
    @State var keyboardHeight: CGFloat = 0
    
    @Binding var currentPage: Int
    @Binding var testResult: [String]
    
    let voca: TestVoca
    let coreDM: CoreDataManager
    
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
                        
                        if isCorrected(answer: meanings[currentPage],
                                       userAnswer: inputText) {
                            
                            var tmpScore = voca.score
                            tmpScore![currentPage] += 1
                            voca.score = tmpScore
                            
                            var tmpCorrect = voca.isCorrect
                            tmpCorrect![currentPage] = true
                            voca.isCorrect = tmpCorrect
                            coreDM.updateVoca()
                            
                            if currentPage == meanings.count-1 {
                                currentPage = 0
                                appState.hasOnboarded = true
                            }
                        }
                        currentPage += 1
                        inputText = ""
                    }
                    else {
                        appState.hasOnboarded = true
                    }
                }
                Spacer()
            }
            .padding()
        }
        .padding(.bottom, self.keyboardHeight)
        
        .onAppear() {
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardDidShowNotification,
                                                   object: nil, queue: .main) { (data) in
                let h = data.userInfo![UIResponder.keyboardFrameEndUserInfoKey]
                as! NSValue
                self.keyboardHeight = h.cgRectValue.height - 240
            }
            
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardDidHideNotification,
                                                   object: nil, queue: .main) { (data) in
                self.keyboardHeight = 0
            }
        }
    }
    
    func isCorrected(index: Int, meaning: String, input: String) {
        
        if meaning == input {
            
            var c = voca.score
            c![index] += 1
            voca.score = c
            coreDM.updateVoca()
        }
    }
    
    func isCorrected(answer: String, userAnswer: String) -> Bool {
        print(answer == userAnswer)
        guard answer == userAnswer else { return false }
        return true
    }
}

//struct CustomTextField_Previews: PreviewProvider {
//    static var previews: some View {
//        CustomTextField(currentPage: .constant(0), testResult: .constant(["1"]), isCorrect: .constant([0]), voca: Voca(), coreDM: CoreDataManager())
//    }
//}
