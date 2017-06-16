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
import Alamofire
import FirebaseAuth

class ProfileViewController: UIViewController, LoginButtonDelegate {


    @IBOutlet weak var profilePhoto: UIImageView!
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var job: UILabel!
    @IBOutlet weak var education: UILabel!
    @IBOutlet weak var city: UILabel!
    

    override func viewDidAppear(_ animated: Bool) {
        
        let user = Auth.auth().currentUser
        if let user = user {
            let uid = user.uid
            let email = user.email
            let photoURL = user.photoURL
            
        Alamofire.request("https://skilly-3b5b9.firebaseio.com/profile/\(uid).json").responseJSON { response in
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                    
                    if let response = JSON as? [String : AnyObject] {
                    
                        var profile = Profile()
                        
                            profile?.name = response["name"] as? String
                            profile?.job = response ["job"] as? String
                            profile?.education = response["education"] as? String
                            profile?.location = response["location"] as? String
                        
                            self.userName.text = profile?.name
                            self.job.text = profile?.job
                            self.education.text = profile?.education
                            self.city.text = profile?.location
                        
                        
                    }
                }
            }
            // ...
        } else {
            // user not authenticated
        }
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
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
        
        let credential = FacebookAuthProvider.credential(withAccessToken: (AccessToken.current?.authenticationToken)!)
        
        Auth.auth().signIn(with: credential) { (user, error) in
            if let error = error {
                // ...
                print(error)
                return
            }
            // User is signed in
            // ...
            print("Firebase logged in")
            let user = Auth.auth().currentUser
            if let user = user {
                let uid = user.uid
                let email = user.email
                let photoURL = user.photoURL
                // ...
            } else {
                // user not authenticated
            }
        }
        
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
