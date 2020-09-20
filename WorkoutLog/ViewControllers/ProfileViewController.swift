//
//  ProfileViewController.swift
//  WorkoutLog
//
//  Created by Alec Barton on 9/5/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        self.view.backgroundColor = ColorTheme.lightGray1
        
        setupSubviews()
        setupNavbar()
        setupGestureRecognizers()
    }
    
    func setupSubviews() {}
    
    func setupNavbar() {
        UINavigationBar.setVisibility(false)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "leftArrowIcon"), style: .plain, target: self, action: #selector(leftBarButtonTapped))
        navigationItem.leftBarButtonItem?.tintColor = .black
    }
    
    private func setupGestureRecognizers() {
        
        //TODO: Not sure if I like this UX 
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(viewSwipedRight))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
    }
    
    @objc private func leftBarButtonTapped() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func viewSwipedRight() {
        self.dismiss(animated: true, completion: nil)
    }
}




