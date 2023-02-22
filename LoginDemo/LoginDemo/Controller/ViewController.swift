//
//  ViewController.swift
//  LoginDemo
//
//  Created by Rahul Sharama on 20/02/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var countryPickerView : UIPickerView!
    @IBOutlet weak var userNameTextfied: UITextField!
    @IBOutlet weak var userNameUIView : UIView!
    @IBOutlet weak var userNameErrorDescription : UILabel!
    @IBOutlet weak var passwordTextfied: UITextField!
    @IBOutlet weak var passwordUIView : UIView!
    @IBOutlet weak var passwordErrorDescription : UILabel!
    @IBOutlet weak var loginButton : UIButton!
    @IBOutlet weak var signupButton : UIButton!
    var userNameCrendentials : [String] = []
    var userPasswordCrendentials : [String] = []
    var isPasswordMatch : Bool!
    var countries: [String] = []
    let UIColorCode : UIColor = UIColor(red: 214.0/255.0, green: 227.0/255.0, blue: 236.0/255.0, alpha: 1.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.GetCountryList()
//        print(countries)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let userData =   DatabaseManager.getInstance().getUserData()
        print(userData)
        userNameCrendentials = userData.name
        userPasswordCrendentials = userData.pwd
        self.initializeHideKeyboard() // This will hide the Keyboard
        self.isPasswordMatch = false
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
        self.loginButton.layer.cornerRadius = 5
        self.signupButton.layer.cornerRadius = 18
        
    }
   
    // This method will give the country Name list
    func GetCountryList(){
        for code in NSLocale.isoCountryCodes  {
            let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: code])
            let name = NSLocale(localeIdentifier: "en_UK").displayName(forKey: NSLocale.Key.identifier, value: id) ?? "Country not found for code: \(code)"
            countries.append(name)
        }
    }
    
    // This method will call when user click on the Login Button
   @IBAction func loginButtonAction() {
       
       if (userNameTextfied.text!.isEmpty){
           self.userNameErrorDescription.isHidden = false
           self.userNameErrorDescription.text = "Please enter your user name."
       } else if ((passwordTextfied.text!.isEmpty)) {
           self.passwordErrorDescription.isHidden = false
           self.passwordErrorDescription.text = "Please enter your password."
       } else {
           self.userNameErrorDescription.isHidden = true
           self.passwordErrorDescription.isHidden = true
           print("your email and password will validate by SQlite database .")
           
           for userName in userNameCrendentials {
               
               if (userNameTextfied.text == userName){
                   for password in userPasswordCrendentials {
                       if (passwordTextfied.text == password) {
                           isPasswordMatch = true
                           let storyBoard = storyboard?.instantiateViewController(withIdentifier: "UserListViewController") as! UserListViewController
                           
                           self.navigationController?.pushViewController(storyBoard, animated: true)
                           return
                       }
                   }
               }
               
           }
           // This will check password match with the database or not.
           if(!isPasswordMatch){
              print("PAssword not match with the database")
               let alert = UIAlertController(title: "Authentication Failed", message: "Your Username and Password not match with our Database. Please contact admin. ", preferredStyle: .alert)
               let ok = UIAlertAction(title: "Ok", style: .default)
               alert.addAction(ok)
               self.present(alert, animated: true)
           }
           
           
       }
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
        
        let storyBoard = storyboard?.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController
        
        self.navigationController?.pushViewController(storyBoard, animated: true)
    }


}

// Pickerview DataSource
extension ViewController : UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
      
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countries.count
    }
      
}
  
// Pickerview Delegate
extension ViewController : UIPickerViewDelegate{
      
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countries[row]
    }
}

// MARK: Keyboard Dismissal Handling on Tap
extension ViewController {
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

extension ViewController : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Check if there is any other text-field in the view whose tag is +1 greater than the current text-field on which the return key was pressed. If yes → then move the cursor to that next text-field. If No → Dismiss the keyboard
        textField.resignFirstResponder()
        return false
    }
    
}

