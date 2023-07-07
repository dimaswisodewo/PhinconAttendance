//
//  ForgotPasswordViewController.swift
//  PhinconAttendance
//
//  Created by Dimas Wisodewo on 07/07/23.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    static let identifier = "ForgotPasswordViewController"
    
    @IBOutlet weak var ktpTextField: UITextField! {
        didSet {
            ktpTextField.autocorrectionType = .no
            ktpTextField.keyboardType = .numberPad
            ktpTextField.delegate = self
            ktpTextField.addTarget(self, action: #selector(ktpTextFieldValidation), for: .editingChanged)
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
    
    @IBOutlet weak var resetPasswordButton: UIButton! {
        didSet {
            resetPasswordButton.layer.cornerRadius = 5
            setEnableResetPasswordButton(isEnable: false)
            resetPasswordButton.addTarget(self, action: #selector(resetPasswordButtonPressed), for: .touchUpInside)
        }
    }
    
    @IBOutlet weak var loginButton: UIButton! {
        didSet {
            loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        }
    }
    
    @IBOutlet weak var viewContainer: UIView! {
        didSet {
            viewContainer.roundCorners(corners: [.topLeft, .topRight], radius: 20)
        }
    }
    
    
    private var isKtpEmpty = true
    private var isPasswordEmpty = true
    private var isRepeatPasswordEmpty = true
    
    private var isKtpDigitValid = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @objc private func ktpTextFieldValidation() {
        
        isKtpEmpty = !ktpTextField.hasText
        
        if !isKtpEmpty, !isPasswordEmpty, !isRepeatPasswordEmpty {
            setEnableResetPasswordButton(isEnable: true)
        } else {
            setEnableResetPasswordButton(isEnable: false)
        }
    }
    
    @objc private func passwordTextFieldValidation() {
        
        isPasswordEmpty = !passwordTextField.hasText
        
        if !isKtpEmpty, !isPasswordEmpty, !isRepeatPasswordEmpty {
            setEnableResetPasswordButton(isEnable: true)
        } else {
            setEnableResetPasswordButton(isEnable: false)
        }
    }
    
    @objc private func repeatPasswordTextFieldValidation() {
        
        isRepeatPasswordEmpty = !repeatPasswordTextField.hasText
        
        if !isKtpEmpty, !isPasswordEmpty, !isRepeatPasswordEmpty {
            setEnableResetPasswordButton(isEnable: true)
        } else {
            setEnableResetPasswordButton(isEnable: false)
        }
    }
    
    private func setEnableResetPasswordButton(isEnable: Bool) {
        
        let colorName = isEnable ? ColorUtils.shared.primaryYellow : ColorUtils.shared.primaryGrey
        
        resetPasswordButton.isEnabled = isEnable
        resetPasswordButton.backgroundColor = UIColor(named: colorName)
    }
    
    @objc private func resetPasswordButtonPressed() {
        
        guard let ktpValue = ktpTextField.text else { return }
        
        isKtpDigitValid = ktpValue.count == 16
        
        if isKtpDigitValid {
            print("Reset password success")
            navigationController?.popToRootViewController(animated: true)
        } else {
            print("KTP must contains 16 digit characters")
        }
    }
    
    @objc private func loginButtonPressed() {
        navigationController?.popToRootViewController(animated: true)
    }
}

extension ForgotPasswordViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == ktpTextField {

            // Remove last char if value count > 16
            if ktpTextField.hasText {
                
                let ktpValue = ktpTextField.text!
                
                if ktpValue.count > 16 {
                    ktpTextField.text = String(ktpValue.dropLast())
                }
            }
            
            let allowedCharacters = CharacterSet.decimalDigits
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet)
        } else {
            return true
        }
    }
}
