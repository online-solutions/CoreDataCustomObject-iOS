//
//  Users.swift
//  CoreDataCustomObject
//
//  Created by KhanhPhung on 18/4/15.
//  Copyright (c) 2015 Online Solutions. All rights reserved.
//

import UIKit
import Foundation
import CoreData

@objc(Users)
class Users: NSManagedObject {
    
    override init(entity: NSEntityDescription, insertIntoManagedObjectContext context: NSManagedObjectContext?) {
        super.init(entity: entity, insertIntoManagedObjectContext: context)
    }

    @NSManaged var username: String
    @NSManaged var password: String

    func toString() -> String{
        return "The username is \(username) and password is \(password)"
    }
    
    func addPrefix(prefix:String){
        username = prefix + username
    }
    
    func checkValidPassword(inputPassword:String) -> Bool{
        if inputPassword == password{
            return true
        }
        return false
    }
}
