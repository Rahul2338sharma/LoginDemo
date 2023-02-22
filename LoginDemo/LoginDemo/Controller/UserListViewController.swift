//
//  UserListViewController.swift
//  LoginDemo
//
//  Created by Rahul Sharama on 21/02/23.
//

import UIKit

class UserListViewController: UIViewController {
    
    @IBOutlet weak var userListTableView : UITableView!
    var userIdArray : [Int] = []
    var userNameArray : [String] = []
    var userUserNameArray : [String] = []
    var userEmailArray : [String] = []
    var userAddressStreetArray : [String] = []
    var userAddressSuiteArray : [String] = []
    var userAddressCityArray : [String] = []
    var userAddressZipCodeArray : [String] = []
    var userAddressLatArray : [String] = []
    var userAddressLngArray : [String] = []
    var userPhoneArray : [String] = []
    var userWebsiteArray : [String] = []
    var companyNameArray : [String] = []
    var companyCatchParaseArray : [String] = []
    var companyBsArray : [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.apiRequestResponse()
        getAPIRequestResponse()
        // Do any additional setup after loading the view.
    }
    
    // This method will call when user want to go back to the previous screen.
    @IBAction func backButtonAction() {
        self.navigationController?.popViewController(animated: true)
    }
    
    // This method will return the request and response from the Server.
    func getAPIRequestResponse() {

        var request = URLRequest(url: WebUrl.webAPIUrl!,timeoutInterval: Double.infinity)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            do {
                guard error == nil else {
                    print("Response have some error")
                    return
                }
                // This will check that what value is comeing in the response.
                print(String(data: data!, encoding: .utf8)!)
                let responseObject = try JSONDecoder().decode([UserDataModel].self, from: data!)
                print(responseObject)
                if (responseObject != nil) {
                    for userNames in responseObject {
                        self.userIdArray.append(userNames.id!)
                        self.userNameArray.append(userNames.name!)
                        self.userUserNameArray.append(userNames.username!)
                        self.userEmailArray.append(userNames.email!)
                        self.userAddressStreetArray.append((userNames.address?.street)!)
                        self.userAddressSuiteArray.append((userNames.address?.suite)!)
                        self.userAddressCityArray.append((userNames.address?.city)!)
                        self.userAddressZipCodeArray.append((userNames.address?.zipcode)!)
                        self.userAddressLatArray.append((userNames.address?.geo?.lat)!)
                        self.userAddressLngArray.append((userNames.address?.geo?.lng)!)
                        self.userPhoneArray.append(userNames.phone!)
                        self.userWebsiteArray.append(userNames.website!)
                        self.companyNameArray.append((userNames.company?.name!)!)
                        self.companyCatchParaseArray.append((userNames.company?.catchPhrase!)!)
                        self.companyBsArray.append((userNames.company?.bs)!)
                    }
                    print(responseObject)
                    DispatchQueue.main.async {
                        self.userListTableView.reloadData()
                    }
                    
                }
            } catch {
                print(error)
            }
        }

        task.resume()
    }

}

// Table view Data Source and Delegate Method.
extension UserListViewController : UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.userNameArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserListTableViewCell") as! UserListTableViewCell?
        cell?.userName.text = self.userNameArray[indexPath.row]
        cell?.companyName.text = self.companyNameArray[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard = storyboard?.instantiateViewController(withIdentifier: "UserDetailsViewController") as! UserDetailsViewController
        storyBoard.userUserName = self.userUserNameArray[indexPath.row]
        storyBoard.userId = self.userIdArray[indexPath.row]
        storyBoard.userName = self.userNameArray[indexPath.row]
        storyBoard.userEmail = self.userEmailArray[indexPath.row]
        storyBoard.userAddressStreet = self.userAddressStreetArray[indexPath.row]
        storyBoard.userAddressSuite = self.userAddressSuiteArray[indexPath.row]
        storyBoard.userAddressCity = self.userAddressCityArray[indexPath.row]
        storyBoard.userAddressZipCode = self.userAddressZipCodeArray[indexPath.row]
        storyBoard.userAddressLat = self.userAddressLatArray[indexPath.row]
        storyBoard.userAddressLng = self.userAddressLngArray[indexPath.row]
        storyBoard.userPhone = self.userPhoneArray[indexPath.row]
        storyBoard.userWebsite = self.userWebsiteArray[indexPath.row]
        storyBoard.companyName = self.companyNameArray[indexPath.row]
        storyBoard.companyCatchParase = self.companyCatchParaseArray[indexPath.row]
        storyBoard.companyBs = self.companyBsArray[indexPath.row]
        
        
        
        self.navigationController?.pushViewController(storyBoard, animated: true)
    }
}
