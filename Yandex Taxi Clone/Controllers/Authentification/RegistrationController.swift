//
//  RegistrationController.swift
//  Yandex Taxi Clone
//
//  Created by Nurtore on 21.04.2026.
//

import UIKit
import Firebase
import FirebaseAuth
import GeoFire


class RegistrationController:UIViewController {
    
    private var location = LocationHandler.shared.locationManager.location!
    
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
    
    private lazy var fullnameContainerView:UIView = {
        let view = UIView().containterInputView(image:#imageLiteral(resourceName: "ic_person_outline_white_2x"), textField: fullnameTextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private lazy var passwordContainerView:UIView = {
        let view = UIView().containterInputView(image: #imageLiteral(resourceName: "ic_lock_outline_white_2x"), textField: passwordTextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private lazy var accountTypeContainerView:UIView = {
        let view = UIView().containterInputView(image: #imageLiteral(resourceName: "ic_lock_outline_white_2x"), textField: passwordTextField)
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        return view
    }()
    
    private let emailTextField:UITextField = {
        let tf = UITextField()
        return tf.textField(withPlaceholder: "Email", isSecureTextEntry: false)
    }()
    
    private let fullnameTextField:UITextField = {
        let tf = UITextField()
        return tf.textField(withPlaceholder: "Full name", isSecureTextEntry: true)
    }()
    
    private let passwordTextField:UITextField = {
        let tf = UITextField()
        return tf.textField(withPlaceholder: "Password", isSecureTextEntry: true)
    }()
    
    private let accountTypeSegmentedControl: UISegmentedControl = {
        let sc = UISegmentedControl(items: ["Driver", "Rider"])
        sc.backgroundColor = .backgroundColor
        sc.tintColor = UIColor(white:1, alpha:0.87)
        sc.selectedSegmentIndex = 0
        return sc
    }()
    
    private lazy var signUpButton : AuthButton = {
        let button = AuthButton(type:.system)
        button.setTitle("Sign Up", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(handleShowSignUp), for: .touchUpInside)
        return button
    }()
    
    private lazy var alreadyHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        let attributedTitle = NSMutableAttributedString(string:"Already have an account? ", attributes:[NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        attributedTitle.append(NSAttributedString(string: "Log In", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 16), NSAttributedString.Key.foregroundColor: UIColor.mainBlueTint]))
        button.addTarget(self, action: #selector(handleShowLogin), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @objc func handleShowSignUp() {
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        guard let fullname = fullnameTextField.text else { return }
        let accountTypeIndex = accountTypeSegmentedControl.selectedSegmentIndex
        
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            let values = ["email":email,
                          "fullname":fullname,
                          "accountType":accountTypeIndex] as [String : Any]
            guard let uid = result?.user.uid else { return }
            
            if accountTypeIndex == 1 {
                let geofire = GeoFire(firebaseRef:REF_DRIVER_LOCATIONS)
                let location = self.location
                
                geofire.setLocation(location, forKey: uid) { error in
                    self.uploadUserDataAndShowHC(uid: uid, values: values)
                }
            }
            self.uploadUserDataAndShowHC(uid: uid, values: values)
        }
    }
    @objc func handleShowLogin() {
        navigationController?.popViewController(animated: true)
    }
    
    
    func uploadUserDataAndShowHC(uid: String, values: [String: Any]) {
            REF_USERS.child(uid).updateChildValues(values, withCompletionBlock: { error, ref in
                guard let controller = UIApplication.shared.keyWindow?.rootViewController as? ViewController else { return }
                controller.configure()
                self.dismiss(animated: true, completion: nil)
            })
        }
    
    func configureUI() {
        view.backgroundColor = .backgroundColor
        
        view.addSubview(mainLabel)
        
        mainLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor)
        mainLabel.centerX(inView: view)
                
        let stack = UIStackView(arrangedSubviews: [emailContainerView,
                                                        fullnameContainerView,
                                                        passwordContainerView,
                                                        accountTypeContainerView,
                                                        signUpButton])
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 24
                
        view.addSubview(stack)
        stack.anchor(top: mainLabel.bottomAnchor, left: view.leftAnchor,
                        right: view.rightAnchor, paddingTop: 40, paddingLeft: 16, paddingRight: 16)
                
        view.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.centerX(inView: view)
        alreadyHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 16, height: 32)
    }
    
}
