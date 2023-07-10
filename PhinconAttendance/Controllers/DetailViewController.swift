//
//  DetailViewController.swift
//  PhinconAttendance
//
//  Created by Dimas Wisodewo on 10/07/23.
//

import UIKit

class DetailViewController: UIViewController {

    static let identifier = "DetailViewController"
    
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.backgroundColor = UIColor.gray.withAlphaComponent(0.3)
            imageView.contentMode = .scaleAspectFill
        }
    }
    
    @IBOutlet weak var fullNameLabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    private var model: HistoryModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fullNameLabel.text = model?.title
        nameLabel.text = model?.subtitle
        
        configureImageView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    func configure(_ model: HistoryModel) {
        self.model = model
    }
    
    private func configureImageView() {
        
        guard let model = self.model else { return }
        
        guard let url = URL(string: model.imageUrl) else {
            print("URL is not valid")
            return
        }
        
        DispatchQueue.global().async { [weak self] in
            
            guard let data = try? Data(contentsOf: url) else {
                print("Error loading url data for: \(model.title)")
                return
            }
            
            if let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self?.imageView.image = image
                }
            }
        }
    }
}
