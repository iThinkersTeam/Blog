//
//  CustomProtocols.swift
//  Enum and Table
//
//  Created by Alex on 20.11.16.
//  Copyright © 2016 Alex. All rights reserved.
//

import UIKit
/// Make your `UITableViewCell` and `UICollectionViewCell` subclasses
/// conform to this protocol when they are *not* NIB-based but only code-based
/// to be able to dequeue them in a type-safe manner
public protocol Reusable: class {
    static var reuseIdentifier: String { get }
}

protocol Countable {
    var rawValue: Int { get }
    static var count: Int { get }
    init?(rawValue: Int)
}

// MARK: - Implementation
public extension Reusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension Countable {
    static var count: Int {
        var max = 0
        while let _ = self.init(rawValue: max) { max += 1 }
        return max
    }
}
