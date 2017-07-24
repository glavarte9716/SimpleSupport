//
//  ViewController.swift
//  SimpleSupport
//
//  Created by Gabe Lavarte on 7/24/17.
//  Copyright © 2017 Gabe Lavarte. All rights reserved.
//

import UIKit

class SpellerViewController: UITableViewController {

    @IBAction func addButtonTapped(sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Add Item", message: "Enter Something to spell", preferredStyle: .alert)
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel)
        
        alertController.addAction(cancelButton)
        
        let saveButton = UIAlertAction(title: "Save", style: .default)
        
        alertController.addAction(saveButton)
        
        
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    


}

