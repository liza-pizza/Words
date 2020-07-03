//
//  UnsplashImageView.swift
//  Words
//
//  Created by Liza Bipin on 03/07/20.
//  Copyright © 2020 Liza Bipin. All rights reserved.
//

import Foundation
import UnsplashPhotoPicker

class UnsplashImageView: UIImageView {
    
    var imageDataTask: URLSessionDataTask?

    
       func downloadPhoto(_ photo: UnsplashPhoto) {


        guard let url = photo.urls[.regular] else { return }


        imageDataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, _, error) in
            guard let strongSelf = self else { return }

            strongSelf.self.imageDataTask = nil

            guard let data = data, let image = UIImage(data: data), error == nil else { return }

            DispatchQueue.main.async {
                UIView.transition(with: strongSelf.self, duration: 0.25, options: [.transitionCrossDissolve], animations: {
                    strongSelf.self.image = image
                }, completion: nil)
            }
        }

        imageDataTask?.resume()
    }

    
    
    
    func downloadPhoto(_ url: URL) {
        
        var imageDataTask: URLSessionDataTask?

        imageDataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, _, error) in
            guard let strongSelf = self else { return }
            
            strongSelf.imageDataTask = nil
            
            guard let data = data, let image = UIImage(data: data), error == nil else { return }
            
            DispatchQueue.main.async {
                UIView.transition(with: strongSelf.self, duration: 0.25, options: [.transitionCrossDissolve], animations: {
                    strongSelf.self.image = image
                }, completion: nil)
            }
        }
        
        imageDataTask?.resume()
    }

    
}
