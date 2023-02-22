//
//  SignupViewController.swift
//  LoginDemo
//
//  Created by Rahul Sharama on 22/02/23.
//

import UIKit

class SignupViewController: UIViewController {
    
    @IBOutlet weak var userNameTextfied: UITextField!
    @IBOutlet weak var userNameUIView : UIView!
    @IBOutlet weak var userNameErrorDescription : UILabel!
    @IBOutlet weak var passwordTextfied: UITextField!
    @IBOutlet weak var passwordUIView : UIView!
    @IBOutlet weak var passwordErrorDescription : UILabel!
    @IBOutlet weak var signupButton : UIButton!
    
    let UIColorCode : UIColor = UIColor(red: 214.0/255.0, green: 227.0/255.0, blue: 236.0/255.0, alpha: 1.0)

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        userNameErrorDescription.isHidden = true
        passwordErrorDescription.isHidden = true
        self.userNameTextfied.delegate = self
        self.passwordTextfied.delegate = self
        self.userNameUIView.layer.cornerRadius = 5
        self.userNameUIView.layer.borderWidth = 1
        self.userNameUIView.layer.borderColor = UIColorCode.cgColor
        self.passwordUIView.layer.cornerRadius = 5
        self.passwordUIView.layer.borderWidth = 1
        self.passwordUIView.layer.borderColor = UIColorCode.cgColor
        self.signupButton.layer.cornerRadius = 5
    }
    
    // This method will call when user want to go back to the previous screen.
    @IBAction func backButtonAction() {
        self.navigationController?.popViewController(animated: true)
    }
    // This metod will check the valid
    @IBAction func userNameIDTextField(_ sender : Any) {
        if let userName = userNameTextfied.text {
            
            if ( userName != "") {
                userNameErrorDescription.isHidden = true
                self.userNameErrorDescription.text = ""
                
            } else {
                userNameErrorDescription.isHidden = false
                self.userNameErrorDescription.text = "Please enter your user name"
            }
            
            
            
        }
    }
    
    @IBAction func passwordTextField(_ sender : Any) {
        print("You type on the password Textfield")
        if passwordTextfied.text != nil {
            passwordErrorDescription.text = ""
        } else {
            passwordErrorDescription.text = "Please enter your password."
        }
    }
    
    @IBAction func signUpButtonAction(_ sender : UIButton) {
        
        if (userNameTextfied.text!.isEmpty){
            self.userNameErrorDescription.isHidden = false
            self.userNameErrorDescription.text = "Please enter your user name."
        } else if ((passwordTextfied.text!.isEmpty)) {
            self.passwordErrorDescription.isHidden = false
            self.passwordErrorDescription.text = "Please enter your password."
        } else {
            self.userNameErrorDescription.isHidden = true
            self.passwordErrorDescription.isHidden = true
            print("your email and password will be saved in the SQlite database .")
            let modelInfo = SignupModel(username: self.userNameTextfied.text!, password: self.passwordTextfied.text!)
            let isSave = DatabaseManager.getInstance().saveUserData(modelInfo)
            print(isSave)
            self.navigationController?.popViewController(animated: true)
        }
        
       
    }

}

// MARK: Keyboard Dismissal Handling on Tap
extension SignupViewController {
    func initializeHideKeyboard(){
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissMyKeyboard))
        view.addGestureRecognizer(tap)
    }
    @objc func dismissMyKeyboard(){
        view.endEditing(true)
    }
}

extension SignupViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Check if there is any other text-field in the view whose tag is +1 greater than the current text-field on which the return key was pressed. If yes → then move the cursor to that next text-field. If No → Dismiss the keyboard
        textField.resignFirstResponder()
        return false
    }
    
}
