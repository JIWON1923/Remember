//
//  DataDecoding.swift
//  Remember
//
//  Created by 이지원 on 2022/05/04.
//

import SwiftUI

struct RecommendVoca: Codable, Hashable {
    
    var id: Int
    let title, image: String
    let words, meanings: [String]
    
    static let allVoca: [RecommendVoca] = Bundle.main.decode(file: "example.json")
    //static let sampleVoca: RecommendVoca = allVoca[0]
}

extension Bundle {
    
    func decode<T: Decodable>(file: String) -> T {
        
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not find \(file) in the project!")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Could not find \(file) in the project!")
        }
        
        let decoder = JSONDecoder()
        
        guard let loadData = try? decoder.decode(T.self, from: data) else {
            fatalError("Could not decode \(file) in the project!")
        }
        
        return loadData
    }
}
