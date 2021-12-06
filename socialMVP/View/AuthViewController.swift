//
//  AuthViewController.swift
//  socialMVP
//
//  Created by Виталий Емельянов on 06.11.2021.
//

import UIKit

class AuthViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: Make UI elements
    private var nameTextField: UITextField = {
        let nameTextField = UITextField()
        let placeholderAttr = NSAttributedString(string: "Enter your name", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 255, green: 255, blue: 255, alpha: 0.2)])
        nameTextField.attributedPlaceholder = placeholderAttr
        nameTextField.backgroundColor = .systemBlue
        nameTextField.textColor = .white
        nameTextField.font = UIFont.systemFont(ofSize: 15)
        nameTextField.borderStyle = UITextField.BorderStyle.roundedRect
        nameTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        return nameTextField
    }()
    
    private var passwordTextField: UITextField = {
        let passwordTextField = UITextField()
        let placeholderAttr = NSAttributedString(string: "Enter your password", attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 255, green: 255, blue: 255, alpha: 0.2)])
        passwordTextField.attributedPlaceholder = placeholderAttr
        passwordTextField.font = UIFont.systemFont(ofSize: 15)
        passwordTextField.borderStyle = UITextField.BorderStyle.roundedRect
        passwordTextField.backgroundColor = .systemBlue
        passwordTextField.textColor = .white
        passwordTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        passwordTextField.isSecureTextEntry = true
        return passwordTextField
    }()
    
    private var loginButton: UIButton = {
        let loginButton = UIButton(type: .roundedRect)
        loginButton.setTitle("Login", for: .normal)
        loginButton.backgroundColor = .systemGreen
        loginButton.tintColor = .white
        loginButton.layer.cornerRadius = 5.0
        return loginButton
    }()
    
    private var registerButton: UIButton = {
        let registerButton = UIButton(type: .roundedRect)
        registerButton.setTitle("Register", for: .normal)
        registerButton.backgroundColor = .systemBlue
        registerButton.tintColor = .white
        registerButton.layer.cornerRadius = 5.0
        return registerButton
    }()
    
    private var iconImageView: UIImageView = {
        let iconImage = UIImage(named: "plane")
        let iconImageView = UIImageView()
        iconImageView.image = iconImage
        iconImageView.contentMode = UIView.ContentMode.scaleAspectFill
        iconImageView.clipsToBounds = true
        return iconImageView
    }()
    
    private var loginTitleText: UILabel = {
        let loginTitleText = UILabel()
        loginTitleText.text = "Social App"
        loginTitleText.font = UIFont.systemFont(ofSize: 20, weight: .black)
        loginTitleText.numberOfLines = 0
        loginTitleText.textAlignment = .center
        loginTitleText.lineBreakMode = .byWordWrapping
        loginTitleText.textColor = .white
        return loginTitleText
    }()
    
    private var stackTitleAndLogoView = UIStackView()
    
    //MARK: default code
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        addUIElementsToView()
        
        loginButton.addTarget(self, action: #selector(loginButtonDidPressed), for: .touchUpInside)
    }
    
    //MARK: TODO ADD MVP
    @objc func loginButtonDidPressed() {
//        let appTabBar = UITabBarController()

        
//        let customVC = UIViewController()
//        customVC.tabBarItem = UITabBarItem(title: "Log out", image: UIImage(systemName: "square.and.arrow.up.circle"), tag: 4)
//
//        appTabBar.viewControllers = [
//            createNavController(for: ProfileViewController(), title: NSLocalizedString("Profile", comment: ""), image: UIImage(systemName: "person.circle")!),
//            createNavController(for: UsersViewController(), title: NSLocalizedString("Users", comment: ""), image: UIImage(systemName: "person.2.circle")!),
//            createNavController(for: MessagesViewController(), title: NSLocalizedString("Messages", comment: ""), image: UIImage(systemName: "message.circle")!),
//            customVC
//        ]
        
//        appTabBar.modalPresentationStyle = .fullScreen
//        present(appTabBar, animated: true, completion: nil)
        present(TabBarViewController(), animated: true, completion: nil)
//        appTabBar.tabBar.backgroundColor = .systemBackground
    }
    
//    func createNavController(for rootViewController: UIViewController,
//                                                      title: String,
//                                                      image: UIImage) -> UIViewController {
//        let navController = UINavigationController(rootViewController: rootViewController)
//        navController.tabBarItem.title = title
//        navController.tabBarItem.image = image
//        navController.navigationBar.prefersLargeTitles = true
//        navController.navigationBar.backgroundColor = .systemBackground
//        rootViewController.navigationItem.title = title
//        return navController
//    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        configureAnchorsOfSubviews()
    }
    
    
    //MARK: Configure UI elements
    func addUIElementsToView() {
        
        stackTitleAndLogoView = UIStackView()
        stackTitleAndLogoView.axis = .horizontal
        stackTitleAndLogoView.distribution = .equalSpacing
        
        stackTitleAndLogoView.addArrangedSubview(loginTitleText)
        stackTitleAndLogoView.addArrangedSubview(iconImageView)
        stackTitleAndLogoView.backgroundColor = .systemGreen
        stackTitleAndLogoView.layer.cornerRadius = 8
        stackTitleAndLogoView.isLayoutMarginsRelativeArrangement = true
        stackTitleAndLogoView.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        
        view.addSubview(stackTitleAndLogoView)
        view.addSubview(nameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(registerButton)
        
        if let backgroundImage = UIImage(named: "plane-background") {
            let backgroundImageView = UIImageView(frame: view.bounds)
            backgroundImageView.image = backgroundImage
            backgroundImageView.contentMode = UIView.ContentMode.scaleAspectFill
            view.insertSubview(backgroundImageView, at: 0)
        } else {
            view.backgroundColor = .cyan
        }
    }
    
    //Mark: Configure anchors
    func configureAnchorsOfSubviews() {
        
        stackTitleAndLogoView.translatesAutoresizingMaskIntoConstraints = false
        stackTitleAndLogoView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackTitleAndLogoView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.bounds.height / 9).isActive = true
        stackTitleAndLogoView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        
        loginTitleText.translatesAutoresizingMaskIntoConstraints = false
        loginTitleText.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.3).isActive = true
        
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        iconImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
        nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameTextField.topAnchor.constraint(equalTo: stackTitleAndLogoView.bottomAnchor, constant: view.bounds.height / 14).isActive = true
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 16).isActive = true
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true

        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: view.bounds.height / 2.5).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4).isActive = true
        
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 16).isActive = true
        registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registerButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4).isActive = true
        
    }
    
}
