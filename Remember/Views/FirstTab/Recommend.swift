//
//  Recommend.swift
//  Remember
//
//  Created by 이지원 on 2022/04/29.
//

import SwiftUI

struct Recommend: View {
    
    let coreDM: CoreDataManager
    
    var recommendVoca: [RecommendVoca] = RecommendVoca.allVoca
    
    var body: some View {
        
        //let bookNames = ["피노키오", "수능특강2", "백설공주", "카페"]
        
        ZStack {
            Rectangle()
                .fill(Color.white)
                .frame(height: 270)
            
            VStack(alignment: .leading) {
                Text("추천 단어장")
                    .fontWeight(.bold)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        
                        ForEach(recommendVoca, id: \.id) { r in
                            
                            NavigationLink(destination: RecommendDetail(voca: r, coreDM: coreDM)) {
                                ZStack {
                                    VerticalButton()
                                    Text(r.title)
                                        .fontWeight(.bold)
                                }
                            }
                            .padding(.leading, 15)
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

struct RecommenVoca: Decodable {
    var title: String
    var words: [String]
    var meanings: [String]
}

struct Recommend_Previews: PreviewProvider {
    static var previews: some View {
        Recommend(coreDM: CoreDataManager())
    }
}
