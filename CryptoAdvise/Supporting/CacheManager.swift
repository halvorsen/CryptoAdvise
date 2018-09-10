//
//  CacheManager.swift
//  CryptoAdvise
//
//  Created by Aaron Halvorsen on 8/18/18.
//  Copyright © 2018 Aaron Halvorsen. All rights reserved.
//

import CoreData
import Foundation

final class CacheManager {
    // future me will persist previous app state for loading
    static var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "CryptoAdvise")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    static func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
   
    static var newBackgroundContext: NSManagedObjectContext {
        return CacheManager.persistentContainer.newBackgroundContext()
    }
    
    static var viewContext: NSManagedObjectContext {
        return CacheManager.persistentContainer.viewContext
    }

}
