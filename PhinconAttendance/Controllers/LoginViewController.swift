//
//  LoginViewController.swift
//  PhinconAttendance
//
//  Created by Dimas Wisodewo on 07/07/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    static let identifier = "LoginViewController"
    
    private var isUsernameEmpty = true
    private var isPasswordEmpty = true
    
    @IBOutlet weak var usernameTextField: UITextField! {
        didSet {
            usernameTextField.autocorrectionType = .no
            usernameTextField.autocapitalizationType = .none
            usernameTextField.addTarget(self, action: #selector(usernameTextFieldValidation), for: .editingChanged)
        }
    }
    
    @IBOutlet weak var passwordTextField: UITextField! {
        didSet {
            passwordTextField.autocorrectionType = .no
            passwordTextField.autocapitalizationType = .none
            passwordTextField.isSecureTextEntry = true
            passwordTextField.addTarget(self, action: #selector(passwordTextFieldValidation), for: .editingChanged)
        }
    }
    
    @IBOutlet weak var loginButton: UIButton! {
        didSet {
            loginButton.layer.cornerRadius = 5
            loginButton.addTarget(self, action: #selector(loginInButtonPressed), for: .touchUpInside)
            
            setEnableLoginButton(isEnable: false)
        }
    }
    
    @IBOutlet weak var registerButton: UIButton! {
        didSet {
            registerButton.addTarget(self, action: #selector(registerButtonPressed), for: .touchUpInside)
        }
    }
    
    @IBOutlet weak var forgotPassword: UIButton! {
        didSet {
            forgotPassword.addTarget(self, action: #selector(forgotPasswordButtonPressed), for: .touchUpInside)
        }
    }
    
    @IBOutlet weak var viewContainer: UIView! {
        didSet {
            viewContainer.roundCorners(corners: [.topLeft, .topRight], radius: 20)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavBar()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
        navigationController?.navigationBar.tintColor = .white
    }
    
    private func configureNavBar() {
        navigationItem.backButtonTitle = ""
    }
    
    @objc private func usernameTextFieldValidation() {
        
        isUsernameEmpty = !usernameTextField.hasText
        
        if !isUsernameEmpty, !isPasswordEmpty {
            setEnableLoginButton(isEnable: true)
        } else {
            setEnableLoginButton(isEnable: false)
        }
    }
    
    @objc private func passwordTextFieldValidation() {
        
        isPasswordEmpty = !passwordTextField.hasText
        
        if !isUsernameEmpty, !isPasswordEmpty {
            setEnableLoginButton(isEnable: true)
        } else {
            setEnableLoginButton(isEnable: false)
        }
    }
    
    @objc private func loginInButtonPressed() {
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: MainTabBarViewController.identifier) else { return }
        
        navigationItem.backButtonTitle = "Log Out"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func registerButtonPressed() {
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: SignUpViewController.identifier) else { return }
        
        changeRootController(vc: vc)
    }
    
    @objc private func forgotPasswordButtonPressed() {
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: ForgotPasswordViewController.identifier) else { return }
        
        navigationItem.backButtonTitle = ""
        navigationController?.pushViewController(vc, animated: true)
    }
        
    private func setEnableLoginButton(isEnable: Bool) {
        
        let colorName = isEnable ? ColorUtils.shared.primaryYellow : ColorUtils.shared.primaryGrey
        
        loginButton.isEnabled = isEnable
        loginButton.backgroundColor = UIColor(named: colorName)
    }
    
    private func changeRootController(vc: UIViewController) {
        
        let wrappedVC = UINavigationController(rootViewController: vc)
        
        view.window?.windowScene?.keyWindow?.rootViewController = wrappedVC
    }
}
