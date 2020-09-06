//
//  MenuView.swift
//  WorkoutLog
//
//  Created by Alec Barton on 9/5/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import UIKit

class MenuView: UIView {
    
    private lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.backgroundColor = .black
        view.axis = .vertical
        view.alignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var logoView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "strLogo")
        view.contentMode = .scaleAspectFit
        view.tintColor = .darkGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "STR"
        label.font = UIFont(name: "Avenir Next", size: 25)?.bold
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var profileButton: UIButton = {
        let button = UIButton()
        button.setTitle("Profile", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var workoutsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Workouts", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var settingsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Settings", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    private func setup() {
        backgroundColor = ColorTheme.lightGray1

        addSubview(contentView)
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: self.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])

        contentView.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.safeAreaTopAnchor, constant: 25.0),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
        
        stackView.addArrangedSubview(logoView)
        stackView.setCustomSpacing(2.0, after: logoView)
        NSLayoutConstraint.activate([
            logoView.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
            logoView.widthAnchor.constraint(equalToConstant: 50.0),
            logoView.heightAnchor.constraint(equalToConstant: 50.0),
        ])
        
        stackView.addArrangedSubview(titleLabel)
        stackView.setCustomSpacing(24.0, after: titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: stackView.centerXAnchor),
            titleLabel.widthAnchor.constraint(equalToConstant: 100.0),
            titleLabel.heightAnchor.constraint(equalToConstant: 30.0),
        ])
        
        stackView.addArrangedSubview(profileButton)
        stackView.setCustomSpacing(24.0, after: profileButton)
        NSLayoutConstraint.activate([
            profileButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            profileButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            profileButton.heightAnchor.constraint(equalToConstant: 50.0),
        ])
        
        stackView.addArrangedSubview(workoutsButton)
        stackView.setCustomSpacing(24.0, after: workoutsButton)
        NSLayoutConstraint.activate([
            workoutsButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            workoutsButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            workoutsButton.heightAnchor.constraint(equalToConstant: 50.0),
        ])
        
        stackView.addArrangedSubview(settingsButton)
        stackView.setCustomSpacing(24.0, after: settingsButton)
        NSLayoutConstraint.activate([
            settingsButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            settingsButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            settingsButton.heightAnchor.constraint(equalToConstant: 50.0),
        ])
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
