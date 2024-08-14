//
//  RegisterViewController.swift
//  Artable
//
//  Created by Shahzaman Khan on 11/08/24.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var usrnameTxtField: UITextField!
    @IBOutlet weak var emailTxtField: UITextField!
    
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var confirmPassTxtField: UITextField!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var passCheckImageView: UIImageView!
    @IBOutlet weak var confirmPassCheckImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        passwordTxtField.addTarget(self, action: #selector(textFieldDidChanged(_:)), for: .editingChanged)
        confirmPassTxtField.addTarget(self, action: #selector(textFieldDidChanged(_:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChanged(_ textField: UITextField) {
        guard let passwordText = passwordTxtField.text else {
            return
        }
        
        if textField == confirmPassTxtField {
            
            passCheckImageView.isHidden = false
            confirmPassCheckImageView.isHidden = false
        } else {
            
            if passwordText.isEmpty {
                passCheckImageView.isHidden = true
                confirmPassCheckImageView.isHidden = true
                confirmPassTxtField.text = ""
            }
        }
       
        if passwordTxtField.text == confirmPassTxtField.text {
            passCheckImageView.image = AppImages.greenCheck
             confirmPassCheckImageView.image = AppImages.greenCheck
            } else {
                passCheckImageView.image = AppImages.redCheck
                confirmPassCheckImageView.image = AppImages.redCheck
        }
    }
    
    @IBAction func registerBtnTapped(_ sender: RoundedButton) {
        
        guard let email = emailTxtField.text, email.isNotEmpty,
              let password = passwordTxtField.text, password.isNotEmpty
         else {
            return
        }
        
        activityIndicator.startAnimating()
        
        Auth.auth().createUser(withEmail: email, password: password) { serverData, error in
            if let errorOccured = error {
                print("Error: -> ",errorOccured.localizedDescription)
            } else if let _ = serverData {
                print("User Created Successfully....!")
            }
            
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
            }
        }
    }
}
