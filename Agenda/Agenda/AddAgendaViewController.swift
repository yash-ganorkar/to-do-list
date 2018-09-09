//
//  AddAgendaViewController.swift
//  Agenda
//
//  Created by Yash Ganorkar on 9/9/18.
//  Copyright © 2018 Yash Ganorkar. All rights reserved.
//

import UIKit

class AddAgendaViewController: UIViewController {
    
    var previousVC = AgendaTableViewController()

    @IBOutlet weak var titleTextField: UITextField?
    @IBOutlet weak var importantSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func addTapped(_ sender: UIButton) {
        let agenda = Agenda()
        
        if let name = titleTextField?.text {
            agenda.name = name
            
            agenda.important = importantSwitch.isOn
            
            previousVC.agendas.append(agenda)
            previousVC.tableView.reloadData()
            
            navigationController?.popViewController(animated: true)
        }
    }
}
