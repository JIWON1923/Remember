//
//  ContentView.swift
//  Remember
//
//  Created by 이지원 on 2022/04/29.
//

import SwiftUI

struct ContentView: View {
    
    @State var navigationTitle = "리멤버"
    
    let coreDM = CoreDataManager()
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                tabViews
            }
            .navigationTitle(Text(navigationTitle))
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarColor(backgroundColor: UIColor(Color("point")), tintColor: .white)
        }
    }
    
    
    var tabViews: some View {
        
        TabView(selection: $navigationTitle) {
            
            MainTabView(coreDM: coreDM)
            
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("메인")
                }.tag("리멤버")
            
            //            TestTabView()
            //                .tabItem {
            //                    Image(systemName: "pencil")
            //                    Text("시험보기")
            //                }.tag("시험보기")
            //
            CreateVocabulary(coreDM: coreDM)
            
                .tabItem {
                    Image(systemName: "plus.circle")
                    Text("단어장 만들기")
                }.tag("단어장 만들기")
            
            MyVocabularyTabView(coreDM: coreDM)
            
                .tabItem {
                    Image(systemName: "note.text")
                    Text("단어장 보기")
                }.tag("단어장 보기")
            //            
            //            MyPageTabView()
            //                .tabItem {
            //                    Image(systemName: "person")
            //                    Text("마이페이지")
            //                }.tag("마이페이지")
            
        }
        .accentColor(Color("point"))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
