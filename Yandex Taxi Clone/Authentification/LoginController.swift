//
//  LoginController.swift
//  Yandex Taxi Clone
//
//  Created by Nurtore on 06.04.2026.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginController:UIViewController {
    private let mainLabel:UILabel = {
        let label = UILabel()
        label.text = "Yandex Taxi"
        label.textColor = UIColor(white: 1, alpha: 0.8)
        
        return label
    }()
    
    private lazy var emailContainerView:UIView = {
        let view = UIView().containterInputView(image: #imageLiteral(resourceName: "ic_mail_outline_white_2x"), textField: emailTextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private lazy var passwordContainerView:UIView = {
        let view = UIView().containterInputView(image: #imageLiteral(resourceName: "ic_lock_outline_white_2x"), textField: passwordTextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private let emailTextField:UITextField = {
        let tf = UITextField()
        return tf.textField(withPlaceholder: "Email", isSecureTextEntry: false)
    }()
    
    private let passwordTextField:UITextField = {
        let tf = UITextField()
        return tf.textField(withPlaceholder: "Password", isSecureTextEntry: true)
    }()
    
    private lazy var loginButton:UIButton = {
        let button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()
    
    private lazy var dontHaveAccountButton:UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string: "Don't have an account?  ", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
                
        attributedTitle.append(NSAttributedString(string: "Sign Up", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.mainBlueTint]))
                
        button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
                
        button.setAttributedTitle(attributedTitle, for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func handleLogin() {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error  = error {
                print("Failed to log in with error \(error.localizedDescription)")
                return
            }
            guard let controller = UIApplication.shared.keyWindow?.rootViewController as? ViewController else { return }
            controller.configure()
            self.dismiss(animated: true, completion:nil)
        }
    }
    
    @objc func handleShowSignUp() {
        let signUpController = RegistrationController()
        navigationController?.pushViewController(signUpController, animated: true)
    }
    
    func configureNavigationBar() {
        navigationController?.isNavigationBarHidden = true
        navigationController?.navigationBar.barStyle = .black
    }
    
    func configureUI() {
        configureNavigationBar()
        
        view.backgroundColor = .backgroundColor
        
        view.addSubview(mainLabel)
        mainLabel.anchor(top:view.safeAreaLayoutGuide.topAnchor)
        mainLabel.centerX(inView:view)
        
        let stack = UIStackView(arrangedSubviews: [emailContainerView,passwordContainerView,loginButton])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 24
        
        view.addSubview(stack)
        stack.anchor(top: mainLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 40, paddingLeft: 16,paddingRight: 16)
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.anchor(bottom:view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 16, height:32)
    }
    
}
