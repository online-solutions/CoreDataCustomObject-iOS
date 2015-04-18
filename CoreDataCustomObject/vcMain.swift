//
//  vcMain.swift
//  CoreDataCustomObject
//
//  Created by KhanhPhung on 18/4/15.
//  Copyright (c) 2015 Online Solutions. All rights reserved.
//

import UIKit
import CoreData

class vcMain: UIViewController {
    
    @IBOutlet var txtUsername: UITextField!
    @IBOutlet var txtPassword: UITextField!
    
    @IBAction func btnSave_Clicked(){
        println("Save button clicked")
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context:NSManagedObjectContext = appDel.managedObjectContext!
        
        let ent = NSEntityDescription.entityForName("Users", inManagedObjectContext: context)
        
        var newUser = Users(entity: ent!, insertIntoManagedObjectContext: context)
        newUser.username = txtUsername.text
        newUser.password = txtPassword.text
        
        context.save(nil)
        
        println(newUser)
        println("Object saved")
        
    }
    
    @IBAction func btnLoad_Clicked(){
        let appDel: AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context:NSManagedObjectContext = appDel.managedObjectContext!
        
        let request = NSFetchRequest(entityName: "Users")
        request.returnsObjectsAsFaults = false;
        
        request.predicate = NSPredicate(format: "username = %@", txtUsername.text)
        
        var results: NSArray = context.executeFetchRequest(request, error: nil)!
        if results.count > 0 {
            println("\(results.count) found!")
            
            for user in results{
                var thisUser = user as! Users
                println(thisUser.toString())
                thisUser.addPrefix("somePrefix--")
                println(thisUser.toString())
            }
        } else {
            println("error: username not found")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
