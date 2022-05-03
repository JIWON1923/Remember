//
//  CoreDataManager.swift
//  Remember
//
//  Created by 이지원 on 2022/05/03.
//

import Foundation
import CoreData

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    
    init() {
        persistentContainer = NSPersistentContainer(name: "Remember")
        persistentContainer.loadPersistentStores(completionHandler: { (description, error) in
            if let error = error {
                fatalError("CoreData Store faild\(error.localizedDescription)")
            }
        })
    }
    
    func saveVoca(title: String, words: [String], meanings: [String], isCorrect: [Int]) {
        
        let voca = Voca(context: persistentContainer.viewContext)
        voca.title = title
        voca.words = words
        voca.meanings = meanings
        voca.id = UUID()
        voca.isCorrect = isCorrect
        
        
        do {
           try persistentContainer.viewContext.save()
            
        } catch {
            print("Failed to save voca \(error.localizedDescription)")
        }
    }

    func getAllVoca() -> [Voca] {
        let fetchRequest: NSFetchRequest<Voca> = Voca.fetchRequest()
        
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
    
    func updateVoca() {
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
        }
    }

}
