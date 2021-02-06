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
    //Case 1: Interval or Time
    //Case 2: Add Weight or Remove Weight
    
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
        addSubview(keyboard)
        
        NSLayoutConstraint.activate([
            keyboard.leadingAnchor.constraint(equalTo: leadingAnchor),
            keyboard.trailingAnchor.constraint(equalTo: trailingAnchor),
            keyboard.bottomAnchor.constraint(equalTo: bottomAnchor),
            keyboard.topAnchor.constraint(equalTo: centerYAnchor),
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
            tempView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tempView.topAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}


