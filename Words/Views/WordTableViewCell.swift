//
//  WordTableViewCell.swift
//  Words
//
//  Created by Liza Bipin on 23/06/20.
//  Copyright © 2020 Liza Bipin. All rights reserved.
//

import UIKit
import UnsplashPhotoPicker

class WordTableViewCell: UITableViewCell {
    
    @IBOutlet weak var wordTitle: UILabel!
    @IBOutlet weak var wordDefinition: UILabel!
    @IBOutlet weak var wordImageView: UnsplashImageView!
    
    private var imageDataTask: URLSessionDataTask?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    
    func configureCell(imageURL: URL, title: String , definition: String){
        
        wordImageView.downloadPhoto(imageURL)
        self.wordTitle.text = title
        self.wordDefinition.text = definition
        self.wordImageView.contentMode = UIView.ContentMode.scaleAspectFill
        self.wordImageView.layer.cornerRadius = 10
        
    }
    
    

    
}
