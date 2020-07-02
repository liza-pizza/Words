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
    @IBOutlet weak var wordDefinition: UILabel!
    
    private var imageDataTask: URLSessionDataTask?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    
    func configureCell(imageURL: URL, title: String , definition: String){
        
        self.downloadPhoto(imageURL)
        self.wordTitle.text = title
        self.wordDefinition.text = definition
        self.wordImageView.contentMode = UIView.ContentMode.scaleAspectFill
        self.wordImageView.layer.cornerRadius = 10
        
    }
    
    
    func downloadPhoto(_ url: URL) {
        
        
        imageDataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, _, error) in
            guard let strongSelf = self else { return }
            
            strongSelf.imageDataTask = nil
            
            guard let data = data, let image = UIImage(data: data), error == nil else { return }
            
            DispatchQueue.main.async {
                UIView.transition(with: strongSelf.wordImageView, duration: 0.25, options: [.transitionCrossDissolve], animations: {
                    strongSelf.wordImageView.image = image
                }, completion: nil)
            }
        }
        
        imageDataTask?.resume()
    }
    
}
