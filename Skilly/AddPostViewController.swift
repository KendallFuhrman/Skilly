//
//  AddPostViewController.swift
//  Skilly
//
//  Created by Kendall Fuhrman on 6/14/17.
//  Copyright © 2017 Kendall Fuhrman. All rights reserved.
//

import UIKit

class AddPostViewController: UIViewController {
    
    
    @IBOutlet weak var containerView: UIView!
    var currentViewController: UIViewController?

   
    @IBAction func showAddComponent(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            let newViewController = self.storyboard?.instantiateViewController(withIdentifier: "queryVC")
            newViewController!.view.translatesAutoresizingMaskIntoConstraints = false
            self.cycleFromViewController(oldViewController: self.currentViewController!, toViewController: newViewController!)
            self.currentViewController = newViewController;
        } else {
            let newViewController = self.storyboard?.instantiateViewController(withIdentifier: "skillsVC")
            newViewController!.view.translatesAutoresizingMaskIntoConstraints = false
            self.cycleFromViewController(oldViewController: self.currentViewController!, toViewController: newViewController!)
            self.currentViewController = newViewController
        }

}
    
    func cycleFromViewController(oldViewController: UIViewController, toViewController newViewController: UIViewController) {
        oldViewController.willMove(toParentViewController: nil)
        self.addChildViewController(newViewController)
        self.addSubview(subView: newViewController.view, toView: self.containerView!)
        newViewController.view.alpha = 0
        newViewController.view.layoutIfNeeded()
//        UIView.animate(withDuration: 0.5, animations { newViewController.view.alpha = 1
//            oldViewController.view.alpha = 0
//        },
//            completion: { finsihed in
//                oldViewController.view.removeFromSuperview()
//                oldViewController.view.removeFromParentViewController()
//                newViewController.didMove(toParentViewController: self)
//        })
    }
    
    override func viewDidLoad() {
    
        self.currentViewController = self.storyboard?.instantiateViewController(withIdentifier: "queryVC")
        self.currentViewController!.view.translatesAutoresizingMaskIntoConstraints = false
        self.addChildViewController(self.currentViewController!)
        self.addSubview(subView: self.currentViewController!.view, toView: self.containerView)
        super.viewDidLoad()
        
    }
    func addSubview(subView: UIView, toView parentView: UIView){
        parentView.addSubview(subView)
        
        var viewBindingsDict = [String: AnyObject]()
        viewBindingsDict["subView"] = subView
//        parentView.addConstraint(NSLayoutConstraint.constraints(withVisualFormat: "H: [subview]", options: [], metrics: nil, views: viewBindingsDict)
//        parentView.addConstraint(NSLayoutConstraint.constraints(withVisualFormat: "V: [subview]", options: [], metrics: nil, views: viewBindingsDict)
        
        
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
