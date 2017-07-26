//
//  FunCollectionViewItemViewController.swift
//  FollowMii
//
//  Created by 辛忠翰 on 2017/7/25.
//  Copyright © 2017年 辛忠翰. All rights reserved.
//

import UIKit

class FunCollectionViewItemViewController: UIViewController {
    var data: FunCollectionViewData?
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionTextview: UITextView!
    @IBAction func seeMap(sender: UIButton){
        
    }
    @IBAction func callUber(sender: UIButton){
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = false
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
        titleLabel.text = data?.title
        subtitleLabel.text = data?.subtitle
        descriptionTextview.text = data?.description
        timeLabel.text = data?.startTime
        priceLabel.text = "\(String((data?.money)!))"
        photo.image = UIImage(named: (data?.photo)!)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
