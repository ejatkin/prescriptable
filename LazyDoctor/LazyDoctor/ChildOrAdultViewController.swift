//
//  ChildOrAdultViewController.swift
//  LazyDoctor
//
//  Created by Elizabeth Atkin on 01/02/2017.
//  Copyright © 2017 Elizabeth Atkin, Dan Pelensky, Veronica Sonzini. All rights reserved.
//

import UIKit

class ChildOrAdultViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let childOrAdult = ChildOrAdult().childarray
    
    var clinicalCondition: ClinicalCondition? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return childOrAdult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChildOrAdultCell") as? ChildOrAdultTableViewCell
        let row = indexPath.row
        cell?.childoradultLabel.text = childOrAdult[row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        clinicalCondition?.isChild = childOrAdult[indexPath!.row]
        performSegue(withIdentifier: "showPregnantSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showPregnantSegue") {
            let pregnantViewController = segue.destination as! PregnantViewController
            pregnantViewController.clinicalCondition = clinicalCondition
        }
    }
    
    
}
