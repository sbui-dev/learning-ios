//
//  CircularButton.swift
//  SimonSays
//
//  Created by Steven Bui on 4/23/19.
//  Copyright © 2019 Steven Bui. All rights reserved.
//

import UIKit

class CircularButton: UIButton {

    override func awakeFromNib() {
        layer.cornerRadius = frame.size.width / 2
        layer.masksToBounds = true
    }

    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                alpha = 1.0
            }
            else {
                alpha = 0.5
            }
        }
    }
}
