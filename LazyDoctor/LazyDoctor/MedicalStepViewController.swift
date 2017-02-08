//
//  SystemsOfTheBodyViewController.swift
//  LazyDoctor
//
//  Created by Elizabeth Atkin on 31/01/2017.
//  Copyright © 2017 Elizabeth Atkin, Dan Pelensky, Veronica Sonzini. All rights reserved.
//

import UIKit

class MedicalStepViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    
    @IBOutlet weak var medicalStepTableView: UITableView!
    enum Step: Int {
        case System = 1
        case InfectionType
        case Pregnant
        case Allergy
    }
    
    var step: Step = .System
    var stepData: [String] = []
    
    
    var clinicalCondition: ClinicalCondition? = nil
    var edit: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clinicalCondition = ClinicalCondition()
        step = .System
        updateStepData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SystemOfTheBodyCell") as? SystemOfTheBodyTableViewCell
        cell?.textLabel?.text = stepData[indexPath.row]
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stepData.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let indexPath = medicalStepTableView.indexPathForSelectedRow
        switch step {
        case .System: clinicalCondition?.system = stepData[(indexPath?.row)!]
        case .InfectionType: clinicalCondition?.typeOfInfection = stepData[(indexPath?.row)!]
        case .Pregnant: clinicalCondition?.isPregnant = stepData[(indexPath?.row)!]
        case .Allergy: clinicalCondition?.isPenicillin = stepData[(indexPath?.row)!]
        }
        if let newStep = Step(rawValue: step.rawValue + 1) {
            step = newStep
            updateStepData()
        } else {
        performSegue(withIdentifier: "ConfirmationSegue", sender: self)
        }
        
       

    }
    
    func updateStepData() {
        switch step {
        case .System: stepData = SystemsOfTheBody().bodySystems
        case .InfectionType: stepData = TypeOfInfection().CNSArray
        case .Pregnant: stepData = Pregnant().pregnantArray
        case .Allergy: stepData = Allergy().allergyArray
        }
        medicalStepTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let confirmationViewController = segue.destination as! ConfirmationViewController
            confirmationViewController.clinicalCondition = clinicalCondition
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor(white: 1, alpha: 0.5)
    }
    
}
