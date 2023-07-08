//
//  MainTabBarViewController.swift
//  PhinconAttendance
//
//  Created by Dimas Wisodewo on 07/07/23.
//

import UIKit

class MainTabBarViewController: UITabBarController {
    
    static let identifier = "MainTabBarViewController"

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavBar()
    }

    private func configureNavBar() {
        navigationController?.navigationBar.tintColor = UIColor(named: ColorUtils.shared.primaryBlue)
    }
}
