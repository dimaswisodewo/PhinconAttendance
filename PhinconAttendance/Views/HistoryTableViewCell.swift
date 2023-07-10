//
//  HistoryTableViewCell.swift
//  PhinconAttendance
//
//  Created by Dimas Wisodewo on 07/07/23.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    static let identifier = "HistoryTableViewCell"
    
    private let posterImageContainerView: UIView = {
        let view = UIView(frame: CGRect(x: .zero, y: .zero, width: 90, height: 120))
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titlePosterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .gray.withAlphaComponent(0.3)
        imageView.tintColor = UIColor(named: ColorUtils.shared.primaryBlue)
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 3
        label.lineBreakMode = .byTruncatingTail
        label.textColor = UIColor.black
        label.font = Helper.shared.getCustomFont(customFont: .Avenir, size: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.lineBreakMode = .byWordWrapping
        label.textColor = UIColor(named: ColorUtils.shared.primaryGrey)
        label.font = Helper.shared.getCustomFont(customFont: .Avenir, size: 14, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var model: HistoryModel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(posterImageContainerView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        
        applyConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        posterImageContainerView.addSubview(titlePosterImageView)
        
        applySubviewsConstraint()
        
        posterImageContainerView.roundCorners(corners: .allCorners, radius: 20)
    }
    
    private func applyConstraints() {
        
        let titlePosterImageContainerViewConstraints = [
            posterImageContainerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            posterImageContainerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            posterImageContainerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            posterImageContainerView.widthAnchor.constraint(equalToConstant: contentView.bounds.width / 3)
        ]
        
        let titleLabelConstraints = [
            titleLabel.leadingAnchor.constraint(equalTo: posterImageContainerView.trailingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor, constant: -15)
        ]
        
        let subtitleLabelConstraints = [
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10)
        ]
                
        NSLayoutConstraint.activate(titlePosterImageContainerViewConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(subtitleLabelConstraints)
    }
    
    private func applySubviewsConstraint() {
        
        titlePosterImageView.frame = posterImageContainerView.bounds
    }
    
    public func configure(with model: HistoryModel) {
        
        self.model = model
        
        titleLabel.text = model.title
        subtitleLabel.text = model.subtitle
        configureImageView()
    }
    
    func configureImageView() {
        guard let model = self.model else { return }
        titlePosterImageView.loadAndCache(url: model.imageUrl, cache: nil, placeholder: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }

}
