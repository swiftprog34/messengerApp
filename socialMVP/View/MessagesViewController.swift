//
//  MessagesViewController.swift
//  socialMVP
//
//  Created by Виталий Емельянов on 14.11.2021.
//

import UIKit

class MessagesViewController: UIViewController {
    let workingFlow: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray5
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(workingFlow)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        workingFlow.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        workingFlow.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        workingFlow.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        workingFlow.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor).isActive = true
    }
}
