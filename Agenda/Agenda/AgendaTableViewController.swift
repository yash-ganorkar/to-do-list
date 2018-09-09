//
//  AgendaTableViewController.swift
//  Agenda
//
//  Created by Yash Ganorkar on 9/9/18.
//  Copyright © 2018 Yash Ganorkar. All rights reserved.
//

import UIKit

class AgendaTableViewController: UITableViewController {

    var agendas : [Agenda] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        agendas = createAgendas()
    }
    
    func createAgendas() -> [Agenda] {
        let eggs = Agenda()
        eggs.important = true
        eggs.name = "Buy Eggs"
        
        let dog = Agenda()
        dog.name = "Walk the dog"
        
        let cheese = Agenda()
        cheese.name = "Eat Cheese"
        
        return [eggs, dog, cheese];
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return agendas.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        let agenda = agendas[indexPath.row]
        
        if agenda.important {
            cell.textLabel?.text = " ❗️ " + agendas[indexPath.row].name
        }
        else {
            cell.textLabel?.text = agendas[indexPath.row].name
        }

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let agenda = agendas[indexPath.row]
        performSegue(withIdentifier: "moveToComplete", sender: agenda)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addVC = segue.destination as? AddAgendaViewController {
            addVC.previousVC = self
        }
        
        if let completeVC = segue.destination as? CompleteAgendaViewController {
            if let agenda = sender as? Agenda {
                completeVC.selectedAgenda = agenda
                completeVC.previousVC = self
            }
        }
    }
}
