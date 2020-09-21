//
//  WeekViewController.swift
//  WorkoutLog
//
//  Created by Alec Barton on 9/20/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import UIKit

class WeekViewController: UIViewController {
    
    private lazy var tempLabel: UILabel = {
        let label = UILabel()
        label.text = "Weekly View"
        label.textAlignment = .left
        label.font = UIFont(name: "Avenir Next Condensed", size: 32)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = ColorTheme.lightGray1
        
        setupSubviews()
    }
    
    private func setupSubviews() {
        view.addSubview(tempLabel)
        
        NSLayoutConstraint.activate([
            tempLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            tempLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
}
