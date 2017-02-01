//
//  SeverityViewController.swift
//  LazyDoctor
//
//  Created by María Verónica Sonzini on 01/02/2017.
//  Copyright © 2017 Elizabeth Atkin, Dan Pelensky, Veronica Sonzini. All rights reserved.
//

import UIKit

class SeverityViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let severity = Severity().severityArray
    
    var passedValue: String!
    var valueToPass: String!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return severity.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SeverityCell") as? SeverityTableViewCell
        let row = indexPath.row
        cell?.severityLabel.text = severity[row]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        let currentCell = tableView.cellForRow(at: indexPath!) as? SeverityTableViewCell
        
        valueToPass = currentCell?.severityLabel?.text
        performSegue(withIdentifier: "showWeight", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showWeight") {
            let weightViewController = segue.destination as! WeightViewController
            
            weightViewController.passedValue = valueToPass
        }
    }


    

}
