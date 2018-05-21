//
//  First.swift
//  NoIdentifier
//
//  Created by Alex on 14.12.16.
//  Copyright © 2016 Alex. All rights reserved.
//

import UIKit

class First: UIViewController {
    
    static func storyboardInstance() -> First? {
        let storyboard = UIStoryboard(name: String(describing: self), bundle: nil)
        return storyboard.instantiateInitialViewController() as? First
    }
    let titles = ["One", "Two", "Three", "Fouth"]

    override func viewDidLoad() {
        super.viewDidLoad()
        let rightButtons = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(goNextScreen))
        self.navigationItem.rightBarButtonItem = rightButtons
        let leftButtons = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(goNextScreen))
        self.navigationItem.leftBarButtonItem = leftButtons
    }
    
    func goNextScreen() {
        if let vc = Second.storyboardInstance() {
            self.present(vc, animated: true, completion: nil)
        }
        
//        let storyboard = UIStoryboard(name: "Second", bundle: nil)
//        if let vc = storyboard.instantiateViewController(withIdentifier: "Second") as? Second {
//            self.navigationController?.pushViewController(vc, animated: true)
//        }
        
        let storyboard = UIStoryboard(name: "Second", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "Second") as? Second {
            self.present(vc, animated: true, completion: nil)
        }
        
    }
}


//MARK: - TableViewDataSource
extension First: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Test") as? MainCell else {
            return UITableViewCell() }
        
        return cell
    }
}

