//
//  AddEditVC.swift
//  customCellDemo
//
//  Created by J on 7/11/2018.
//  Copyright © 2018 Jman. All rights reserved.
//

import UIKit

class AddEditVC: UIViewController {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var ratingTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //cancel button
    @IBAction func cancelPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    // save button
    @IBAction func savePressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "UnwindToVC", sender: self)
    }
}
