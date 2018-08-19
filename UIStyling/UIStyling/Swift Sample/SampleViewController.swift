//
//  ViewController.swift
//  UIStyling
//
//  Created by ShengHua Wu on 19.08.18.
//  Copyright © 2018 ShengHua Wu. All rights reserved.
//

import UIKit

final class SampleViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let titleLabel = UILabel()
        titleLabel.text = "Styling Sample"
        titleLabel |> titleLabelStyle
        view.addSubview(titleLabel)
        view.addConstraints([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 32),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        
        let subtitleLabel = UILabel()
        subtitleLabel.text = """
        Through secure mobile payment, conichi saves time and enables fast check-­in/-out. conichi allows hotels to cleverly upsell and directly communicate with guests through push-notifications. Prior to arrival, shared guest preferences and profiles enhance personal interaction. conichi has been developed to work with virtually any hotel’s property management system, enabling simple implementation for both independent hotel properties and chains.
        """
        subtitleLabel |> subtitleLabelStyle
        view.addSubview(subtitleLabel)
        view.addConstraints([
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
            ])
        
        let actionButton = UIButton(type: .system)
        actionButton.setTitle("Do Something", for: .normal)
        actionButton |> actionRoundedButtonStyle
        view.addSubview(actionButton)
        view.addConstraints([
            actionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32),
            actionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            actionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
            ])
    }
}
