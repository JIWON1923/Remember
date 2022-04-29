//
//  VerticalButton.swift
//  Remember
//
//  Created by 이지원 on 2022/04/29.
//

import SwiftUI

struct VerticalButton: View {
    var body: some View {
        Rectangle()
            .fill(Color.white)
            .frame(width: 150, height: 200)
            .cornerRadius(10)
            .shadow(color: Color("shadow"), radius: 5)
    }
}

struct VerticalButton_Previews: PreviewProvider {
    static var previews: some View {
        VerticalButton()
    }
} 
