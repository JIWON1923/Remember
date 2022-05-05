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
                    //.font(.custom("나눔손글씨 느릿느릿체", size: 30))
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        
                        ForEach(recommendVoca, id: \.id) { r in
                            
                            NavigationLink(destination: RecommendDetail(voca: r, coreDM: coreDM)) {
                                ZStack {
                                    VerticalButton()
                                    
                                    VStack {
                                    
                                        AsyncImage(url: URL(string: r.image)) { phase in
                                            switch phase {
                                            case .success(let image):
                                                image.resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(maxWidth: 116, maxHeight: 116)
                                            default:
                                                Text("")
                                            }
                                        }
                                        Text(r.title)
                                            .fontWeight(.bold)
                                            .foregroundColor(.black)
                                        //.font(.custom("나눔손글씨 느릿느릿체", size: 25))
                                    }
                                }
                            }
                            .padding(7)
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
