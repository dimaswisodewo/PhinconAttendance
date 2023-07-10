//
//  HomeCollectionViewCell.swift
//  PhinconAttendance
//
//  Created by Dimas Wisodewo on 10/07/23.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "HomeCollectionViewCell"
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .gray.withAlphaComponent(0.3)
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private var model: HistoryModel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
    }
    
    override func layoutSubviews() {
        imageView.frame = contentView.bounds
        imageView.roundCorners(corners: .allCorners, radius: 20)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(_ model: HistoryModel) {
        self.model = model
    }
    
    func configureImageView() {
        
        guard let model = model else { return }
        imageView.loadAndCache(url: model.imageUrl, cache: nil, placeholder: nil)
    }
}
