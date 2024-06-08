//
//  DataBaseManager.swift
//  Quotes
//
//  Created by Afnan Ahmed on 12/12/2023.
//

import Foundation
import UIKit
import CoreData

class DataBaseManager {
    
    private var context: NSManagedObjectContext {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    
    func addPoems(title: String, name: String, firstname: String, lastname: String, Poem: String, like: Bool)
    {
        let userpoems = Poems(context: context)
        
        userpoems.title = title
        userpoems.poemname = name
        userpoems.firstname = firstname
        userpoems.lastname = lastname
        userpoems.poem = Poem
        userpoems.like = like
        do {
            try context.save()
        }catch {
            print("User Saving Error", error)
        }
    }
    
    func updateQoute(title: String, name: String, firstname: String, lastname: String, Poem: String, like: Bool, userpoems: Poems)
    {
        userpoems.title = title
        userpoems.firstname = firstname
        userpoems.lastname = lastname
        userpoems.poem = Poem
        userpoems.poemname = name
        userpoems.like = like
        do {
            try context.save()
        }catch {
            print("User Saving Error", error)
        }
    }
    
    func fetchPoems() -> [Poems] {
        var quotes: [Poems] = []
        
        do {
            quotes = try context.fetch(Poems.fetchRequest())
            
        }catch {
            print("Fetch Error", error)
        }
        
        return quotes
    }
}
