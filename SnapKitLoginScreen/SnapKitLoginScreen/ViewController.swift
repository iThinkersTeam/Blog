//
//  ViewController.swift
//  SnapKitLoginScreen
//
//  Created by Alex on 10.10.16.
//  Copyright © 2016 Alex. All rights reserved.
//

import UIKit
import SnapKit

enum Size: Int {
    case iphone4 = 480
    case iphone5 = 568
    case iphone6 = 667
    case iphone6Plus = 736
}

class ViewController: UIViewController {

    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var numberPhone: UITextField!
    @IBOutlet weak var taxi: UIButton!
    @IBOutlet weak var customer: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareConstrains()
    }
    
    func prepareConstrains() {
        
        background.snp.makeConstraints {
//            $0.left.equalTo(self.view).offset(0)
//            $0.right.equalTo(self.view).offset(0)
//            $0.top.equalTo(self.view).offset(0)
//            $0.bottom.equalTo(self.view).offset(0)
            $0.edges.equalTo(self.view).inset(UIEdgeInsetsMake(0, 0, 0, 0)) //same above
            $0.height.equalTo(self.view.frame.height)
            $0.width.equalTo(self.view.frame.height)
        }
        
        logo.snp.makeConstraints {
            switch Int(self.view.frame.height) {
            case Size.iphone4.rawValue: $0.top.equalTo(self.view).offset(50)
            case Size.iphone5.rawValue: $0.top.equalTo(self.view).offset(75)
            case Size.iphone6.rawValue: $0.top.equalTo(self.view).offset(150)
            case Size.iphone6Plus.rawValue: $0.top.equalTo(self.view).offset(200)
            default: print("unknow size")
            }

            $0.height.width.equalTo(150)
            $0.centerX.equalTo(self.view.center.x)
        }
        
        numberPhone.snp.makeConstraints {
            $0.width.equalTo(190)
            $0.centerX.equalTo(self.view.center.x)
            $0.top.equalTo(logo.snp.bottom).offset(40)
        }
        
        taxi.snp.makeConstraints {
            $0.width.equalTo(numberPhone).dividedBy(2.5) //divide numberPhone width by 2.5
            $0.height.equalTo(30)
            $0.top.equalTo(numberPhone.snp.bottom).offset(40)
            $0.left.equalTo(numberPhone.snp.left)
        }
        
        customer.snp.updateConstraints {
            $0.size.equalTo(taxi).multipliedBy(1) //multiply size taxi by 1
            $0.left.equalTo(taxi.snp.right).offset(40).priority(500) //you can write priority
            $0.top.equalTo(taxi)
        }
    }
    
    
    func updateConstrains() {
        logo.snp.updateConstraints {
            $0.width.height.equalTo(100)
        }
    }
    
    func remakeConstrains() {
//       logo.snp.removeConstraints()
//       logo.snp.updateConstraints {
//            $0.width.height.equalTo(100)
//       }
        logo.snp.remakeConstraints { //same above
            $0.width.height.equalTo(150)
        }
    }
    
    @IBAction func modifyCustomer(_ sender: UIButton) {
        remakeConstrains()
    }
    
    @IBAction func modifyTaxi(_ sender: UIButton) {
        updateConstrains()
    }
}

