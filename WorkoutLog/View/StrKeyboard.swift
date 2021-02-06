//
//  StrKeyboardView.swift
//  WorkoutLog
//
//  Created by Alec Barton on 2/6/21.
//  Copyright © 2021 Alec Barton. All rights reserved.
//

import UIKit

class StrKeyboardButton: UIButton {
    static let height: CGFloat = 44.0
    
    convenience init(value: String) {
        self.init(frame: .zero)
        self.setTitle(value, for: .normal)
        backgroundColor = .systemPink
    }
}

class StrKeyboardBackButton: StrKeyboardButton {
    convenience init() {
        self.init(frame: .zero)
        setTitle("<", for: .normal)
        backgroundColor = .systemPink
    }
}

enum StrKeyboardType {
    case time, number
}

protocol StrKeyboardViewDelegate: AnyObject {
    
}

class StrKeyboard: UIView {
    
    static let verticalSpacing: CGFloat = 10.0
    static let horizontalSpacing: CGFloat = 10.0
    
    static let height: CGFloat = (StrKeyboardButton.height * CGFloat(StrKeyboard.rows)) + (StrKeyboard.horizontalSpacing * (CGFloat(StrKeyboard.rows + 1)))
    
    private static let rows: Int = 4
    private static let columns: Int = 3
    
