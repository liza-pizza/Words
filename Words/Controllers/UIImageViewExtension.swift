//
//  UnspashManger.swift
//  Words
//
//  Created by Liza Bipin on 03/07/20.
//  Copyright © 2020 Liza Bipin. All rights reserved.
//

import Foundation
import UnsplashPhotoPicker

extension UIImageView {
    
    
    
    class DataTask {
    var imageDataTask: URLSessionDataTask?
    }

    
    
       func downloadPhoto(_ photo: UnsplashPhoto) {

        let dataTask = DataTask()
        guard let url = photo.urls[.regular] else { return }
        
        
        dataTask.imageDataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, _, error) in
            guard let strongSelf = self else { return }
            
            dataTask.imageDataTask = nil
            
            guard let data = data, let image = UIImage(data: data), error == nil else { return }
            
            DispatchQueue.main.async {
                UIView.transition(with: strongSelf.self, duration: 0.25, options: [.transitionCrossDissolve], animations: {
                    strongSelf.self.image = image
                }, completion: nil)
            }
        }
        
        dataTask.imageDataTask?.resume()
    }

    
    
    
    func downloadPhoto(_ url: URL) {

        let dataTask = DataTask()

        dataTask.imageDataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, _, error) in
            guard let strongSelf = self else { return }

            dataTask.imageDataTask = nil

            guard let data = data, let image = UIImage(data: data), error == nil else { return }

            DispatchQueue.main.async {
                UIView.transition(with: strongSelf.self, duration: 0.25, options: [.transitionCrossDissolve], animations: {
                    strongSelf.self.image = image
                }, completion: nil)
            }
        }

        dataTask.imageDataTask?.resume()
    }

    
}
