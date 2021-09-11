//
//  ViewController.swift
//  Authentication-Example
//
//  Created by Belal Samy on 11/09/2021.
//

import UIKit

class ViewController: UIViewController {
    
    // TextFields
    let email_tf = UITextField()
    let password_tf = UITextField()
    let confirmPasswrod_tf = UITextField()
    let userName_tf = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userName_tf.text = "Belal Samy"
        email_tf.text = "test@gmail.com"
        password_tf.text = "qwerty123456"
        confirmPasswrod_tf.text = "qwerty123456"
    }

    //MARK: - functions
    
    func validateFields() {
        do {
            let name = try userName_tf.validate(type: .required("User Name"))
            let email = try email_tf.validate(type: .email)
            let password = try password_tf.validate(type: .password)
            _ = try confirmPasswrod_tf.validate(type: .confirm(password_tf))
            
            self.simpleAlert(title: "Success", message: "you registerd Successfully !")
            save(name: name, email: email, password: password) // save in userDefaults
            
        } catch(let error) {
            //self.activityIndicator.stopAnimating()
            self.simpleAlert(title: "Error", message: (error as! ValidationError).message)
        }
    }
    
    func save(name: String, email: String, password: String) {
        Defaults.userName = name
        Defaults.userEmail = email
        Defaults.password = password
    }
    
    //MARK: - actions
    
    @IBAction func signUpTapped(_ sender: Any) {
        validateFields()
        print("userdefaults name = \(Defaults.userName)")
        print("userdefaults email = \(Defaults.userEmail)")
        print("userdefaults password = \(Defaults.password)")
    }
    

}

