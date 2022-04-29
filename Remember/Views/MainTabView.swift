//
//  MainView.swift
//  Remember
//
//  Created by 이지원 on 2022/04/29.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        
        ZStack {
            Color("background")
               .ignoresSafeArea() // 배경색 깔기
            
            VStack {
                TodayWords() // 오늘의 단어
                MemorizationStatus() // 암기 현황
                Recommend()
            }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}