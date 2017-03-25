//
//  ViewController.swift
//  DVBannerView
//
//  Created by David on 2017/3/25.
//  Copyright © 2017年 David. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    private let TableViewHeaderHeight:CGFloat = 200.0
    /*
     * Banner 数组
     */
    private var photoUrlArray = [String]()
    private var textArray = [String]()
    
    private var dataArray = [String]()
    
    lazy var mainTableView: UITableView = {
       let tableView = UITableView.init(frame: CGRect.zero, style: UITableViewStyle.grouped)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    lazy var bannerView: DVBannerView = {
        let view = DVBannerView.init(photoArray: self.dataArray, textArray: self.dataArray ,viewHeight:200.0)
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        self.setupView()
        self.setupData()
        
    }
    
    func setupView() {
        self.view.addSubview(self.mainTableView)
        self.mainTableView.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(self.view).offset(0)
            make.top.equalTo(self.view).offset(0)
            make.right.equalTo(self.view).offset(0)
            make.bottom.equalTo(self.view).offset(0)
        }
    }
    func setupData(){
        for i in 1...6 {
            let strA = String(format:"https://raw.githubusercontent.com/onevcat/Kingfisher/master/images/kingfisher-\(i).jpg")
            self.dataArray.append(strA)
        }
        self.mainTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let initIdentifier = "reuseID"
        var cell:DVMessageTableViewCell! = tableView.dequeueReusableCell(withIdentifier: initIdentifier) as? DVMessageTableViewCell
        if cell == nil {
            cell = DVMessageTableViewCell(style:.default,reuseIdentifier:initIdentifier)
        }
        
        let url = URL(string:self.dataArray[indexPath.row])
        cell.leftImageView.kf.setImage(with:url)
        cell.titleLabel.text = "FIFA官网：国足胜韩本轮最佳 客战伊朗或再造惊喜"
        let iconImage = UIImage(named:"Baby-icon")?.withRenderingMode(.alwaysOriginal)
        cell.collectionButton.setImage(iconImage, for: .normal)
        cell.collectionButton.setTitle("100", for: .normal)
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return self.bannerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return TableViewHeaderHeight
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

