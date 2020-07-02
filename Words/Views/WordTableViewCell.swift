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
    
    @IBOutlet weak var wordImageView: UIImageView!
    @IBOutlet weak var wordTitle: UILabel!
    
    private var imageDataTask: URLSessionDataTask?

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    
    func configureCell(image: UIImage){
        self.wordImageView.image = image
        self.wordImageView.contentMode = UIView.ContentMode.scaleAspectFill
        self.wordImageView.layer.cornerRadius = 10

    }
    

    
}
