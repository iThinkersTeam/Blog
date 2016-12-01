//
//  ViewController.swift
//  Enum and Table
//
//  Created by Alex on 20.11.16.
//  Copyright © 2016 Alex. All rights reserved.
//

import UIKit

enum Numbers: Int, Countable {
    case one = 0, two, three, fouth

    static let names = [one: "One", two: "Two", three: "Three", fouth: "Fouth"]
}



class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Numbers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MainTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        if let name = Numbers.init(rawValue: indexPath.row) {
            cell.name.text = Numbers.names[name]
        }
        return cell
    }
}




