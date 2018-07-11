//
//  ViewController.swift
//  customCellDemo
//
//  Created by J on 7/11/2018.
//  Copyright © 2018 Jman. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var tableData: [Review] = []
    
    @IBAction func addPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "AddEditSegue", sender: sender)
    }
    
    @IBAction func unwindToVC(segue: UIStoryboardSegue) {
        let src = segue.source as! AddEditVC // gain access to other
        let title = src.titleTextField.text
        let rating = src.ratingTextField.text!
        let notes = src.notesTextView.text
        
        //here create new entitin
        let newReview = Review(context: context)
        newReview.created_at = Date()
        newReview.title = title
        print(rating)
        if let rating = Int16(rating) {
            print("am i here")
            newReview.rating = Int16(rating)
        } else {
            newReview.rating = 0
        }
        newReview.notes = notes
        
        
        appDelegate.saveContext()
        
              //add to tabledata
        tableData.append(newReview)
        tableView.reloadData()
        
//        print(title, rating, notes)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 110
        fetchAllReviews()
    }
    
    
    // READ ALL
    func fetchAllReviews() {
        let req:NSFetchRequest<Review> = Review.fetchRequest()
        do {
            tableData = try context.fetch(req)
        } catch {
            print(error)
        }
    }
    
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewCell", for: indexPath) as! ReviewCell // <- add this
        
        let review = tableData[indexPath.row]
        cell.titleLabel?.text = review.title
        cell.ratingLabel?.text = "\(review.rating)"
        cell.notesTextView.text = review.notes

        return cell
    }
}
