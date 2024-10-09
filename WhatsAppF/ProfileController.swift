//
//  ProfileController.swift
//  WhatsAppF
//
//  Created by Ömer on 9.10.2024.
//

import UIKit
import FirebaseAuth

class ProfileController: UIViewController {

    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

  
    @IBAction func signOut(_ sender: Any) {
        
        do{
            
            try Auth.auth().signOut()
            self.performSegue(withIdentifier: "goTo2", sender: nil)
        }catch{
            print("error")
        }
        
        
    }
    
}
