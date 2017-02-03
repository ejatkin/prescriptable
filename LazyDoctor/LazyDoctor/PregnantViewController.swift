//
//  PregnantViewController.swift
//  LazyDoctor
//
//  Created by María Verónica Sonzini on 01/02/2017.
//  Copyright © 2017 Elizabeth Atkin, Dan Pelensky, Veronica Sonzini. All rights reserved.
//

import UIKit

class PregnantViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let pregnantArray = Pregnant().pregnantArray
    var clinicalCondition: ClinicalCondition? = nil
    
    var edit: Bool = false



    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PregnantCell") as? PregnantTableViewCell
        let row = indexPath.row
        
        cell?.pregnantLabel.text = pregnantArray[row]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pregnantArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        clinicalCondition?.isPregnant = pregnantArray[indexPath!.row]
        if edit {
            _ = navigationController?.popViewController(animated: true)
        } else {
            performSegue(withIdentifier: "showAllergySegue", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showAllergySegue") {
            let allergyViewController = segue.destination as! AllergyViewController
            allergyViewController.clinicalCondition = clinicalCondition
        }
    }
    
}
