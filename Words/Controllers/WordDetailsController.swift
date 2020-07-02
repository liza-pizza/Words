//
//  WordDetailsController.swift
//  Words
//
//  Created by Liza Bipin on 02/07/20.
//  Copyright © 2020 Liza Bipin. All rights reserved.
//

import UIKit

class WordDetailsController: UIViewController {
    
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var wordTitle: UILabel!
    @IBOutlet weak var wordDefinition: UILabel!
    
    
    private var imageDataTask: URLSessionDataTask?
    
    var selectedWord: WordInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = selectedWord?.bgImage!
        
        downloadPhoto( url!)
        wordTitle.text = selectedWord?.title!
        wordDefinition.text = selectedWord?.definition!
        
    }
    
    
    
    
    
    
    func downloadPhoto(_ url: URL) {
        
        
        imageDataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, _, error) in
            
            guard let strongSelf = self else { return }
            
            strongSelf.imageDataTask = nil
            
            guard let data = data, let image = UIImage(data: data), error == nil else { return }
            
            DispatchQueue.main.async {
                UIView.transition(with: strongSelf.bgImage, duration: 0.25, options: [.transitionCrossDissolve], animations: {
                    strongSelf.bgImage.image = image
                }, completion: nil)
            }
        }
        
        imageDataTask?.resume()
    }
    
    
}
