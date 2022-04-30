//
//  MemorizationStatus.swift
//  Remember
//
//  Created by 이지원 on 2022/04/29.
//

import SwiftUI

struct MemorizationStatus: View {
    let bookNames = ["라푼젤", "회화", "수능특강", "여행"]
    let corrects = [10, 20, 21, 25]
    let totals = [15, 22, 20, 25]
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.white)
                .frame(height: 270)
            
            VStack(alignment: .leading) {
                
                Text("암기 현황")
                    .fontWeight(.bold)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack{
                        
                        ForEach(0..<4){ index in
                            ZStack{
                                VerticalButton()
                                    
                                
                                VStack {
                                    Text(bookNames[index])
                                        .fontWeight(.bold)
                                        .padding(3)
                                        
                                    HStack {
                                        Text(String(corrects[index]))
                                        Text("/")
                                        Text(String(totals[index]))
                                    }
                                }
                            }.padding(.leading, 15)
                                .padding(.bottom, 15)
                                .padding(.top, 15)
                            
                        }
                    }
                }
            }
            .padding()
        }
    }
}

struct MemorizationStatus_Previews: PreviewProvider {
    static var previews: some View {
        MemorizationStatus()
    }
}
