//
//  TestViewController.swift
//  MobilKansizlik
//
//  Created by Enes urkan on 5.12.2018.
//  Copyright © 2018 EnesUrkan. All rights reserved.
//

import UIKit

class TestViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!{
        didSet{
            tableView.separatorStyle = .none
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(UINib(nibName: "TestFieldCell", bundle: nil), forCellReuseIdentifier: "Deneme")
            tableView.registerNib(witClassAndIdentifier: ButtonCell.self)
        }
    }
    var indicator = UIActivityIndicatorView()
    var resultData : [TestDescModel] = []
    var testResponseModel = TestResponseModel()
    var descView = DescCustomPopUpView()
    var model = UserTest()
    var buttonClicked = false
    var valide = false
    var resultValide = false
    override func viewDidLoad() {
        super.viewDidLoad()
        addNavigationBarItem()
        fillData()
        indicator = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
        indicator.frame = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0)
        indicator.center = view.center
        view.addSubview(indicator)
        indicator.bringSubviewToFront(view)
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(self.methodOfReceivedNotification(notification:)), name: Notification.Name("NetworkActive"), object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "NetworkActive"), object: nil)
    }
    
    @objc func methodOfReceivedNotification(notification: Notification) {
        fillData()
    }
    
    func fillData(){
        self.indicator.startAnimating()
        DispatchQueue.main.async {
            ServiceManager.shared.initServiceManager()
            ServiceManager.shared.getTestDesc({ (responseData) in
                guard responseData?.result != nil else{
                    self.indicator.stopAnimating()
                    return
                }
                self.resultData = responseData?.result?.tests ?? []
                self.indicator.stopAnimating()
                self.tableView.reloadData()
            })
        }
    }
}

extension TestViewController{
    
    func addNavigationBarItem(){
        self.title = "Mobil Kansızlık Testi"
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
    
    @objc func testResult(){
        self.indicator.startAnimating()
        self.buttonClicked = true
        if(self.isValide()){
            ServiceManager.shared.initServiceManager()
            ServiceManager.shared.postTestValue(self.model, completionHandler: { (responseData) in
                guard responseData?.result != nil else{
                    self.indicator.stopAnimating()
                    let alert = UIAlertController(title: "Alert", message: "Bir hata oluştu. Lütfen tekrardan deneyiniz. Anasayfaya yönlendiriliyorsunuz.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                        switch action.style{
                        case .default:
                            DispatchQueue.main.async(execute: {
                                Session.sideMenu.setContentViewController(UINavigationController(rootViewController: MainViewController()), animated: true)
                                Session.sideMenu.hideMenuViewController()
                            })
                        case .cancel:
                            print("cancel")
                            
                        case .destructive:
                            print("destructive")
                        }}))
                    self.present(alert, animated: true, completion: nil)
                    return
                }
                self.indicator.stopAnimating()
                self.testResponseModel = responseData!.result!
                let rvc: ResultViewController = ResultViewController()
                rvc.testResponseModel = self.testResponseModel
                rvc.cirleViewValue = self.valueAlgorithm(self.model)
                
                DispatchQueue.main.async {
                    rvc.modalPresentationStyle = .overCurrentContext
                    self.present(rvc, animated: true, completion: nil)
                }
            })
        }else{
            indicator.stopAnimating()
        }
    }
    
    func valueAlgorithm(_ userTestModel: UserTest) -> CGFloat{
        if(Double(model.HGB)! < 10.95){
            return 100
        }else if(Double(model.HCT)! > 33.95){
            if(Double(model.HGB)! < 11.35){
                if(Double(model.MCH)! < 29.95){
                    if(Double(model.MCV)! < 67.26){
                        if(Double(model.HGB)! > 11.35){
                            return 100
                        }else{
                            return 20
                        }
                    }else{
                        if(Double(model.HGB)! > 11.35){
                            return 10
                        }else{
                            if(Double(model.HCT)! < 34.85){
                                return 30
                            }else{
                                if(Double(model.HCT)! < 34.95){
                                    return 100
                                }else{
                                    return 10
                                }
                            }
                        }
                    }
                }else{
                    if(Double(model.RBC)! < 29.95){
                        if(Double(model.RBC)! < 3.65){
                            return 10
                        }else{
                            return 100
                        }
                    }
                }
            }
        }
        return 10
    }
    
    @objc func showDescView(_ sender : UIButton){
        
        self.view.endEditing(true)
        self.descView.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        self.descView.backgroundColor = UIColor.clear
        self.descView.alpha = 0
        self.descView.testTitle.text = self.resultData[sender.tag].testDescTitle
        self.descView.testTextView.text = self.resultData[sender.tag].testDescText
        self.view.addSubview(self.descView)
        UIView.animate(withDuration: 0.5, delay: 0.0, options: [UIView.AnimationOptions.curveLinear], animations: {
            self.descView.alpha = 1
        }) { (true) in
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if UIDevice.isPad {
            self.descView.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        }
    }
}

