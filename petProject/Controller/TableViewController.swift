//
//  TableViewController.swift
//  petProject
//
//  Created by Сергей Бондарчук on 14.01.2021.
//

import UIKit

class TableViewController: UITableViewController {

    var modelOfData = Places.getPlaces()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelOfData.count
    }
//Mark:
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomCell
        cell.configureCell(name: modelOfData[indexPath.row].name, type: modelOfData[indexPath.row].type!, image: modelOfData[indexPath.row].image ?? #imageLiteral(resourceName: "image"))
        return cell
    }

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }



    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    @IBAction func saveNewRestaurant(_ segue: UIStoryboardSegue) {
        guard let newPlaceVC = segue.source as? AddNewRestTableViewController else {return }
        newPlaceVC.saveNewRestaurant()
        modelOfData.append(newPlaceVC.newPlace!)
        tableView.reloadData()
    }
    
}
