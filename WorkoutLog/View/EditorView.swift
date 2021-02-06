//
//  EditorView.swift
//  WorkoutLog
//
//  Created by Alec Barton on 1/17/21.
//  Copyright © 2021 Alec Barton. All rights reserved.
//

import UIKit

//enum SetType {
//    case rep, weightedRep, timed, timedRep, timedWeight
//}

class EditorView: UIView {
    
    //OLD
    //Case 1: Rep or Time
    //Case 2: Add Weight or Remove Weight
    //How to handle Rep x Time ??
    
    //NEW
    //Input 1: Reps or Time
    //Input 2: Weight, Unweight, Time
    //  - If user selects Time + Time, change to (1:Time 2:Unweight)
    //5 possible types
    
    //TODO Input Type Switcher
    
    private lazy var repInputLabel: UILabel = {
        let label = UILabel()
        label.text = "500"
        label.backgroundColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var xLabel: UILabel = {
        let label = UILabel()
        label.text = "X"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private lazy var weightInputLabel: UILabel = {
        let label = UILabel()
        label.text = "1000 lbs"
        label.backgroundColor = .lightGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var keyboard: StrKeyboard = {
        let keyboard = StrKeyboard()
        keyboard.translatesAutoresizingMaskIntoConstraints = false
        return keyboard
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }
    
    private func setupSubviews() {
        addSubview(repInputLabel)
        addSubview(xLabel)
        addSubview(weightInputLabel)
        addSubview(keyboard)
        
        NSLayoutConstraint.activate([
            
            repInputLabel.trailingAnchor.constraint(equalTo: xLabel.leadingAnchor, constant: -20.0),
            repInputLabel.widthAnchor.constraint(equalToConstant: 120.0),
            repInputLabel.heightAnchor.constraint(equalToConstant: 44.0),
            repInputLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10.0),
            
            xLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            xLabel.widthAnchor.constraint(equalToConstant: 20.0),
            xLabel.heightAnchor.constraint(equalToConstant: 44.0),
            xLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10.0),
            
            weightInputLabel.leadingAnchor.constraint(equalTo: xLabel.trailingAnchor, constant: 20.0),
            weightInputLabel.widthAnchor.constraint(equalToConstant: 120.0),
            weightInputLabel.heightAnchor.constraint(equalToConstant: 44.0),
            weightInputLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10.0),
            
            keyboard.leadingAnchor.constraint(equalTo: leadingAnchor),
            keyboard.trailingAnchor.constraint(equalTo: trailingAnchor),
            keyboard.bottomAnchor.constraint(equalTo: bottomAnchor),
            keyboard.heightAnchor.constraint(equalToConstant: StrKeyboard.height),
        ])
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}

class EditorViewController: UIViewController {
    
    private lazy var tempView: EditorView = {
        let view = EditorView()
        view.backgroundColor = .gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .clear
        setup()
    }
    
    private func setup() {
        self.view.addSubview(tempView)
        
        NSLayoutConstraint.activate([
            tempView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tempView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tempView.bottomAnchor.constraint(equalTo: view.safeAreaBottomAnchor),
            tempView.topAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}


