//
//  ViewController.swift
//  Words
//
//  Created by Liza Bipin on 18/06/20.
//  Copyright © 2020 Liza Bipin. All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {
    let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)

    let imageArray = [#imageLiteral(resourceName: "image1"), #imageLiteral(resourceName: "image2"), #imageLiteral(resourceName: "image3")]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.separatorColor = UIColor.clear
    }
    
    //MARK: - TableView Datasource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.wordCell, for: indexPath) as! WordTableViewCell
        
        cell.configureCell(image: imageArray[indexPath.row])
        return cell
    }
    
    //MARK: - Add New Word Segue
    @IBAction func addNewWord(_ sender: UIBarButtonItem) {
        
                self.performSegue(withIdentifier: K.goToAddWord, sender: self)
        
    }
}


