//
//  HorizontalButton.swift
//  Remember
//
//  Created by 이지원 on 2022/04/29.
//

import SwiftUI

struct HorizontalButton: View {
    var body: some View {
        Rectangle()
            .fill(Color.white)
            .cornerRadius(10)
            .frame(width: 350, height: 120)
            .shadow(color: Color("shadow"), radius: 5)
    }
}

struct HorizontalButton_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalButton()
    }
}
