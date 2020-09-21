//
//  CalendarSelectorView.swift
//  WorkoutLog
//
//  Created by Alec Barton on 9/7/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import UIKit

enum CalendarType {
    case yearly, monthly, weekly
}

protocol CalendarSelectorViewDelegate {
    func changeActiveCalendar(to type: CalendarType)
}

class CalendarSelectorView: UIView {
    private static let buttonHeight: CGFloat = 30.0
    
    private lazy var yearlyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Yearly", for: .normal)
        button.backgroundColor = .lightGray
        button.addTarget(self, action: #selector(yearlyButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var monthlyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Monthly", for: .normal)
        button.backgroundColor = .gray
        button.addTarget(self, action: #selector(monthlyButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var weeklyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Weekly", for: .normal)
        button.backgroundColor = .lightGray
        button.addTarget(self, action: #selector(weeklyButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var heightConstraint: NSLayoutConstraint = self.heightAnchor.constraint(equalToConstant: CalendarSelectorView.buttonHeight)
    
    private lazy var yearlyCenterYConstraint: NSLayoutConstraint = self.yearlyButton.centerYAnchor.constraint(equalTo: self.centerYAnchor)
    private lazy var monthlyCenterYConstraint: NSLayoutConstraint = self.monthlyButton.centerYAnchor.constraint(equalTo: self.centerYAnchor)
    private lazy var weeklyCenterYConstraint: NSLayoutConstraint = self.weeklyButton.centerYAnchor.constraint(equalTo: self.centerYAnchor)
    
    var delegate: CalendarSelectorViewDelegate?
    var activeType: CalendarType = .monthly
    var isOpen: Bool = false {
        didSet {
            heightConstraint.constant = isOpen ? (CalendarSelectorView.buttonHeight * 3) : CalendarSelectorView.buttonHeight
            
            if isOpen {
                yearlyCenterYConstraint.isActive = false
                monthlyCenterYConstraint.isActive = true
                weeklyCenterYConstraint.isActive = false
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        setupSubviews()
    }
    
    private func setup() {
        self.clipsToBounds = true
        self.layer.cornerRadius = 10.0
    }
    
    private func setupSubviews() {
        addSubview(yearlyButton)
        addSubview(monthlyButton)
        addSubview(weeklyButton)
        
        NSLayoutConstraint.activate([
            heightConstraint,

            yearlyButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            yearlyButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            yearlyButton.heightAnchor.constraint(equalToConstant: CalendarSelectorView.buttonHeight),
            yearlyButton.bottomAnchor.constraint(equalTo: monthlyButton.topAnchor),

            monthlyButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            monthlyButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            monthlyButton.heightAnchor.constraint(equalToConstant: CalendarSelectorView.buttonHeight),

            weeklyButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            weeklyButton.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            weeklyButton.topAnchor.constraint(equalTo: monthlyButton.bottomAnchor),
            weeklyButton.heightAnchor.constraint(equalToConstant: CalendarSelectorView.buttonHeight),
        ])
        
        monthlyCenterYConstraint.isActive = true
    }
    
    private func setActiveType( _ type: CalendarType) {
        //TODO: This might be worth refactoring
        activeType = type
        
        switch type {
        case .yearly:
            yearlyButton.backgroundColor = .gray
            yearlyCenterYConstraint.isActive = true
            
            monthlyButton.backgroundColor = .lightGray
            weeklyButton.backgroundColor = .lightGray
            monthlyCenterYConstraint.isActive = false
            weeklyCenterYConstraint.isActive = false
        case .monthly:
            monthlyButton.backgroundColor = .gray
            monthlyCenterYConstraint.isActive = true
            
            yearlyButton.backgroundColor = .lightGray
            weeklyButton.backgroundColor = .lightGray
            yearlyCenterYConstraint.isActive = false
            weeklyCenterYConstraint.isActive = false
        case .weekly:
            weeklyButton.backgroundColor = .gray
            weeklyCenterYConstraint.isActive = true
            
            yearlyButton.backgroundColor = .lightGray
            monthlyButton.backgroundColor = .lightGray
            yearlyCenterYConstraint.isActive = false
            monthlyCenterYConstraint.isActive = false
        }
        isOpen = false
        delegate?.changeActiveCalendar(to: type)
    }
    
    @objc private func yearlyButtonTapped() {
        if isOpen {
            print("yearly")
            setActiveType(.yearly)
        } else {
            isOpen = true
        }
    }
    
    @objc private func monthlyButtonTapped() {
        if isOpen {
            print("monthly")
            setActiveType(.monthly)
        } else {
            isOpen = true
        }
    }
    
    @objc private func weeklyButtonTapped() {
        if isOpen {
            print("weekly")
            setActiveType(.weekly)
        } else {
            isOpen = true
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