    private lazy var oneButton: StrKeyboardButton = {
        let button = StrKeyboardButton(value: "1")
        button.addTarget(self, action: #selector(oneButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private lazy var twoButton: StrKeyboardButton = {
        let button = StrKeyboardButton(value: "2")
        button.addTarget(self, action: #selector(twoButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private lazy var threeButton: StrKeyboardButton = {
        let button = StrKeyboardButton(value: "3")
        button.addTarget(self, action: #selector(threeButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private lazy var fourButton: StrKeyboardButton = {
        let button = StrKeyboardButton(value: "4")
        button.addTarget(self, action: #selector(fourButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private lazy var fiveButton: StrKeyboardButton = {
        let button = StrKeyboardButton(value: "5")
        button.addTarget(self, action: #selector(fiveButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private lazy var sixButton: StrKeyboardButton = {
        let button = StrKeyboardButton(value: "6")
        button.addTarget(self, action: #selector(sixButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private lazy var sevenButton: StrKeyboardButton = {
        let button = StrKeyboardButton(value: "7")
        button.addTarget(self, action: #selector(sevenButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private lazy var eightButton: StrKeyboardButton = {
        let button = StrKeyboardButton(value: "8")
        button.addTarget(self, action: #selector(eightButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private lazy var nineButton: StrKeyboardButton = {
        let button = StrKeyboardButton(value: "9")
        button.addTarget(self, action: #selector(nineButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private lazy var specialButton: StrKeyboardButton = {
        let button = StrKeyboardButton(value: ":")
        button.addTarget(self, action: #selector(nineButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private lazy var zeroButton: StrKeyboardButton = {
        let button = StrKeyboardButton(value: "0")
        button.addTarget(self, action: #selector(nineButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    private lazy var backButton: StrKeyboardBackButton = {
        let button = StrKeyboardBackButton()
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var delegate: StrKeyboardViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
        
    private func setupSubviews() {
        
        let buttonWidth = (UIScreen.main.bounds.width - (CGFloat(StrKeyboard.columns + 1) * StrKeyboard.horizontalSpacing)) / CGFloat(StrKeyboard.columns)
        
        addSubview(oneButton)
        addSubview(twoButton)
        addSubview(threeButton)
        addSubview(fourButton)
        addSubview(fiveButton)
        addSubview(sixButton)
        addSubview(sevenButton)
        addSubview(eightButton)
        addSubview(nineButton)
        addSubview(specialButton)
        addSubview(zeroButton)
        addSubview(backButton)
        
        NSLayoutConstraint.activate([
            // center column
            twoButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            twoButton.topAnchor.constraint(equalTo: topAnchor, constant: StrKeyboard.verticalSpacing),
            twoButton.heightAnchor.constraint(equalToConstant: StrKeyboardButton.height),
            twoButton.widthAnchor.constraint(equalToConstant: buttonWidth),
            
            fiveButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            fiveButton.topAnchor.constraint(equalTo: twoButton.bottomAnchor, constant: StrKeyboard.verticalSpacing),
            fiveButton.heightAnchor.constraint(equalToConstant: StrKeyboardButton.height),
            fiveButton.widthAnchor.constraint(equalToConstant: buttonWidth),
            
            eightButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            eightButton.topAnchor.constraint(equalTo: fiveButton.bottomAnchor, constant: StrKeyboard.verticalSpacing),
            eightButton.heightAnchor.constraint(equalToConstant: StrKeyboardButton.height),
            eightButton.widthAnchor.constraint(equalToConstant: buttonWidth),
            
            zeroButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            zeroButton.topAnchor.constraint(equalTo: eightButton.bottomAnchor, constant: StrKeyboard.verticalSpacing),
            zeroButton.heightAnchor.constraint(equalToConstant: StrKeyboardButton.height),
            zeroButton.widthAnchor.constraint(equalToConstant: buttonWidth),

            // left column
            oneButton.trailingAnchor.constraint(equalTo: twoButton.leadingAnchor, constant: -StrKeyboard.horizontalSpacing),
            oneButton.topAnchor.constraint(equalTo: topAnchor, constant: StrKeyboard.verticalSpacing),
            oneButton.heightAnchor.constraint(equalToConstant: StrKeyboardButton.height),
            oneButton.widthAnchor.constraint(equalToConstant: buttonWidth),

            fourButton.trailingAnchor.constraint(equalTo: fiveButton.leadingAnchor, constant: -StrKeyboard.horizontalSpacing),
            fourButton.topAnchor.constraint(equalTo: oneButton.bottomAnchor, constant: StrKeyboard.verticalSpacing),
            fourButton.heightAnchor.constraint(equalToConstant: StrKeyboardButton.height),
            fourButton.widthAnchor.constraint(equalToConstant: buttonWidth),

            sevenButton.trailingAnchor.constraint(equalTo: eightButton.leadingAnchor, constant: -StrKeyboard.horizontalSpacing),
            sevenButton.topAnchor.constraint(equalTo: fourButton.bottomAnchor, constant: StrKeyboard.verticalSpacing),
            sevenButton.heightAnchor.constraint(equalToConstant: StrKeyboardButton.height),
            sevenButton.widthAnchor.constraint(equalToConstant: buttonWidth),
            
            specialButton.trailingAnchor.constraint(equalTo: zeroButton.leadingAnchor, constant: -StrKeyboard.horizontalSpacing),
            specialButton.topAnchor.constraint(equalTo: sevenButton.bottomAnchor, constant: StrKeyboard.verticalSpacing),
            specialButton.heightAnchor.constraint(equalToConstant: StrKeyboardButton.height),
            specialButton.widthAnchor.constraint(equalToConstant: buttonWidth),

            // right column
            threeButton.leadingAnchor.constraint(equalTo: twoButton.trailingAnchor, constant: StrKeyboard.horizontalSpacing),
            threeButton.topAnchor.constraint(equalTo: topAnchor, constant: StrKeyboard.verticalSpacing),
            threeButton.heightAnchor.constraint(equalToConstant: StrKeyboardButton.height),
            threeButton.widthAnchor.constraint(equalToConstant: buttonWidth),

            sixButton.leadingAnchor.constraint(equalTo: fiveButton.trailingAnchor, constant: StrKeyboard.horizontalSpacing),
            sixButton.topAnchor.constraint(equalTo: threeButton.bottomAnchor, constant: StrKeyboard.verticalSpacing),
            sixButton.heightAnchor.constraint(equalToConstant: StrKeyboardButton.height),
            sixButton.widthAnchor.constraint(equalToConstant: buttonWidth),

            nineButton.leadingAnchor.constraint(equalTo: eightButton.trailingAnchor, constant: StrKeyboard.horizontalSpacing),
            nineButton.topAnchor.constraint(equalTo: sixButton.bottomAnchor, constant: StrKeyboard.verticalSpacing),
            nineButton.heightAnchor.constraint(equalToConstant: StrKeyboardButton.height),
            nineButton.widthAnchor.constraint(equalToConstant: buttonWidth),
            
            backButton.leadingAnchor.constraint(equalTo: zeroButton.trailingAnchor, constant: StrKeyboard.horizontalSpacing),
            backButton.topAnchor.constraint(equalTo: nineButton.bottomAnchor, constant: StrKeyboard.verticalSpacing),
            backButton.heightAnchor.constraint(equalToConstant: StrKeyboardButton.height),
            backButton.widthAnchor.constraint(equalToConstant: buttonWidth),
        ])
    }
    
    @objc private func oneButtonTapped(_ sender: Any) { }
    @objc private func twoButtonTapped(_ sender: Any) { }
    @objc private func threeButtonTapped(_ sender: Any) { }
    @objc private func fourButtonTapped(_ sender: Any) { }
    @objc private func fiveButtonTapped(_ sender: Any) { }
    @objc private func sixButtonTapped(_ sender: Any) { }
    @objc private func sevenButtonTapped(_ sender: Any) { }
    @objc private func eightButtonTapped(_ sender: Any) { }
    @objc private func nineButtonTapped(_ sender: Any) { }
    @objc private func specialButtonTapped(_ sender: Any) { }
    @objc private func zeroButtonTapped(_ sender: Any) { }
    @objc private func backButtonTapped(_ sender: Any) { }

    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }

}

