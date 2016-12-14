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
    }
    
    func goNextScreen() {
        if let second = Second.storyboardInstance() {
            self.navigationController?.pushViewController(second, animated: true)
        }
    }
}

extension First: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MainCell = tableView.dequeueReusableCell(for: indexPath)
        cell.title.text = titles[indexPath.row]
     
        return cell
    }
}

