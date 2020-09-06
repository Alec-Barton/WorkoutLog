//
//  ProfileViewController.swift
//  WorkoutLog
//
//  Created by Alec Barton on 9/5/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    //TODO: TEMP
    private lazy var dismissButton: UIButton = {
        let button = UIButton()
        button.setTitle("DISMISS", for: .normal)
        button.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        self.view.backgroundColor = ColorTheme.lightGray1
        
        setupSubviews()
    }
    
    func setupSubviews() {
        view.addSubview(dismissButton)
        
        NSLayoutConstraint.activate([
            dismissButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dismissButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            dismissButton.heightAnchor.constraint(equalToConstant: 50.0),
            dismissButton.widthAnchor.constraint(equalToConstant: 100.0),
        ])
    }
    
    //TODO: TEMP
    @objc private func dismissButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
}




