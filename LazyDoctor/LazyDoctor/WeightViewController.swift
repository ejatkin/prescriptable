//
//  WeightViewController.swift
//  LazyDoctor
//
//  Created by Dan Pelensky on 1/2/17.
//  Copyright © 2017 Elizabeth Atkin, Dan Pelensky, Veronica Sonzini. All rights reserved.
//

import UIKit

class WeightViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let weight = Weight().weightArray
    
    var clinicalCondition: ClinicalCondition? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WeightCell") as? WeightTableViewCell
        let row = indexPath.row
        cell?.weightLabel.text = weight[row]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weight.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
         clinicalCondition?.weight = weight[indexPath!.row]
        performSegue(withIdentifier: "ShowChildOrAdultSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "ShowChildOrAdultSegue") {
            let childOrAdultViewController = segue.destination as! ChildOrAdultViewController
            childOrAdultViewController.clinicalCondition = clinicalCondition
        }
    }
    
    
}
