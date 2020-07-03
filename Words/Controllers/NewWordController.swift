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
    
    @IBOutlet weak var newWordTextField: UITextField!
    @IBOutlet weak var definitionTextField: UITextField!
    @IBOutlet weak var unsplashphotoImageView: UnsplashImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    //MARK: - Add New Word
    
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
            print("one or both text fields are empty")
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

    
}



//MARK: - Unsplased View Protocol Methods

extension NewWordController: UnsplashPhotoPickerDelegate{
    
    func unsplashPhotoPicker(_ photoPicker: UnsplashPhotoPicker, didSelectPhotos photos: [UnsplashPhoto]){
        
        let photo = photos[0]
        imageurl = photo.urls[.regular]
        unsplashphotoImageView.downloadPhoto(photo)
    }
    
    
    func unsplashPhotoPickerDidCancel(_ photoPicker: UnsplashPhotoPicker)
    {
        print("Photo Picker has been cancelled")
    }
}
