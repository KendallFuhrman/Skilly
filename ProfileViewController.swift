//
//  ProfileViewController.swift
//  Skilly
//
//  Created by Kendall Fuhrman on 6/12/17.
//  Copyright © 2017 Kendall Fuhrman. All rights reserved.
//

import UIKit
import FacebookCore
import FacebookLogin

class ProfileViewController: UIViewController, LoginButtonDelegate {

    @IBOutlet weak var profilePhoto: UIImageView!
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var job: UILabel!
    @IBOutlet weak var education: UILabel!
    @IBOutlet weak var city: UILabel!
    

    override func viewDidAppear(_ animated: Bool) {
        userName.text = UserDefaults.standard.string(forKey: "name")
        job.text = UserDefaults.standard.string(forKey: "job")
        education.text = UserDefaults.standard.string(forKey: "education")
        city.text = UserDefaults.standard.string(forKey: "city")
        if UserDefaults.standard.string(forKey: "name") == nil {
            UserDefaults.standard.set("Create User Name" , forKey: "userName")
        }
        
        if UserDefaults.standard.string(forKey: "job") == nil {
            UserDefaults.standard.set("Enter Current Position" , forKey: "job")
        }
        
        if UserDefaults.standard.string(forKey: "education") == nil {
            UserDefaults.standard.set("Enter Education" , forKey: "education")
        }
        if UserDefaults.standard.string(forKey: "city") == nil {
            UserDefaults.standard.set("Enter Current City" , forKey: "city")
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userName.text = UserDefaults.standard.string(forKey: "name")
        job.text = UserDefaults.standard.string(forKey: "job")
        education.text = UserDefaults.standard.string(forKey: "education")
        city.text = UserDefaults.standard.string(forKey: "city")
        
        
        if UserDefaults.standard.string(forKey: "name") == nil {
            UserDefaults.standard.set("Create User Name" , forKey: "userName")
        }
        
        if UserDefaults.standard.string(forKey: "job") == nil {
            UserDefaults.standard.set("Enter Current Position" , forKey: "job")
        }
        
        if UserDefaults.standard.string(forKey: "education") == nil {
            UserDefaults.standard.set("Enter Education" , forKey: "education")
        }
        if UserDefaults.standard.string(forKey: "city") == nil {
            UserDefaults.standard.set("Enter Current City" , forKey: "city")
            
        }

        if let accessToken = AccessToken.current {
            //AlreadyLogged in
        }
        
        let loginButton = LoginButton(readPermissions: [ .publicProfile])
        loginButton.delegate = self
        loginButton.center = view.center
        
        view.addSubview(loginButton)
    }
    
    func loginButtonDidCompleteLogin(_ loginBUtton: LoginButton,
                                     result: LoginResult) {
        
        //User has logged in
        print(result)
    }
    
    func loginButtonDidLogOut(_ loginButton: LoginButton) {
        // Logged out
    }
    
    // Do any additional setup after loading the view.

    

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
