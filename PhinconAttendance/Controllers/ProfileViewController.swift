//
//  ProfileViewController.swift
//  PhinconAttendance
//
//  Created by Dimas Wisodewo on 07/07/23.
//

import UIKit

class ProfileViewController: UIViewController {

    static let identifier = "ProfileViewController"
    
    @IBOutlet weak var backgroundViewContainer: UIView! {
        didSet {
            backgroundViewContainer.roundCorners(corners: [.bottomRight], radius: 60)
        }
    }
    
    @IBOutlet weak var viewContainer: UIView! {
        didSet {
            viewContainer.roundCorners(corners: [.topLeft, .topRight, .bottomLeft, .bottomRight], radius: 20)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
