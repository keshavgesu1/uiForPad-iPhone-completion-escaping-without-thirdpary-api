//
//  SecondViewController.swift
//  UiForPhoneAndPad
//
//  Created by Keshav Raj Kashyap on 17/12/21.
//

import UIKit

class SecondViewController: UIViewController {
    
    var topView:UIView!
    var bottomView:UIView!
    var tableView:UITableView!

    @IBOutlet weak var imageView:UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
    }
    
    
    func setView(){
        topView = UIView(frame: (CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height/2)))
        topView.backgroundColor = .systemTeal
        self.view.addSubview(topView)
        tableView = UITableView(frame: CGRect(x: 0, y: self.topView.frame.height, width: 100, height: 100  ))
        self.view.addSubview(tableView)
        tableView.backgroundColor = .green
    }

}


//MARK: - TABLEVIEW DELEGATES AND DATA SOURCE

