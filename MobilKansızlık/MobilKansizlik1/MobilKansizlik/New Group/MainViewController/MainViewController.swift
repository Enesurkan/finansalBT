//
//  MainViewController.swift
//  MobilKansizlik
//
//  Created by Enes urkan on 18.11.2018.
//  Copyright © 2018 EnesUrkan. All rights reserved.
//

import UIKit




class MainViewController: BaseViewController{
    
    
    var customView = MainCellView()
    var resultData : [NewsModel] = []
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.delegate = self
            tableView.dataSource = self
            tableView.registerNib(witClassAndIdentifier: ListTableViewCell.self)
            tableView.separatorStyle = .none
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(self.methodOfReceivedNotification(notification:)), name: Notification.Name("NetworkActive"), object: nil)
        serviceConnection()
    }
    
    @objc func methodOfReceivedNotification(notification: Notification) {
        serviceConnection()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "NetworkActive"), object: nil)
    }
    
    func configureUI(){
        self.title = "Mobil Kansızlık Tanısı"
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        //NavigationRightButton Create
        let button = UIButton(type: .custom)
        button.setBackgroundImage(UIImage(named: "menu"), for: .normal)
        button.addTarget(self, action: #selector(self.presentRightMenuViewController(_:)), for: .touchUpInside)
        button.widthAnchor.constraint(equalToConstant: 25).isActive = true
        button.heightAnchor.constraint(equalToConstant: 25).isActive = true
        let barButton = UIBarButtonItem(customView: button)
        self.navigationItem.rightBarButtonItem = barButton
    }
    
    func serviceConnection(){
        let indicator: UIActivityIndicatorView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
        indicator.frame = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0)
        indicator.center = view.center
        indicator.tag = 54
        view.addSubview(indicator)
        indicator.bringSubviewToFront(view)
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        indicator.startAnimating()
        DispatchQueue.main.async {
            ServiceManager.shared.initServiceManager()
            ServiceManager.shared.getNews({ (responseData) in
                guard responseData?.result != nil else{
                    indicator.stopAnimating()
                    return
                }
                self.resultData = responseData?.result?.news ?? []
                indicator.stopAnimating()
                self.tableView.reloadData()
                
            })
        }
        if let view = view.viewWithTag(54) {
            view.removeFromSuperview()
        }
    }
    
    
    
}

extension MainViewController : UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.resultData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueCell(withClassAndIdentifier: ListTableViewCell.self, for: indexPath)
        
        cell.fillData(resultData[indexPath.row])
        
        return cell
        
    }
    
}

extension MainViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if(UIDevice.isPad){
            return 600
        }
        
        return 290
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let storyboard = UIStoryboard(name: StoryBoardName.Reusable.rawValue, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: ScreenID.ReusableTextVC.rawValue) as! ReusableTextVC
        vc.resultData = resultData[indexPath.row]
        DispatchQueue.main.async {
            vc.modalPresentationStyle = .overCurrentContext
            self.present(vc, animated: true, completion:nil)
        }
//        
//        self.goto(screenID: ScreenID.ReusableTextVC.rawValue, storyboardName: StoryBoardName.Reusable.rawValue, animated: true, data: resultData[indexPath.row], isModal: true, isNavigation: false, showNavBar: false)
        
    }
}
