extension TestViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 12{
            let cellButton = tableView.dequeueCell(withClassAndIdentifier: ButtonCell.self, for: indexPath)
            cellButton.button.addTarget(self, action: #selector(testResult), for: .touchUpInside)
            return cellButton
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Deneme", for: indexPath) as! TestFieldCell
            cell.updateCell(indexPath: indexPath as NSIndexPath)
            cell.textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
            if(self.resultData.count > 0){
                cell.customDescView.addTarget(self, action: #selector(showDescView(_:)), for: .touchUpInside)
            }
            cell.customDescView.tag = indexPath.row
            cell.textField.delegate = self
            if (self.buttonClicked){cell.textField.validTest(cell.textField, type: .testValue)}
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 13
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}

extension TestViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 12 {
            return 80
        }else{
            return 60
        }
    }
    
}

extension TestViewController : UITextFieldDelegate{
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        
        switch textField.tag {
        case TestTextField.WBC.rawValue:
            if(textField.testFieldKeyboardValide(textField)){
                model.WBC = textField.text!
            }else{
                textField.text = model.WBC
            }
            textField.validTest(textField, type: .testValue)
            break
        case TestTextField.NE.rawValue:
            if(textField.testFieldKeyboardValide(textField)){
                model.NE = textField.text!
            }else{
                textField.text = model.NE
            }
            textField.validTest(textField, type: .testValue)
            break
        case TestTextField.RBC.rawValue:
            if(textField.testFieldKeyboardValide(textField)){
                model.RBC = textField.text!
            }else{
                textField.text = model.RBC
            }
            textField.validTest(textField, type: .testValue)
            break
        case TestTextField.HGB.rawValue:
            if(textField.testFieldKeyboardValide(textField)){
                model.HGB = textField.text!
            }else{
                textField.text = model.HGB
            }
            textField.validTest(textField, type: .testValue)
            break
        case TestTextField.HCT.rawValue:
            if(textField.testFieldKeyboardValide(textField)){
                model.HCT = textField.text!
            }else{
                textField.text = model.HCT
            }
            textField.validTest(textField, type: .testValue)
            break
        case TestTextField.MCHC.rawValue:
            if(textField.testFieldKeyboardValide(textField)){
                model.MCHC = textField.text!
            }else{
                textField.text = model.MCHC
            }
            textField.validTest(textField, type: .testValue)
            break
        case TestTextField.MCH.rawValue:
            if(textField.testFieldKeyboardValide(textField)){
                model.MCH = textField.text!
            }else{
                textField.text = model.MCH
            }
            textField.validTest(textField, type: .testValue)
            break
        case TestTextField.MCV.rawValue:
            if(textField.testFieldKeyboardValide(textField)){
                model.MCV = textField.text!
            }else{
                textField.text = model.MCV
            }
            textField.validTest(textField, type: .testValue)
            break
        case TestTextField.LYM.rawValue:
            if(textField.testFieldKeyboardValide(textField)){
                model.LYM = textField.text!
            }else{
                textField.text = model.LYM
            }
            textField.validTest(textField, type: .testValue)
            break
        case TestTextField.RDW.rawValue:
            if(textField.testFieldKeyboardValide(textField)){
                model.RDW = textField.text!
            }else{
                textField.text = model.RDW
            }
            textField.validTest(textField, type: .testValue)
            break
        case TestTextField.PLT.rawValue:
            if(textField.testFieldKeyboardValide(textField)){
                model.PLT = textField.text!
            }else{
                textField.text = model.PLT
            }
            textField.validTest(textField, type: .testValue)
            break
        case TestTextField.MPV.rawValue:
            if(textField.testFieldKeyboardValide(textField)){
                model.MPV = textField.text!
            }else{
                textField.text = model.MPV
            }
            textField.validTest(textField, type: .testValue)
            break
        default:
            break
        }
    }
    
    func isValide() -> Bool{
        
        var isValieValue = true
        if(model.WBC.isEmpty){
            isValieValue = false
            if let cell = self.tableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? TestFieldCell{
                cell.textField.validTest(cell.textField, type: .testValue)
            }
        }
        if(model.NE.isEmpty){
            isValieValue = false
            if let cell = self.tableView.cellForRow(at: IndexPath(row: 1, section: 0)) as? TestFieldCell{
                cell.textField.validTest(cell.textField, type: .testValue)
                
            }
        }
        if(model.RBC.isEmpty){
            isValieValue = false
            if let cell = self.tableView.cellForRow(at: IndexPath(row: 2, section: 0)) as? TestFieldCell{
                cell.textField.validTest(cell.textField, type: .testValue)
                
            }
        }
        if(model.HGB.isEmpty){
            isValieValue = false
            if let cell = self.tableView.cellForRow(at: IndexPath(row: 3, section: 0)) as? TestFieldCell{
                cell.textField.validTest(cell.textField, type: .testValue)
            }
        }
        if(model.HCT.isEmpty){
            isValieValue = false
            if let cell = self.tableView.cellForRow(at: IndexPath(row: 4, section: 0)) as? TestFieldCell{
                cell.textField.validTest(cell.textField, type: .testValue)
            }
        }
        if(model.MCHC.isEmpty){
            isValieValue = false
            if let cell = self.tableView.cellForRow(at: IndexPath(row: 5, section: 0)) as? TestFieldCell{
                cell.textField.validTest(cell.textField, type: .testValue)
            }
        }
        if(model.MCH.isEmpty){
            isValieValue = false
            if let cell = self.tableView.cellForRow(at: IndexPath(row: 6, section: 0)) as? TestFieldCell{
                cell.textField.validTest(cell.textField, type: .testValue)
            }
        }
        if(model.MCV.isEmpty){
            isValieValue = false
            if let cell = self.tableView.cellForRow(at: IndexPath(row: 7, section: 0)) as? TestFieldCell{
                cell.textField.validTest(cell.textField, type: .testValue)
            }
        }
        if(model.LYM.isEmpty){
            isValieValue = false
            if let cell = self.tableView.cellForRow(at: IndexPath(row: 8, section: 0)) as? TestFieldCell{
                cell.textField.validTest(cell.textField, type: .testValue)
            }
        }
        if(model.RDW.isEmpty){
            isValieValue = false
            if let cell = self.tableView.cellForRow(at: IndexPath(row: 9, section: 0)) as? TestFieldCell{
                cell.textField.validTest(cell.textField, type: .testValue)
            }
        }
        if(model.PLT.isEmpty){
            isValieValue = false
            if let cell = self.tableView.cellForRow(at: IndexPath(row: 10, section: 0)) as? TestFieldCell{
                cell.textField.validTest(cell.textField, type: .testValue)
            }
        }
        if(model.MPV.isEmpty){
            isValieValue = false
            if let cell = self.tableView.cellForRow(at: IndexPath(row: 11, section: 0)) as? TestFieldCell{
                cell.textField.validTest(cell.textField, type: .testValue)
            }
        }
        
        return isValieValue
    }
    
}

public extension UIDevice {
    
    public class var isPhone: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
    
    public class var isPad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
    
    public class var isTV: Bool {
        return UIDevice.current.userInterfaceIdiom == .tv
    }
    
    public class var isCarPlay: Bool {
        return UIDevice.current.userInterfaceIdiom == .carPlay
    }
    
}
