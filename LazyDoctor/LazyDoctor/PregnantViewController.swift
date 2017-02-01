//
//  PregnantViewController.swift
//  LazyDoctor
//
//  Created by María Verónica Sonzini on 01/02/2017.
//  Copyright © 2017 Elizabeth Atkin, Dan Pelensky, Veronica Sonzini. All rights reserved.
//

import UIKit

class PregnantViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var valueToPass: String!
    var passedValue: String!
    
    let pregnantArray = Pregnant().pregnantArray

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
    
}
