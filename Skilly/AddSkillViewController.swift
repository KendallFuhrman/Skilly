//
//  AddSkillViewController.swift
//  Skilly
//
//  Created by Kendall Fuhrman on 6/12/17.
//  Copyright © 2017 Kendall Fuhrman. All rights reserved.
//

import UIKit
import Alamofire

class AddSkillViewController: UIViewController {

    var delegate: AddPostDelegate?
    var newPost: Post?
    
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var priceText: UITextField!
    @IBOutlet weak var descriptionText: UITextView!
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func post(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        
        newPost?.title = titleText.text!
        newPost?.price =  priceText.text!
        newPost?.description = descriptionText.text
        
        Alamofire.request("https://skilly-3b5b9.firebaseio.com/post.json", method: .post, parameters: newPost?.toJSON(), encoding: JSONEncoding.default).responseJSON { response in
            
            switch response.result {
            case .success( _):
                self.delegate?.didSaveActivity(activity: self.newPost!)
                self.dismiss(animated: true, completion: nil)
            case .failure: break
                // Failure... handle error
            }
        }

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
