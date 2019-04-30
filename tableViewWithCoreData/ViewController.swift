//
//  ViewController.swift
//  tableViewWithCoreData
//
//  Created by Marlon Escobar on 2019-04-29.
//  Copyright © 2019 Marlon Escobar A. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    let persistenceManager: PersistenceManager
    var people = [Person]()
    
    init(persistenceManager: PersistenceManager ){//Dependecy Injection
        self.persistenceManager = persistenceManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createPerson()
    }
    
    func printPeople(){
        people.forEach({print($0.name)})
    }
    
   //Create CoreData object
    func createPerson(){
//        let person = Person(name: "Jaime", email: "jaime@gmail.com", phone: 563746543)
        let person = Person(context: persistenceManager.context)
        person.name = "Jaime"
        person.email = "jaime@gmail.com"
        person.phone = 563746543
        
        persistenceManager.saveContext()
        
    }
    
    func getPeople(){
//        guard let people = try! persistenceManager.context.fetch(Person.fetchRequest()) as? [Person] else { return }
        
        let people = persistenceManager.fetch(Person.self)
        self.people = people
        printPeople()
        
        let deadLine = DispatchTime.now() + .seconds(5)
        DispatchQueue.main.asyncAfter(deadline: deadLine, execute: updatePerson)
    }
    
    func updatePerson(){
        let firstPerson = people.first!
        firstPerson.name += "Pedro"
        persistenceManager.saveContext()
    }
    
    func deletePerson(){
        let firstPerson = people.first!
        persistenceManager.context.delete(firstPerson)
        persistenceManager.saveContext()
        printPeople()
    }


}

