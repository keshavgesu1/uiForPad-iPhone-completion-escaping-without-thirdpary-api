//
//  UserViewModel.swift
//  UiForPhoneAndPad
//
//  Created by Keshav Raj Kashyap on 16/12/21.
//

import Foundation

class UserViewModel{
//    var model = [UserModel]()
    var vc : ViewController?
    
    static var sharedInstance = UserViewModel()
    let url = URL(string: "https://s3.amazonaws.com/omron-test/flags.json")!

     func urlSessionApiCall(completionHandler:@escaping([UserModel])-> ()){
        
        URLSession.shared.dataTask(with: self.url) { data, response, error in
            if error == nil && data != nil{
                do {
                    let result = try JSONDecoder().decode([UserModel].self, from: data!)
                    completionHandler(result)
                    print(result)
                }catch let error {
                    print(error)
                }
            }
        }.resume()
        
        
        
    }
    
}



