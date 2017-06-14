//
//  EditProfilePageViewController.swift
//  Skilly
//
//  Created by Kendall Fuhrman on 6/14/17.
//  Copyright © 2017 Kendall Fuhrman. All rights reserved.
//

import UIKit

class EditProfilePageViewController: UIViewController {

    @IBOutlet weak var profilePicker: UIImageView!
    
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var jobField: UITextField!
    
    @IBOutlet weak var educationField: UITextField!
    
    @IBOutlet weak var cityField: UITextField!
    
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(_ sender: Any) {
        UserDefaults.standard.set(nameField.text, forKey: "name")
        UserDefaults.standard.set(jobField.text, forKey: "job")
        UserDefaults.standard.set(educationField.text, forKey: "education")
        UserDefaults.standard.set(cityField.text, forKey: "city")
        
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
