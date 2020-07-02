//
//  ViewController.swift
//  Words
//
//  Created by Liza Bipin on 18/06/20.
//  Copyright © 2020 Liza Bipin. All rights reserved.
//

import UIKit
import CoreData


class HomeViewController: UITableViewController {
    
    
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let imageArray = [#imageLiteral(resourceName: "image1"), #imageLiteral(resourceName: "image2"), #imageLiteral(resourceName: "image3")]
    var wordArray = [WordInfo]()
    override func viewDidLoad() {
        print("View did Load")
        super.viewDidLoad()
        tableView.separatorColor = UIColor.clear
        loadWords()
        print(dataFilePath)
    }
    
    override func viewDidAppear(_ animated: Bool) {
    
        loadWords()
        tableView.reloadData()
    }
    
    //MARK: - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wordArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.wordCell, for: indexPath) as! WordTableViewCell
        if let cellTitle = wordArray[indexPath.row].title,let cellDef = wordArray[indexPath.row].definition,let cellImageURL = wordArray[indexPath.row].bgImage{
            cell.configureCell(imageURL: cellImageURL, title: cellTitle, definition: cellDef )}
        return cell
    }
    
    //MARK: - Add New Word Segue
    @IBAction func addNewWord(_ sender: UIBarButtonItem) {
        
        self.performSegue(withIdentifier: K.goToAddWord, sender: self)
        }
    
    //MARK: - Model Manipulation Methods
    
    func loadWords(with request: NSFetchRequest<WordInfo> = WordInfo.fetchRequest() ){
        
        do{
            try wordArray = context.fetch(request)
        } catch {
            print("error loading stuff  \(error)")
        }
        
      
    }
    
 
    
}


