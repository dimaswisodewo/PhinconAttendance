//
//  ViewController.swift
//  PhinconAttendance
//
//  Created by Dimas Wisodewo on 07/07/23.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var loginButton: UIButton! {
        didSet {
            loginButton.layer.cornerRadius = 5
            loginButton.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        }
    }
    
    @IBOutlet weak var signUpButton: UIButton! {
        didSet {
            signUpButton.layer.cornerRadius = 5
            signUpButton.addTarget(self, action: #selector(signUpButtonPressed), for: .touchUpInside)
        }
    }
    
    @IBOutlet weak var viewContainer: UIView! {
        didSet {
            viewContainer.roundCorners(corners: [.topLeft, .topRight], radius: 20)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        overrideUserInterfaceStyle = .light
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }

    @objc private func loginButtonPressed() {
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: LoginViewController.identifier) else { return }
        
        changeRootController(vc: vc)
    }
    
    @objc private func signUpButtonPressed() {
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: SignUpViewController.identifier) else { return }
        
        changeRootController(vc: vc)
    }
        
    private func changeRootController(vc: UIViewController) {
        
        let wrappedVC = UINavigationController(rootViewController: vc)
        
        view.window?.windowScene?.keyWindow?.rootViewController = wrappedVC
    }
}

