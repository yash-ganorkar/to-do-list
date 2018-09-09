//
//  CompleteAgendaViewController.swift
//  Agenda
//
//  Created by Yash Ganorkar on 9/9/18.
//  Copyright © 2018 Yash Ganorkar. All rights reserved.
//

import UIKit

class CompleteAgendaViewController: UIViewController {

    var previousVC = AgendaTableViewController()
    var selectedAgenda = Agenda()
    
    @IBOutlet weak var titleLabel: UILabel?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let titleLabel = titleLabel{
            titleLabel.text = selectedAgenda.name
        }
    }
    @IBAction func completeTapped(_ sender: UIButton) {
        
        var index = 0
        
        for agenda in previousVC.agendas {
            if agenda.name == selectedAgenda.name {
                previousVC.agendas.remove(at: index)
                previousVC.tableView.reloadData()
                
                navigationController?.popViewController(animated: true)
                break
            }
            index += 1
        }
    }
}
