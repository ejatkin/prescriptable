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
    var clinicalCondition: ClinicalCondition? = nil
    var edit: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clinicalCondition = ClinicalCondition()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SystemOfTheBodyCell") as? SystemOfTheBodyTableViewCell
        let row = indexPath.row
        cell?.systemOfTheBodyTitleLabel.text = bodySystems[row]
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bodySystems.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        clinicalCondition?.system = bodySystems[indexPath!.row]
        if edit {
            _ = navigationController?.popViewController(animated: true)
        } else {
            performSegue(withIdentifier: "showSeverity", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showSeverity") {
            let severityViewController = segue.destination as! SeverityViewController
            severityViewController.clinicalCondition = clinicalCondition
            
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor(white: 1, alpha: 0.5)
    }
    
}
