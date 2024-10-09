//
//  ViewController.swift
//  WhatsAppF
//
//  Created by Ömer on 8.10.2024.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func signIn(_ sender: Any) {
        if emailLabel.text != "" && passwordLabel.text != "" {
            Auth.auth().signIn(withEmail: emailLabel.text!, password: passwordLabel.text!) { (authdata,error) in
                if error != nil {
                    self.makeAlert(title: "Error", message: error!.localizedDescription)
                }else{
                    self.performSegue(withIdentifier: "goTo", sender: nil)
                }
            }
        }
        
    }
    
    
    @IBAction func signUp(_ sender: Any) {
        
        if emailLabel.text != "" && passwordLabel.text != "" {
            Auth.auth().createUser(withEmail: emailLabel.text!, password: passwordLabel.text!){ (authdata,error) in
                if error != nil {
                    self.makeAlert(title: "Error", message: error!.localizedDescription)
                }else {
                    self.performSegue(withIdentifier: "goTo", sender: nil)
                }
                
            }
        }
        
        
    }
    
    func makeAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}

