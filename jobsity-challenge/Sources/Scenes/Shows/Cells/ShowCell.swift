//
//  ShowCell.swift
//  jobsity-challenge
//
//  Created by Marco Braga on 09/01/21.
//

import UIKit
import Kingfisher

final class ShowCell: CodedTableViewCell {

    // MARK: - Layout Components

    private let contentBackgroundView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 2
        view.layer.borderColor = Asset.Colors.lightGray.color.cgColor
        view.clipsToBounds = true
        return view
    }()

    private let showImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    private let showNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(font: FontFamily.Gilroy.extraBold, size: 18)
        label.textColor = Asset.Colors.black.color
        label.numberOfLines = .zero
        return label
    }()

    private let showSummaryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(font: FontFamily.SFProText.regular, size: 12)
        label.textColor = Asset.Colors.black.color
        label.numberOfLines = .zero
        label.lineBreakMode = .byTruncatingTail
        return label
    }()

    // MARK: - Private Properties

    private var show: Shows.ShowsData.ViewData.Show?

    // MARK: - Initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = Asset.Colors.white.color
        selectionStyle = .none
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods

    private func setupUI() {
        guard let show = show else { return }
        showNameLabel.text = show.name
        showSummaryLabel.text = show.summary?.htmlToString
        if let mediumImage = show.image?.medium, let imageURL = URL(string: mediumImage) {
            showImageView.kf.indicatorType = .activity
            showImageView.kf.setImage(with: imageURL)
        } else {
            showImageView.image = Asset.Images.placeholder.image
        }
    }

    // MARK: - Public methods

    func setup(show: Shows.ShowsData.ViewData.Show) {
        self.show = show
        setupUI()
    }

    func cancelDownload() {
        showImageView.kf.cancelDownloadTask()
    }

    // MARK: - View Setup

    override func addSubviews() {
        addSubview(contentBackgroundView)
        contentBackgroundView.addSubview(showImageView)
        contentBackgroundView.addSubview(showNameLabel)
        contentBackgroundView.addSubview(showSummaryLabel)
    }

    override func constrainSubviews() {
        constrainContentBackgroundView()
        constrainShowImageView()
        constrainShowNameLabel()
        constrainShowSummaryLabel()
    }

    private func constrainContentBackgroundView() {
        contentBackgroundView.anchor(top: topAnchor,
                                     left: leftAnchor,
                                     bottom: bottomAnchor,
                                     right: rightAnchor,
                                     topConstant: 10,
                                     leftConstant: 20,
                                     rightConstant: 20)
    }

    private func constrainShowImageView() {
        showImageView.anchor(top: contentBackgroundView.topAnchor,
                             left: contentBackgroundView.leftAnchor,
                             bottom: contentBackgroundView.bottomAnchor,
                             widthConstant: 100,
                             heightConstant: 120)
    }

    private func constrainShowNameLabel() {
        showNameLabel.anchor(top: showImageView.topAnchor,
                             left: showImageView.rightAnchor,
                             right: contentBackgroundView.rightAnchor,
                             topConstant: 8,
                             leftConstant: 12,
                             rightConstant: 12)
    }

    private func constrainShowSummaryLabel() {
        showSummaryLabel.anchor(top: showNameLabel.bottomAnchor,
                                left: showImageView.rightAnchor,
                                bottom: contentBackgroundView.bottomAnchor,
                                right: contentBackgroundView.rightAnchor,
                                topConstant: 2,
                                leftConstant: 12,
                                bottomConstant: 14,
                                rightConstant: 12)
    }
}
