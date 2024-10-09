//
//  MessageController.swift
//  WhatsAppF
//
//  Created by Ömer on 9.10.2024.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseAuth

class MessageController: UIViewController , UITableViewDelegate , UITableViewDataSource {

    @IBOutlet weak var messageLabel: UITextField!
    @IBOutlet weak var tableView: UITableView!
    var userEmailArray = [String]()
    var userMessagetArray = [String]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        getdata()

        // Do any additional setup after loading the view.
    }

    @IBAction func sendMessage(_ sender: Any) {
        
        let firestoreDatabase = Firestore.firestore()
        
        var firestoneReferance : DocumentReference? = nil
        
        let postData = ["message" : messageLabel.text,"username": Auth.auth().currentUser?.email,"date":FieldValue.serverTimestamp()] as [String:Any]
        
        firestoneReferance = firestoreDatabase.collection("Message").addDocument(data: postData, completion: { (error) in
            
            if error != nil {
                self.makeAlert(titleInput: "Error", messageInput: error!.localizedDescription)
            }else{
                self.messageLabel.text = ""
                
            }
            
        })
        
        
        }
    
    
    func getdata(){
        let firestoreDatabase = Firestore.firestore()
        
        firestoreDatabase.collection("Message").addSnapshotListener { (snapshot, error) in
            if error != nil {
                self.makeAlert(titleInput: "Error", messageInput: error!.localizedDescription)
            }else{
                if snapshot?.isEmpty != true && snapshot != nil{
                    self.userEmailArray.removeAll(keepingCapacity: false)
                    self.userMessagetArray.removeAll(keepingCapacity: false)
                    
                    for document in snapshot!.documents{
                        
                        if let userEmail = document.get("username") as? String{
                            self.userEmailArray.append(userEmail)
                        }
                        if let userMessage = document.get("message") as? String{
                            self.userMessagetArray.append(userMessage)
                        }
                        
                        
                    }
                        
                     self.tableView.reloadData()
                }
                
                
                
            }
        }
        
        
    }
        
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userMessagetArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! FeedCell
        cell.messageLabel.text = userMessagetArray[indexPath.row]
        cell.userName.text = userEmailArray[indexPath.row]
        cell.imageViews.image = UIImage(named: "omerapaydin")
        return cell
        
    }
    
    func makeAlert(titleInput:String , messageInput: String){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }

    
    
}
