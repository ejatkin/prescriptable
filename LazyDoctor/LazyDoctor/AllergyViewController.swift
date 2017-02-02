//
//  AllergyViewController.swift
//  LazyDoctor
//
//  Created by María Verónica Sonzini on 02/02/2017.
//  Copyright © 2017 Elizabeth Atkin, Dan Pelensky, Veronica Sonzini. All rights reserved.
//

import UIKit

class AllergyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var allergyArray = Allergy().allergyArray
    var clinicalCondition: ClinicalCondition? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allergyArray.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllergyCell") as? AllergyTableViewCell
        let row = indexPath.row
        
        cell?.allergyLabel.text = allergyArray[row]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        clinicalCondition?.isPenicillin = allergyArray[indexPath!.row]
        performSegue(withIdentifier: "showConfirmationSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showConfirmationSegue") {
            let confirmationViewController = segue.destination as! ConfirmationViewController
            confirmationViewController.clinicalCondition = clinicalCondition
            
        }
    }

}
