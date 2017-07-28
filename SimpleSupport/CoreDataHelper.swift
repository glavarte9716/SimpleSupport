//
//  CoreDataHelper.swift
//  SimpleSupport
//
//  Created by Gabe Lavarte on 7/25/17.
//  Copyright © 2017 Gabe Lavarte. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class CoreDataHelper {
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let persistentContainer = appDelegate.persistentContainer
    static let managedContext = persistentContainer.viewContext
    
    //Creates an instance of SpelledWord
    static func createSpelledWord() -> SpelledWord {
        let word = NSEntityDescription.insertNewObject(forEntityName: "SpelledWord", into: managedContext) as!SpelledWord
        return word
    }
    
    //Saves the current Word in CoreData
    static func saveSpelledWord() {
        do {
            try managedContext.save()
        }
        catch let error as NSError {
            print("Could not save \(error)")
        }
    }
    
    //Fetches all the Words that have been saved.
    static func retrieveSpelledWords() -> [SpelledWord] {
        let fetchRequest = NSFetchRequest<SpelledWord>(entityName: "SpelledWord")
        
        do {
            let words: [SpelledWord] = try managedContext.fetch(fetchRequest)
            return words
        }
        catch let error as NSError{
            print ("Could note fetch \(error)")
        }
        return []
    }
    
    //Deletes an item from CoreData
    static func deleteSpelledWord(entityName: SpelledWord) {
        managedContext.delete(entityName)
        saveSpelledWord()
    }
    
    
    
    
    

    
}
