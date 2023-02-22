//
//  DatabaseManager.swift
//  LoginDemo
//
//  Created by Rahul Sharama on 22/02/23.
//

import Foundation
var shareInstance = DatabaseManager()
class DatabaseManager: NSObject {
    
    var database : FMDatabase? = nil
    
    class func getInstance() -> DatabaseManager {
        if shareInstance.database == nil {
            shareInstance.database = FMDatabase(path: Util.getPath("Signup.db"))
        }
        return shareInstance
    }
    
    
    func saveUserData(_ modelInfo : SignupModel) -> Bool {
        shareInstance.database?.open()
        let isSave = shareInstance.database?.executeUpdate("INSERT INTO Signup (username,password) VALUES(?,?)", withArgumentsIn: [modelInfo.username,modelInfo.password])
        shareInstance.database?.close()
        return isSave!
    }
    
    func getUserData() -> (name : [String], pwd : [String]) {
        shareInstance.database?.open()
        var names = [String]()
        var password = [String]()
        let resultSet: FMResultSet = (shareInstance.database?.executeQuery("SELECT * FROM Signup", withArgumentsIn: []))!
        if (resultSet != nil) {
                    while resultSet.next() {
                        names.append(resultSet.string(forColumn: "username")!)
                        password.append(resultSet.string(forColumn: "password")!)
                    }
                }
        return (names,password)
        
    }
    
    
    
}
