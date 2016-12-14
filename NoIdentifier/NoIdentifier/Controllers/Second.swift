//
//  Second.swift
//  NoIdentifier
//
//  Created by Alex on 14.12.16.
//  Copyright © 2016 Alex. All rights reserved.
//

import UIKit

class Second: UIViewController {
    
    static func storyboardInstance() -> Second? {
        let storyboard = UIStoryboard(name: String(describing: self), bundle: nil)
        return storyboard.instantiateInitialViewController() as? Second
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
