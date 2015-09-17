//
//  TableViewController.swift
//  ImaginaryAnimalsLister
//
//  Created by Irene Chen on 9/14/15.
//  Copyright © 2015 MathNotRequired. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    //deleted
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Uncomment the following line to preserve selection between presentations
//        // self.clearsSelectionOnViewWillAppear = false
//
//        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }

    var animalsArray:[ImaginaryAnimal]
    
    required init?(coder aDecoder: NSCoder){ //a failable initializer, because our super init is optional.
        
//        let testAnimal = ImaginaryAnimal(name: "Dragon",
//            height: 150.5,
//            location: "Oceans",
//            dateLastSeen: "1858",
//            imageURL: nil)
//        animalsArray = [testAnimal]
//        animalsArray = []
        animalsArray = AnimalsLoader().loadAnimals()
        super.init(coder: aDecoder)
    }
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return animalsArray.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
//this is where we get the cell to display. Called once for every cell in the table view (animalsArray.count in our case)
        // Configure the cell...
        
        let animal = animalsArray[indexPath.row]
        
        cell.textLabel?.text = "\(indexPath.row + 1). \(animal.name)" //the textLabel is optional, bails if it's nil, in a safe way

        return cell
    }


       // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let destinationViewController = segue.destinationViewController as? DetailViewController, let selectedIndex = self.tableView.indexPathForSelectedRow?.row {
            //as? = if it is a class, DetailViewController, then go do stuff in the if statement.
            let selectedAnimal = animalsArray[selectedIndex]
            destinationViewController.animal = selectedAnimal
        }
    }

}
