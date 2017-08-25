//
//  FunViewController.swift
//  FollowMii
//
//  Created by 辛忠翰 on 2017/7/22.
//  Copyright © 2017年 辛忠翰. All rights reserved.
//

import UIKit

class FunViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var bannerImgView: UIImageView!
    @IBAction func add(_ sender: UIButton) {
//        let checkVC = CheckListViewController(nibName: "CheckListViewController", bundle: nil)
//        self.present(checkVC, animated: true, completion: nil)
        
    }
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var sliderBar: UISlider!
    @IBOutlet weak var valueLabel: UILabel!
    @IBOutlet weak var parameterLabel: UILabel!
    @IBOutlet weak var timerView: UIImageView!
    @IBOutlet weak var distanceView: UIImageView!
    
    let banner = CheckList.init(date: "2017/7/24", title: "JuiFen", todayWeather: .rainy, time: "20:00", temperature: "30˚C/ 33˚C", bg: "photo1", subtitle: "Old twon & tea shop")
    
    var collectionViewDataSource = FunCollectionDataSources.init()
    func setLabelValue(){
        valueLabel.text = "\(Int(sliderBar.value))"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setTap(selector: #selector(FunViewController.distanceTapped(sender:))) { (tap) in
            tap.numberOfTapsRequired = 1
            distanceView.addGestureRecognizer(tap)
            distanceView.isUserInteractionEnabled = true
        }
        setTap(selector: #selector(FunViewController.timeTapped(sender:))) { (tap) in
            tap.numberOfTapsRequired = 1
            timerView.addGestureRecognizer(tap)
            timerView.isUserInteractionEnabled = true
        }
        valueLabel.text = "\(Int(sliderBar.value))"
        setSliderBar()
        bannerImgView.image = UIImage(named: "\(banner.background)")
        bannerImgView.alpha = 0.6
        self.titleLabel.text = "\(banner.title)"
        self.subtitleLabel.text = "\(banner.subtitle)"
        self.setCollectionView()
        self.navigationController?.isNavigationBarHidden = true
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    func setCollectionView()  {
        let width = collectionView.frame.width/2
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
        collectionView.backgroundColor = UIColor.clear
    }
    
    func setSliderBar() {
        sliderBar.minimumValue = 0
        sliderBar.maximumValue = 10
        sliderBar.value = 2
        sliderBar.isContinuous = false
        sliderBar.addTarget(self, action: #selector(FunViewController.setLabelValue), for: .valueChanged)
        sliderBar.minimumTrackTintColor = UIColor.green
    }
    
    func setTap(selector: Selector?, completion: (_ tap : UITapGestureRecognizer) -> Void) {
        let distanceTap = UITapGestureRecognizer(target: self, action: selector)
        completion(distanceTap)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func distanceTapped(sender: UIGestureRecognizer){
        if distanceView.image == UIImage(named: "loc_off"){
            distanceView.image = UIImage(named: "loc_on")
            timerView.image = UIImage(named: "timer_off")
            parameterLabel.text = "km"
        }else {
            
        }
    }
    
    func timeTapped(sender: UIGestureRecognizer){
        if timerView.image == UIImage(named: "timer_off"){
            timerView.image = UIImage(named: "timer_on")
            distanceView.image = UIImage(named: "loc_off")
            parameterLabel.text = "hr"
        }else {
            
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MasterToDetail"{
            let distViewController = segue.destination as! FunCollectionViewItemViewController
            distViewController.data = sender as? FunCollectionViewData
        }
    }
}

extension FunViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! FunCollectionViewCell
        if let data = collectionViewDataSource.dataForItemAtIndexPath(indexPath: indexPath){
            cell.configureCell(data: data)
        }
        return cell
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return collectionViewDataSource.numberOfSection
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewDataSource.numberOfDatasInSections(index: section)
    }
}

extension FunViewController: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let data = collectionViewDataSource.dataForItemAtIndexPath(indexPath: indexPath){
            performSegue(withIdentifier: "MasterToDetail", sender: data)
        }
    }
}

