//
//  NewWordController.swift
//  Words
//
//  Created by Liza Bipin on 24/06/20.
//  Copyright © 2020 Liza Bipin. All rights reserved.
//

import UIKit
import UnsplashPhotoPicker
import CoreData

class NewWordController: UIViewController {
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var imageurl: URL? = nil
    //    var wordInfoArray = [WordInfo]()
    
    @IBOutlet weak var unsplashphotoImageView: UIImageView!
    @IBOutlet weak var newWordTextField: UITextField!
    @IBOutlet weak var definitionTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    
    @IBAction func submitPressed(_ sender: Any) {
        
        if let title = newWordTextField.text, let definition = definitionTextField.text{
            let wordInfo = WordInfo(context: self.context)
            wordInfo.title = title
            wordInfo.definition = definition
            wordInfo.bgImage = imageurl
            saveWordInfo()
        }
        else
        {
            print("error or smthng")
        }
        navigationController?.popViewController(animated: true)
    
    }
    
    
    
    //MARK: - Data Manipulation Methods
    
    func saveWordInfo(){
        
        do{
            try context.save()
        }catch{
            print("error saving category \(error)")
        }
        
    }
    
    
    
    
    //MARK: - Unsplashed Image View Methods
    
    private var selectedPhotos = [UnsplashPhoto]()
    
    @IBAction func addImagePressed(_ sender: UIButton) {
        
        let config = UnsplashPhotoPickerConfiguration(accessKey: K.unsplashAccessKey, secretKey: K.unsplashSecretKey)
        
        let unsplashPhotoPicker = UnsplashPhotoPicker(configuration: config)
        unsplashPhotoPicker.photoPickerDelegate = self
        
        present(unsplashPhotoPicker, animated: true, completion: nil)
        
    }
    
    private var imageDataTask: URLSessionDataTask?
    
    
    func downloadPhoto(_ photo: UnsplashPhoto) {
        guard let url = photo.urls[.regular] else { return }
        
        
        imageDataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, _, error) in
            guard let strongSelf = self else { return }
            
            strongSelf.imageDataTask = nil
            
            guard let data = data, let image = UIImage(data: data), error == nil else { return }
            
            DispatchQueue.main.async {
                UIView.transition(with: strongSelf.unsplashphotoImageView, duration: 0.25, options: [.transitionCrossDissolve], animations: {
                    strongSelf.unsplashphotoImageView.image = image
                }, completion: nil)
            }
        }
        
        imageDataTask?.resume()
    }
    
    
    
    
}






//MARK: - Unsplased View Protocol Methods

extension NewWordController: UnsplashPhotoPickerDelegate{
    
    func unsplashPhotoPicker(_ photoPicker: UnsplashPhotoPicker, didSelectPhotos photos: [UnsplashPhoto]){
        
        let photo = photos[0]
        imageurl = photo.urls[.regular]
        downloadPhoto(photo)
    }
    
    
    func unsplashPhotoPickerDidCancel(_ photoPicker: UnsplashPhotoPicker)
    {
        print("Photo Picker has been cancelled")
    }
}
