//
//  WordDetailsController.swift
//  Words
//
//  Created by Liza Bipin on 02/07/20.
//  Copyright © 2020 Liza Bipin. All rights reserved.
//

import UIKit

class WordDetailsController: UIViewController {
    
    @IBOutlet weak var wordTitle: UILabel!
    @IBOutlet weak var wordDefinition: UILabel!
    @IBOutlet weak var bgImage: UnsplashImageView!
    
    
    var selectedWord: WordInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = selectedWord?.bgImage!
        
        bgImage.downloadPhoto( url!)
        wordTitle.text = selectedWord?.title!
        wordDefinition.text = selectedWord?.definition!
        
    }
    
    
}
