//
//  RenderingView.swift
//  Remember
//
//  Created by 이지원 on 2022/05/01.
//

import SwiftUI

struct RenderingView: View {
    var body: some View {
        ZStack {
            Color("point")
                .ignoresSafeArea()
            Image("Image")
        }
    }
}

struct RenderingView_Previews: PreviewProvider {
    static var previews: some View {
        RenderingView()
    }
}
