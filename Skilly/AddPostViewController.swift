//
//  AddPostViewController.swift
//  Skilly
//
//  Created by Kendall Fuhrman on 6/14/17.
//  Copyright © 2017 Kendall Fuhrman. All rights reserved.
//

import UIKit

class AddPostViewController: UIViewController {
    
    

    @IBAction func navToAdd (_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            print ("q")
    
            
        }
        if sender.selectedSegmentIndex == 1{
           print ("s")
            
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
