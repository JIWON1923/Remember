//
//  ContentView.swift
//  Remember
//
//  Created by 이지원 on 2022/04/29.
//

import SwiftUI

struct ContentView: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("메인")
                }
            
            Text("Pencil")
                .tabItem {
                    Image(systemName: "pencil")
                    Text("시험보기")
                }
        
            Text("Plus")
                .tabItem {
                    Image(systemName: "plus.circle")
                    Text("단어장 만들기")
                }
            
            Text("Note")
                .tabItem {
                    Image(systemName: "note.text")
                    Text("단어장 보기")
                }
            
            Text("User")
                .tabItem {
                    Image(systemName: "person")
                    Text("마이페이지")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
