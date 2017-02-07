//
//  WeightViewController.swift
//  LazyDoctor
//
//  Created by Dan Pelensky on 1/2/17.
//  Copyright © 2017 Elizabeth Atkin, Dan Pelensky, Veronica Sonzini. All rights reserved.
//

import UIKit

class TypeOfInfectionViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let typeOfInfection = TypeOfInfection().CNSArray
    var clinicalCondition: ClinicalCondition? = nil

    var edit: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeightCell") as? TypeOfInfectionTableViewCell
        let row = indexPath.row
        cell?.weightLabel.text = typeOfInfection[row]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return typeOfInfection.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
         clinicalCondition?.typeOfInfection = typeOfInfection[indexPath!.row]
        if edit {
            _ = navigationController?.popViewController(animated: true)
        } else {
            performSegue(withIdentifier: "ShowChildOrAdultSegue", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "ShowChildOrAdultSegue") {
            let childOrAdultViewController = segue.destination as! ChildOrAdultViewController
            childOrAdultViewController.clinicalCondition = clinicalCondition
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor(white: 1, alpha: 0.5)
    }
    
    
}
