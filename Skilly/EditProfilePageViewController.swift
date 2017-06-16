//
//  EditProfilePageViewController.swift
//  Skilly
//
//  Created by Kendall Fuhrman on 6/14/17.
//  Copyright © 2017 Kendall Fuhrman. All rights reserved.
//

import UIKit
import Alamofire
import FirebaseStorage

class EditProfilePageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    
    var delegate: EditProfileDelegate?
    var newProfileInfo: Profile?

    
    @IBOutlet weak var profilePicker: UIImageView!
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var jobField: UITextField!
    
    @IBOutlet weak var educationField: UITextField!
    
    @IBOutlet weak var cityField: UITextField!
    
    @IBOutlet weak var progress: UIProgressView!
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: Any) {
        
        newProfileInfo = Profile()
        newProfileInfo?.name = nameField.text!
        newProfileInfo?.job = jobField.text!
        newProfileInfo?.education = educationField.text!
        newProfileInfo?.location = cityField.text!
        newProfileInfo?.image = profilePicker.image!
        
        if let image = profilePicker.image {
            // Get a reference to the storage service using the default Firebase App
            let storage = Storage.storage()
            
            // Create a storage reference from our storage service
            let storageRef = storage.reference()
            
            if let imageName = newProfileInfo?.name {
                let imagesRef = storageRef.child("images/\(imageName).jpg")
                
                // Local file you want to upload
                //let localFile = image. //URL(string: "path/to/image")!
                
                // Create the file metadata
                let metadata = StorageMetadata()
                metadata.contentType = "image/jpeg"
                
                // Upload file and metadata to the object 'images/mountains.jpg'
                //let uploadTask = storageRef.putFile(from: localFile, metadata: metadata)
                let jpg = UIImageJPEGRepresentation(image, CGFloat(1))
                let uploadTask = imagesRef.putData(jpg!)
                
                uploadTask.observe(.progress) { snapshot in
                    // Upload reported progress
                    let percentComplete = 100.0 * Double(snapshot.progress!.completedUnitCount)
                        / Double(snapshot.progress!.totalUnitCount)
                    self.progress.progress = Float(percentComplete)
                }
                
                uploadTask.observe(.success) { snapshot in
                    // Upload completed successfully
                    self.newProfileInfo?.imageURL = snapshot.metadata?.downloadURL()?.absoluteString
                    self.updateProfile()
                }
                
                uploadTask.observe(.failure) { snapshot in
                    if let error = snapshot.error as? NSError {
                        print(error.localizedDescription)
                        switch (StorageErrorCode(rawValue: error.code)!) {
                        case .objectNotFound:
                            // File doesn't exist
                            break
                        case .unauthorized:
                            // User doesn't have permission to access file
                            break
                        case .cancelled:
                            // User canceled the upload
                            break
                            
                            /* ... */
                            
                        case .unknown:
                            // Unknown error occurred, inspect the server response
                            break
                        default:
                            // A separate error occurred. This is a good place to retry the upload.
                            break
                        }
                    }
                }
            }
        } else {
            updateProfile()
        }
    }
    
    func updateProfile() {
        Alamofire.request("https://skilly-3b5b9.firebaseio.com/profile.json", method: .post, parameters: newProfileInfo?.toJSON(), encoding: JSONEncoding.default).responseJSON { response in
            
            switch response.result {
            case .success(let _):
                self.delegate?.didSaveProfile(activity: self.newProfileInfo!)
                self.dismiss(animated: true, completion: nil)
            case .failure: break
                // Failure... handle error
            }
        }
    }



    @IBAction func selectImageFromGallery(_ sender: Any) {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
        
    }

func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    dismiss(animated: true, completion: nil)
}
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // The info dictionary may contain multiple representations of the image. You want to use the original.
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        // Set image to display the selected image.
        profilePicker.image = selectedImage
        
        
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
