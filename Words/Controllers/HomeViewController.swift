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
    
    
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var wordArray = [WordInfo]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorColor = UIColor.clear
        loadWords()
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
    
    //MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: K.goToWordDetails, sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.goToWordDetails{
            let destinationVC = segue.destination as! WordDetailsController
            
            if let indexPath = tableView.indexPathForSelectedRow{
                destinationVC.selectedWord = wordArray[indexPath.row]
            }
        }

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


//func downloadImage(with url: URL)  {
//      URLSession.shared.dataTask(with: url) { (data, response, error) in
//          if error != nil {
//              print("error hereeeee")
//              return
//          }
//          
//          DispatchQueue.main.async {
//               self.cellImage = UIImage(data: data!)!
//          }
//         
//      }
//  .resume()
//  }
//  
