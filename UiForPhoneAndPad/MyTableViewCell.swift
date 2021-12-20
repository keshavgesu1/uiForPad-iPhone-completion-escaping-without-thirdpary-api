//
//  MyTableViewCell.swift
//  UiForPhoneAndPad
//
//  Created by Keshav Raj Kashyap on 16/12/21.
//

import UIKit

class MyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imgV: LazyImageView!
    @IBOutlet weak var label:UILabel!
    private var dataTask : URLSessionDataTask?
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(with title: String, url: URL?, session: URLSession) {
        label.text = title
        if let url = url{
            let dataTask = session.dataTask(with: url)  {[weak self] (data, resonce, err) in
                guard let data = data else {
                    return
                }
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    self?.imgV.image = image
                }
            }
            dataTask.resume()
            self.dataTask = dataTask
        }
    }
    override func prepareForReuse() {
        dataTask?.cancel()
        dataTask = nil
        imgV.image = nil
    }
    
    
    
}
