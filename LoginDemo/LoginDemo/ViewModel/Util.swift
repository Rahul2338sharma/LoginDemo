//
//  Util.swift
//  LoginDemo
//
//  Created by Rahul Sharama on 22/02/23.
//

import Foundation

class Util : NSObject {
    
    //This method will give the File Path
    class func getPath(_ fileName: String) -> String {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURl = documentDirectory.appendingPathComponent(fileName)
        print("Database Path - \(fileURl.path)")
        return fileURl.path
    }
    
    // This method will check path available or not
    class func copyDatabase(_ filename: String){
        let dbPath = getPath("Signup.db")
        let fileManager = FileManager.default
        
        if !fileManager.fileExists(atPath: dbPath){
            let bundle = Bundle.main.resourceURL
            let file = bundle?.appendingPathComponent(filename)
            var error:NSError?
            do{
                try fileManager.copyItem(atPath: (file?.path)!, toPath: dbPath)
            }catch let error1 as NSError{
                error = error1
            }
            
            if error == nil{
                print("error in db")
            }else{
                print("DB Done !!")
            }
    
        }
    }
}
