//
//  MainView.swift
//  Remember
//
//  Created by 이지원 on 2022/04/29.
//

import SwiftUI

struct MainTabView: View {
    
    let coreDM: CoreDataManager
    
    var body: some View {
        
        ScrollView {
            
            ZStack {
                Color("background")
                    .ignoresSafeArea() // 배경색 깔기
                
                VStack {
                    TestTabView(coreDM: coreDM) // 오늘의 시험
                    TodayWords() // 오늘의 단어
                    MemorizationStatus() // 암기 현황
                    Recommend(coreDM: coreDM)
                }
            }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView(coreDM: CoreDataManager())
    }
}
