//
//  ChildOrAdultViewController.swift
//  LazyDoctor
//
//  Created by Elizabeth Atkin on 01/02/2017.
//  Copyright © 2017 Elizabeth Atkin, Dan Pelensky, Veronica Sonzini. All rights reserved.
//

import UIKit

class ChildOrAdultViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var valueToPass: String!
    var passedValue: String!
    
    let childOrAdult = ChildOrAdult().childarray

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
    
}
