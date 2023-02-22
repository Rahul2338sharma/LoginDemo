//
//  UserDetailsViewController.swift
//  LoginDemo
//
//  Created by Rahul Sharama on 20/02/23.
//

import UIKit

class UserDetailsViewController: UIViewController {
    
    @IBOutlet weak var userIdLabel : UILabel!
    @IBOutlet weak var userNameLabel : UILabel!
    @IBOutlet weak var userUserNameLabel : UILabel!
    @IBOutlet weak var userEmailLabel : UILabel!
    @IBOutlet weak var userAddressBGView : UIView!
    @IBOutlet weak var userAddressStreetLabel : UILabel!
    @IBOutlet weak var userAddressSuiteLabel : UILabel!
    @IBOutlet weak var userAddressCityLabel : UILabel!
    @IBOutlet weak var userAddressZipCodeLabel  : UILabel!
    @IBOutlet weak var userAddressLatLabel  : UILabel!
    @IBOutlet weak var userAddressLngLabel : UILabel!
    @IBOutlet weak var userPhoneLabel : UILabel!
    @IBOutlet weak var userWebsiteLabel : UILabel!
    @IBOutlet weak var companyBGView : UIView!
    @IBOutlet weak var companyNameLabel : UILabel!
    @IBOutlet weak var companyCatchParaseLabel : UILabel!
    @IBOutlet weak var companyBsLabel : UILabel!
    
    
    var userId : Int!
    var userName : String!
    var userUserName : String!
    var userEmail : String!
    var userAddressStreet : String!
    var userAddressSuite : String!
    var userAddressCity : String!
    var userAddressZipCode  : String!
    var userAddressLat  : String!
    var userAddressLng : String!
    var userPhone : String!
    var userWebsite : String!
    var companyName : String!
    var companyCatchParase : String!
    var companyBs : String!
    
    let UIColorCode : UIColor = UIColor(red: 214.0/255.0, green: 227.0/255.0, blue: 236.0/255.0, alpha: 1.0)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.userIdLabel.text = String(userId)
        self.userNameLabel.text = userName
        self.userUserNameLabel.text = userUserName
        self.userEmailLabel.text = userEmail
        self.userAddressStreetLabel.text = userAddressStreet
        self.userAddressSuiteLabel.text = userAddressSuite
        self.userAddressCityLabel.text = userAddressCity
        self.userAddressZipCodeLabel.text = userAddressZipCode
        self.userPhoneLabel.text = userPhone
        self.userWebsiteLabel.text = userWebsite
        self.companyNameLabel.text = companyName
        self.companyCatchParaseLabel.text = companyCatchParase
        self.companyBsLabel.text = companyBs
        self.userAddressBGView.layer.cornerRadius = 5
        self.userAddressBGView.layer.borderWidth = 1
        self.userAddressBGView.layer.borderColor = UIColorCode.cgColor
        self.companyBGView.layer.cornerRadius = 5
        self.companyBGView.layer.borderWidth = 1
        self.companyBGView.layer.borderColor = UIColorCode.cgColor
    }
    
    // This method will call when user want to go back to the previous screen.
    @IBAction func backButtonAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    // This method will call when user will click on the get Location on the map Button.
    @IBAction func mapLatAndLongLocation (sender : UIButton) {
        let storyBoard = storyboard?.instantiateViewController(withIdentifier: "MapLatAndLongViewController") as! MapLatAndLongViewController
        storyBoard.userName = userName
        storyBoard.lattitude = Double(userAddressLat)
        storyBoard.longitude = Double(userAddressLng)
        self.navigationController?.pushViewController(storyBoard, animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
