//
//  MenuButton.swift
//  WorkoutLog
//
//  Created by Alec Barton on 9/5/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import UIKit

class MenuButton: UIButton {
    
    static let height: CGFloat = 25.0
    
    private lazy var buttonIcon: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var buttonTitle: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir Next Condensed", size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    convenience init(title: String, image: UIImage?, tintColor: UIColor = .black) {
        self.init(frame: .zero)
        
        titleLabel?.isHidden = false
        imageView?.isHidden = false
        
        buttonIcon.image = image
        buttonIcon.tintColor = tintColor
        buttonTitle.text = title
        buttonTitle.textColor = tintColor
        
        setupSubviews()
    }
    
    private func setupSubviews() {
        self.addSubview(buttonIcon)
        self.addSubview(buttonTitle)
        
        NSLayoutConstraint.activate([
            buttonIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            buttonIcon.heightAnchor.constraint(equalToConstant: MenuButton.height),
            buttonIcon.widthAnchor.constraint(equalToConstant: MenuButton.height),
            buttonIcon.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25.0),
            
            buttonTitle.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            buttonTitle.heightAnchor.constraint(equalToConstant: MenuButton.height),
            buttonTitle.leadingAnchor.constraint(equalTo: buttonIcon.trailingAnchor, constant: 20.0),
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @available(*, unavailable)
    override func setTitle(_ title: String?, for state: UIControl.State) {}
    @available(*, unavailable)
    override func setImage(_ image: UIImage?, for state: UIControl.State) {}
}
