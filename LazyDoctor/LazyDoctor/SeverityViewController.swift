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
    var clinicalCondition: ClinicalCondition? = nil

    var edit: Bool = false

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
        clinicalCondition?.severity = severity[indexPath!.row]
        if edit {
            _ = navigationController?.popViewController(animated: true)
        } else {
            performSegue(withIdentifier: "showWeight", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showWeight") {
            let typeOfInfectionViewController = segue.destination as! TypeOfInfectionViewController
            typeOfInfectionViewController.clinicalCondition = clinicalCondition
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor(white: 1, alpha: 0.5)
    }


    

}
