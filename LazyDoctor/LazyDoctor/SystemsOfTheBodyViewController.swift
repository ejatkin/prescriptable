//
//  SystemsOfTheBodyViewController.swift
//  LazyDoctor
//
//  Created by Elizabeth Atkin on 31/01/2017.
//  Copyright © 2017 Elizabeth Atkin, Dan Pelensky, Veronica Sonzini. All rights reserved.
//

import UIKit

class SystemsOfTheBodyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    let bodySystems = SystemsOfTheBody().bodySystems
    
    let clinicalCondition = ClinicalCondition()
    
    var valueToPass: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //
    //    func updateClinicalConditionWithSelectedItem() {
    //        clinicalCondition.system =
    //    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SystemOfTheBodyCell") as? SystemOfTheBodyTableViewCell
        let row = indexPath.row
        cell?.systemOfTheBodyTitleLabel.text = bodySystems[row]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bodySystems.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        let currentCell = tableView.cellForRow(at: indexPath!) as? SystemOfTheBodyTableViewCell
        
        valueToPass = currentCell?.systemOfTheBodyTitleLabel?.text
        performSegue(withIdentifier: "showSeverity", sender: self)
    }
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if (segue.identifier == "showSeverity") {
                let severityViewController = segue.destination as! SeverityViewController
    
                severityViewController.passedValue = valueToPass
            }
        }
    
}
