//
//  SignUpViewController.swift
//  PhinconAttendance
//
//  Created by Dimas Wisodewo on 07/07/23.
//

import UIKit

class SignUpViewController: UIViewController {

    static let identifier = "SignUpViewController"
    
    @IBOutlet weak var loginButton: UIButton! {
        didSet {
            loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        }
    }
    
    @IBOutlet weak var registerButton: UIButton! {
        didSet {
            registerButton.layer.cornerRadius = 5
            setEnableRegisterButton(isEnable: false)
            registerButton.addTarget(self, action: #selector(registerButtonPressed), for: .touchUpInside)
        }
    }
    
    @IBOutlet weak var usernameTextField: UITextField! {
        didSet {
            usernameTextField.autocorrectionType = .no
            usernameTextField.autocapitalizationType = .none
            usernameTextField.addTarget(self, action: #selector(usernameTextFieldValidation), for: .editingChanged)
        }
    }
    
    @IBOutlet weak var fullnameTextField: UITextField! {
        didSet {
            fullnameTextField.autocorrectionType = .no
            fullnameTextField.autocapitalizationType = .none
            fullnameTextField.addTarget(self, action: #selector(fullnameTextFieldValidation), for: .editingChanged)
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
    
    @IBOutlet weak var repeatPasswordTextField: UITextField! {
        didSet {
            repeatPasswordTextField.autocorrectionType = .no
            repeatPasswordTextField.autocapitalizationType = .none
            repeatPasswordTextField.isSecureTextEntry = true
            repeatPasswordTextField.addTarget(self, action: #selector(repeatPasswordTextFieldValidation), for: .editingChanged)
        }
    }
    
    @IBOutlet var viewContainer: UIView! {
        didSet {
            viewContainer.roundCorners(corners: [.topLeft, .topRight], radius: 20)
        }
    }
    
    
    private var isUsernameEmpty = true
    private var isFullnameEmpty = true
    private var isPasswordEmpty = true
    private var isRepeatPasswordEmpty = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @objc private func registerButtonPressed() {
        print("Register success")
    }
    
    @objc private func loginButtonPressed() {
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: LoginViewController.identifier) else { return }
        
        changeRootController(vc: vc)
    }
    
    @objc private func usernameTextFieldValidation() {
        
        isUsernameEmpty = !usernameTextField.hasText
        
        if !isUsernameEmpty, !isFullnameEmpty, !isPasswordEmpty, !isRepeatPasswordEmpty {
            setEnableRegisterButton(isEnable: true)
        } else {
            setEnableRegisterButton(isEnable: false)
        }
    }
    
    @objc private func fullnameTextFieldValidation() {
        
        isFullnameEmpty = !fullnameTextField.hasText
        
        if !isUsernameEmpty, !isFullnameEmpty, !isPasswordEmpty, !isRepeatPasswordEmpty {
            setEnableRegisterButton(isEnable: true)
        } else {
            setEnableRegisterButton(isEnable: false)
        }
    }
    
    @objc private func passwordTextFieldValidation() {
        
        isPasswordEmpty = !passwordTextField.hasText
        
        if !isUsernameEmpty, !isFullnameEmpty, !isPasswordEmpty, !isRepeatPasswordEmpty {
            setEnableRegisterButton(isEnable: true)
        } else {
            setEnableRegisterButton(isEnable: false)
        }
    }
    
    @objc private func repeatPasswordTextFieldValidation() {
        
        isRepeatPasswordEmpty = !repeatPasswordTextField.hasText
        
        if !isUsernameEmpty, !isFullnameEmpty, !isPasswordEmpty, !isRepeatPasswordEmpty {
            setEnableRegisterButton(isEnable: true)
        } else {
            setEnableRegisterButton(isEnable: false)
        }
    }
    
    private func setEnableRegisterButton(isEnable: Bool) {
        
        let colorName = isEnable ? ColorUtils.shared.primaryYellow : ColorUtils.shared.primaryGrey
        
        registerButton.isEnabled = isEnable
        registerButton.backgroundColor = UIColor(named: colorName)
    }
    
    private func changeRootController(vc: UIViewController) {
        
        let wrappedVC = UINavigationController(rootViewController: vc)
        
        view.window?.windowScene?.keyWindow?.rootViewController = wrappedVC
    }
}
