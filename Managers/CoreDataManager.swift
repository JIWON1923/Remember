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
    func getAllTest() -> [TestVoca] {
        let fetchRequest: NSFetchRequest<TestVoca> = TestVoca.fetchRequest()
        let sort = NSSortDescriptor(keyPath: \TestVoca.date, ascending: true)
        fetchRequest.sortDescriptors = [sort]
        
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
    func saveTest(title: String, words: [String], meanings: [String],
                  score: [Int], date: String, count: Int16, isCorrect: [Bool]) {
        
        let test = TestVoca(context: persistentContainer.viewContext)
        test.title = title
        test.words = words
        test.meanings = meanings
        test.id = UUID()
        test.date = date
        test.score = score
        test.count = count
        test.isCorrect = isCorrect
        
        
        do {
           try persistentContainer.viewContext.save()
            
        } catch {
            print("Failed to save voca \(error.localizedDescription)")
        }
    }
    
    func getAllTestVoca() -> [TestVoca] {
        let fetchRequest: NSFetchRequest<TestVoca> = TestVoca.fetchRequest()
        let sort = NSSortDescriptor(keyPath: \TestVoca.date, ascending: true)
        fetchRequest.sortDescriptors = [sort]
        
        do {
            return try persistentContainer.viewContext.fetch(fetchRequest)
        } catch {
            return []
        }
    }
    
    func saveVoca(title: String, words: [String], meanings: [String],
                  score: [Int], date: String, count: Int16, isCorrect: [Bool]) {
        
        let voca = Voca(context: persistentContainer.viewContext)
        voca.title = title
        voca.words = words
        voca.meanings = meanings
        voca.id = UUID()
        voca.date = date
        voca.score = score
        voca.count = count
        voca.isCorrect = isCorrect
        
        
        do {
           try persistentContainer.viewContext.save()
            
        } catch {
            print("Failed to save voca \(error.localizedDescription)")
        }
    }

    func getAllVoca() -> [Voca] {
        let fetchRequest: NSFetchRequest<Voca> = Voca.fetchRequest()
        let sort = NSSortDescriptor(keyPath: \Voca.date, ascending: true)
        fetchRequest.sortDescriptors = [sort]
        
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
    
    func deleteVoca(test: TestVoca) {
        persistentContainer.viewContext.delete(test)
        
        do {
            try persistentContainer.viewContext.save()
        } catch {
            persistentContainer.viewContext.rollback()
            print("Failed to save Context \(error)")
        }
    }
   
}
