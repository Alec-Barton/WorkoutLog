//
//  MenuViewController.swift
//  WorkoutLog
//
//  Created by Alec Barton on 9/5/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    private lazy var hamburgerButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "hamburgerIcon"), for: .normal)
        button.imageView?.tintColor = .gray
        button.addTarget(self, action: #selector(hamburgerButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var logButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "editIcon"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var menuView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var blurView: UIVisualEffectView = {
        let view = UIVisualEffectView()
        view.effect = UIBlurEffect(style: .regular)
        view.alpha = 0.5
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var menuViewWidthConstraint: NSLayoutConstraint!
    var menuViewMaxWidth = UIScreen.main.bounds.width * (2/3)
    var menuIsOpen: Bool = false {
        didSet {
            menuViewWidthConstraint.constant = menuIsOpen ? menuViewMaxWidth : 0
            blurView.isHidden = !menuIsOpen
            UIView.animate(withDuration: 0.15, animations: { [weak self] in
                self?.view.layoutIfNeeded()
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupSubviews()
        setupGestureRecognizers()
    }
    
    private func setupSubviews() {
        
        view.addSubview(hamburgerButton)
        view.addSubview(logButton)
        view.addSubview(blurView)
        view.addSubview(menuView)
        
        
        menuViewWidthConstraint = menuView.widthAnchor.constraint(equalToConstant: 0)
        
        NSLayoutConstraint.activate([
            hamburgerButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 50.0),
            hamburgerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50.0),
            hamburgerButton.widthAnchor.constraint(equalToConstant: 50.0),
            hamburgerButton.heightAnchor.constraint(equalToConstant: 50.0),
            
            logButton.bottomAnchor.constraint(equalTo: view.safeAreaBottomAnchor, constant: 20.0),
            logButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logButton.widthAnchor.constraint(equalToConstant: 50.0),
            logButton.heightAnchor.constraint(equalToConstant: 50.0),
            
            blurView.topAnchor.constraint(equalTo: view.topAnchor),
            blurView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            blurView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            menuView.topAnchor.constraint(equalTo: view.topAnchor),
            menuView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            menuView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            menuViewWidthConstraint
        ])
    }
    
    private func setupGestureRecognizers() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(viewSwipedLeft))
        swipeRight.direction = .left
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(viewSwipedRight))
        swipeLeft.direction = .right
        self.view.addGestureRecognizer(swipeLeft)
        
        let tapBlur = UITapGestureRecognizer(target: self, action: #selector(blurViewTapped))
        self.blurView.addGestureRecognizer(tapBlur)
    }
    
    @objc private func hamburgerButtonTapped() {
        menuIsOpen = !menuIsOpen
    }
    
    @objc private func viewSwipedLeft() {
        if !menuIsOpen {
            menuIsOpen = true
        }
    }
    
    @objc private func viewSwipedRight() {
        if menuIsOpen {
            menuIsOpen = false
        }
    }
    
    @objc private func blurViewTapped() {
        menuIsOpen = false
        
    }
}
