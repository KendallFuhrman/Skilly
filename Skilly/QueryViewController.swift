//
//  QueryViewController.swift
//  Skilly
//
//  Created by Kendall Fuhrman on 6/14/17.
//  Copyright © 2017 Kendall Fuhrman. All rights reserved.
//

import UIKit
import Alamofire


class QueryViewController: UIViewController {
    
    var delegate: AddPostDelegate?
    var newPost: Post?

    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var priceField: UITextField!
    
    @IBOutlet weak var descriptionField: UITextView!
    
    var type = "q"

// Save a post to Firebase
    
    @IBAction func postQ(_ sender: Any) {
       
        newPost = Post()
            
        newPost?.title = textField.text!
        newPost?.price = priceField.text!
        newPost?.description = descriptionField.text!
        newPost?.type = type
        
        postPost()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func postPost() {
        Alamofire.request("https://skilly-3b5b9.firebaseio.com/post.json", method: .post, parameters: newPost?.toJSON(), encoding: JSONEncoding.default).responseJSON { response in
            
            switch response.result {
            case .success(let _):
                self.delegate?.didSavePost(activity: self.newPost!)
            case .failure: break
                // Failure... handle error
            }
        }
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
