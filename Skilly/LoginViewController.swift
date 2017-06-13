//
//  LoginViewController.swift
//  Skilly
//
//  Created by Kendall Fuhrman on 6/13/17.
//  Copyright © 2017 Kendall Fuhrman. All rights reserved.
//

import UIKit
import FacebookLogin
import FacebookCore

class LoginViewController: UIViewController, LoginButtonDelegate {

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
