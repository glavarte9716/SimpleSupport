//
//  ViewController.swift
//  SimpleSupport
//
//  Created by Gabe Lavarte on 7/24/17.
//  Copyright © 2017 Gabe Lavarte. All rights reserved.
//

import UIKit


class SpellerViewController: UITableViewController {
    
    var words = [SpelledWord](){
        didSet {
            tableView.reloadData()
        }
    }
    
    @IBAction func unwindToSpellerListController(_ segue: UIStoryboardSegue) {
        words = CoreDataHelper.retrieveSpelledWords()
    }
    
    
    @IBAction func addButtonTapped(sender: UIBarButtonItem) {
        
        let alertController = UIAlertController(title: "Add Item", message: "Enter Something to spell", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { action in   }
        
        let saveAction = UIAlertAction(title: "Save", style: .default) { [weak alertController, unowned self] _ in
            if let alertController = alertController {
                let textIn = alertController.textFields![0] as UITextField
                let newWord = CoreDataHelper.createSpelledWord()
                newWord.word = textIn.text
                CoreDataHelper.saveSpelledWord()
                self.words = CoreDataHelper.retrieveSpelledWords()
            }
        }
        
        alertController.addTextField() { textField in
            textField.placeholder = "Name or Email"
        }
        
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return words.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "spellerCell", for: indexPath) as! SpellerTableViewCell
        
        let row = (words.count-1)-indexPath.row
        
        let currWord = words[row]
        
        cell.spellerItem.text = currWord.word
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //1
            CoreDataHelper.deleteSpelledWord(entityName: words[(words.count-1)-indexPath.row])
            //2
            words = CoreDataHelper.retrieveSpelledWords()
        }
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        words = CoreDataHelper.retrieveSpelledWords()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

