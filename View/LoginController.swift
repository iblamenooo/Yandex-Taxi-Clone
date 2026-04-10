//
//  LoginController.swift
//  Yandex Taxi Clone
//
//  Created by Nurtore on 06.04.2026.
//

import UIKit
import Firebase

class LoginController:UIViewController {
    private let label:UILabel = {
        let label = UILabel()
        label.text = "Yandex Taxi"
        label.textColor = UIColor(white: 1, alpha: 0.8)
        
        return label
    }()
    
    private lazy var emailContainerView:UIView = {
        let view = UIView().containterInputView(image: #imageLiteral(resourceName: "ic_mail_outline_white_2x"), textField: emailTextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private lazy var passwordContainerView:UIView = {
        let view = UIView().containterInputView(image: #imageLiteral(resourceName: "ic_lock_outline_white_2x"), textField: passwordTextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private let emailTextField:UITextField = {
        let tf = UITextField()
        return tf.textField(withPlaceholder: "Email", isSecureTextEntry: false)
    }
    
    private let passwordTextField:UITextField = {
        let tf = UITextField()
        return tf.textField(withPlaceholder: "Password", isSecureTextEntry: true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
