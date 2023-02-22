//
//  UserListTableViewCell.swift
//  LoginDemo
//
//  Created by Rahul Sharama on 21/02/23.
//

import UIKit

class UserListTableViewCell: UITableViewCell {
    @IBOutlet weak var userListBgView : UIView!
    @IBOutlet weak var userName : UILabel!
    @IBOutlet weak var companyName : UILabel!
    let UIColorCode : UIColor = UIColor(red: 214.0/255.0, green: 227.0/255.0, blue: 236.0/255.0, alpha: 1.0)

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.userListBgView.layer.cornerRadius = 5
        self.userListBgView.layer.borderWidth = 1
        self.userListBgView.layer.borderColor = UIColorCode.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
