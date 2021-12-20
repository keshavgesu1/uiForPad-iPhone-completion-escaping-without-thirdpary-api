//
//  ViewController.swift
//  UiForPhoneAndPad
//
//  Created by Keshav Raj Kashyap on 16/12/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView:UIImageView!
    @IBOutlet weak var tableView:UITableView!
    
    var userModelData = [UserModel]()
    let userViewModelData: UserViewModel = UserViewModel()

   
    
    //MARK: -VIEWCONTROLLER LIFECYCLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "MyTableViewCell")
        getDataApi()
        
    }
    
    
    //MARK: - API CALL TO GET DATA
    
    func getDataApi(){
        userViewModelData.urlSessionApiCall { responce  in
            if responce != nil{
                print(responce)
                self.userModelData.append(contentsOf: responce)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            
        }
    }
    
    
    
    
}


//MARK: - TABLEVIEW DELEGATE AND PROTOCOLS

extension ViewController: UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userModelData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCell", for: indexPath)as! MyTableViewCell
        cell.label.text = userModelData[indexPath.row].title
        
      /*  DispatchQueue.main.async { [self] in
            guard let url = URL(string: userModelData[indexPath.row].url) else {return }
            UIImage.loadFrom(url: url) { image in
                cell.imgV.image = image
            }
        }*/
        let imageUrl = URL(string: (userModelData[indexPath.row].url))!
        cell.imgV.loadImage(fromURL: imageUrl, placeHolderImage: "yoga")

        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DispatchQueue.main.async { [self] in
            guard let url = URL(string: userModelData[indexPath.row].url) else {return }
            UIImage.loadFrom(url: url) { image in
                imageView.image = image
            }
        }
        
    }
    
    
}

extension UIImage {
    
    public static func loadFrom(url: URL, completion: @escaping (_ image: UIImage?) -> ()) {
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    completion(UIImage(data: data))
                }
            } else {
                DispatchQueue.main.async {
                    completion(nil)
                }
            }
        }
    }
    
}

//DispatchQueue.main.async {
//    guard let url = URL(string: userModel[indexPath.row].url) else {return }
//    UIImage.loadFrom(url: url) { image in
//        cell.imgV.image = image
//    }
//}
