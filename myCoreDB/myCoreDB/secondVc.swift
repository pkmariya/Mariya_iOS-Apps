//
//  secondVc.swift
//  myCoreDB
//
//  Created by Mariya Arul Raj on 25/12/18.
//  Copyright © 2018 Mariya Arul Raj. All rights reserved.
//

import UIKit
import CoreData

class secondVc: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var myTable: UITableView!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.userArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = self.userArray[indexPath.row]
        return cell
    }
    
    var userArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.myTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.fetchData()
        self.myTable.reloadData()
    }
    
    func fetchData(){
        let appDel: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDel.persistentContainer.viewContext
        
        do{
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
            let results = try context.fetch(request)
        
            for items in results as! [NSManagedObject] {
                let firstname = items.value(forKey: "firstName") as! String
                let lastname = items.value(forKey: "lastName") as! String
                
                self.userArray.append(firstname+" "+lastname)
                
            }
        }
        catch {
                print("error while fetching")
            }
    }
}
