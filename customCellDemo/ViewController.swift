//
//  ViewController.swift
//  customCellDemo
//
//  Created by J on 7/11/2018.
//  Copyright © 2018 Jman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var tableData: [Review] = []
    
    @IBAction func addPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "AddEditSegue", sender: sender)
    }
    
    @IBAction func unwindToVC(segue: UIStoryboardSegue) {
        let src = segue.source as! AddEditVC // gain access to other
        let title = src.titleTextField.text
        let rating = src.titleTextField.text
        let notes = src.notesTextView.text
        print(title, rating, notes)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewCell", for: indexPath)
        
        let review = tableData[indexPath.row]
        cell.textLabel?.text = review.title
        cell.detailTextLabel?.text = "\(review.rating)"

        return cell
    }
}
