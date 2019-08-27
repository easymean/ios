//
//  ViewController.swift
//  MyBooks
//
//  Created by cscoi008 on 2019. 8. 22..
//  Copyright © 2019년 cscoi008. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var database: DatabaseReference!
    var books: [String:[String:String]]! = [:]
    var databaseHandler: DatabaseHandle!
    let databaseName: String = "books"
    
    @IBOutlet var tableView: UITableView!
    let cellIdentifier = "bookCell"
    
    func configureDatabase() {
        database = Database.database().reference()
        databaseHandler = database.child(databaseName)
            .observe(.value, with: { (snapshot) -> Void in
            guard let books = snapshot.value as? [String:[String:String]] else {
                return
            }
            self.books = books
            self.tableView.reloadData()
            print("new book is published")
            print("total count: \(self.books.count)")
            })
    }

    func addNewBook(_ title: String, author: String, publisher: String){
        let newBook: [String:String]
        newBook = ["title": title,
                   "author": author,
                   "puplisher": publisher]
        
        database.child(databaseName).childByAutoId().setValue(newBook)
        
    }
    
    @IBAction func touchUpAddButton(_ sender: UIButton){
        let alert = UIAlertController(title: "책 정보 입력",
                                      message: "정보를 입력하세요",
                                      preferredStyle: .alert)
        
        alert.addTextField{ (textField) in
            textField.placeholder = "책 제목"
        }
        alert.addTextField{ (textField) in
            textField.placeholder = "저자"
        }
        alert.addTextField{ (textField) in
            textField.placeholder = "출판사"
        }
        
        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "확인", style: .default) {(action) in
            let title = alert.textFields![0].text!
            let author = alert.textFields![1].text!
            let puplisher = alert.textFields![2].text!
            self.addNewBook(title, author: author, publisher: puplisher)
        }
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDatabase()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath)
        
        let booksArray = Array(self.books)
        let book = booksArray[indexPath.row]
        
        cell.textLabel?.text = book.value["title"]
        cell.detailTextLabel?.text = book.value["author"]
        cell.tag = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let booksArray = Array(self.books)
            let book = booksArray[indexPath.row]
            self.books.removeValue(forKey: book.key)
            database.child(databaseName).child(book.key).removeValue()
            
            tableView.reloadSections(IndexSet(0...0), with: .automatic)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let cell = sender as? UITableViewCell else {
            print("sender가 cell이 아닙니다")
            return
        }
        
        guard let nextViewController = segue.destination as? NewViewController else {
            print("cell의 목적지가 new뷰컨트롤러가 아닙니다.")
            return
        }
        
        //(key: String, value: [String : String])
        let tag = cell.tag
        let booksArray = Array(self.books)
        let bookddd = booksArray[tag]
        
        nextViewController.bookName = bookddd.value["title"]
        nextViewController.bookAuthor = bookddd.value["author"]
        nextViewController.bookPublisher = bookddd.value["publisher"]
    }


}

