//
//  MainNavigationController.swift
//  WorkoutLog
//
//  Created by Alec Barton on 9/5/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import UIKit

class MainNavigationController: UINavigationController {
    
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
        button.setImage(UIImage(named: "penIcon"), for: .normal)
        button.tintColor = .white
        button.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        button.layer.cornerRadius = 20
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .darkGray
        button.applyDropShadow()
        return button
    }()
    
    private lazy var menuView: MenuView = {
        let view = MenuView()
        view.delegate = self
        view.applyDropShadow()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var blurView: UIVisualEffectView = {
        let view = UIVisualEffectView()
        view.effect = UIBlurEffect(style: .regular)
        view.alpha = 0.75
        view.isHidden = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var menuViewWidthConstraint: NSLayoutConstraint!
    var menuViewMaxWidth = UIScreen.main.bounds.width * 0.6
    var menuIsOpen: Bool = false {
        didSet {
            menuViewWidthConstraint.constant = menuIsOpen ? menuViewMaxWidth : 0
            blurView.isHidden = !menuIsOpen
            UIView.animate(withDuration: 0.25, animations: { [weak self] in
                self?.view.layoutIfNeeded()
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.Str.veryLightGray
        isNavigationBarHidden = true
        
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
            hamburgerButton.topAnchor.constraint(equalTo: view.safeAreaTopAnchor, constant: 5.0),
            hamburgerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30.0),
            hamburgerButton.widthAnchor.constraint(equalToConstant: 40.0),
            hamburgerButton.heightAnchor.constraint(equalToConstant: 40.0),
            
            logButton.bottomAnchor.constraint(equalTo: view.safeAreaBottomAnchor, constant: -10.0),
            logButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logButton.widthAnchor.constraint(equalToConstant: 60.0),
            logButton.heightAnchor.constraint(equalToConstant: 60.0),
            
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
    
    @objc private func hamburgerButtonTapped(_ sender: Any) {
        menuIsOpen = !menuIsOpen
    }
    
    @objc private func viewSwipedLeft(_ sender: Any) {
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

extension MainNavigationController: MenuViewDelegate {
    func present(_ viewController: UIViewController) {
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.modalPresentationStyle = .fullScreen
        navigationController.modalPresentationStyle = .custom
        navigationController.transitioningDelegate = self
        self.present(navigationController, animated: true)
    }
}

extension MainNavigationController:  UIViewControllerTransitioningDelegate {
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
}

extension MainNavigationController: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromView = transitionContext.viewController(forKey: .from)?.view else { return }
        guard let toView = transitionContext.viewController(forKey: .to)?.view else { return }

        let isPresenting = fromView == view
        let newView = isPresenting ? toView : fromView
        let prevView = isPresenting ? fromView : toView
        
        if isPresenting {
            transitionContext.containerView.addSubview(newView)
        }

        let screenSize = UIScreen.main.bounds.size
        let positiveOffScreenFrame = CGRect(origin: CGPoint(x: screenSize.width, y:0), size: screenSize)
        let negativeOffScreenFrame = CGRect(origin: CGPoint(x: screenSize.width * -1, y:0), size: screenSize)
        let onScreenFrame = CGRect(origin: .zero, size: screenSize)
        let duration = transitionDuration(using: transitionContext)
        
        newView.frame = isPresenting ? positiveOffScreenFrame : onScreenFrame
        
        UIView.animate(withDuration: duration, animations: {
            newView.frame = isPresenting ? onScreenFrame : positiveOffScreenFrame
            prevView.frame = isPresenting ? negativeOffScreenFrame : onScreenFrame
        }, completion: { (success) in
            if !isPresenting {
                newView.removeFromSuperview()
            }
            transitionContext.completeTransition(success)
        })
    }
}


