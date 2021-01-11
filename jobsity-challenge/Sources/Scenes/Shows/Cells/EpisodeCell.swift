//
//  EpisodeCell.swift
//  jobsity-challenge
//
//  Created by Marco Braga on 10/01/21.
//

import UIKit
import Kingfisher

final class EpisodeCell: CodedTableViewCell {

    // MARK: - Layout Components

    private let contentBackgroundView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(displayP3Red: 241/250, green: 242/250, blue: 244/250, alpha: 1).cgColor
        view.clipsToBounds = true
        return view
    }()

    private let episodeImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    private let episodeNumberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(font: FontFamily.Gilroy.extraBold, size: 18)
        label.textColor = Asset.Colors.black.color
        label.numberOfLines = .zero
        //        label.adjustsFontSizeToFitWidth = true
        return label
    }()

    private let episodeNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(font: FontFamily.SFProText.medium, size: 14)
        label.textColor = Asset.Colors.lightGray.color
        label.numberOfLines = .zero
        label.lineBreakMode = .byTruncatingTail
        return label
    }()

    // MARK: - Private Properties

    private var episode: Shows.EpisodesData.ViewData.Episode?

    // MARK: - Initialization

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor =  Asset.Colors.white.color
        selectionStyle = .none
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods

    private func setupUI() {
        guard let episode = episode else { return }
        let season = String(format: "%02d", episode.season)
        let number = String(format: "%02d", episode.number)
        episodeNumberLabel.text = "S\(season) | E\(number)"
        episodeNameLabel.text = episode.name
        if let mediumImage = episode.image?.medium, let imageURL = URL(string: mediumImage) {
            episodeImageView.kf.indicatorType = .activity
            episodeImageView.kf.setImage(with: imageURL)
        } else {
            episodeImageView.image = Asset.Images.placeholder.image
        }
    }

    // MARK: - Public methods

    func setup(episode: Shows.EpisodesData.ViewData.Episode?) {
        self.episode = episode
        setupUI()
    }

    func cancelDownload() {
        episodeImageView.kf.cancelDownloadTask()
    }

    // MARK: - View Setup

    override func addSubviews() {
        addSubview(contentBackgroundView)
        contentBackgroundView.addSubview(episodeImageView)
        contentBackgroundView.addSubview(episodeNumberLabel)
        contentBackgroundView.addSubview(episodeNameLabel)
    }

    override func constrainSubviews() {
        constrainContentBackgroundView()
        constrainEpisodeImageView()
        constrainEpisodeNumberLabel()
        constrainEpisodeNameLabel()
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

    private func constrainEpisodeImageView() {
        episodeImageView.anchor(top: contentBackgroundView.topAnchor,
                                left: contentBackgroundView.leftAnchor,
                                bottom: contentBackgroundView.bottomAnchor,
                                widthConstant: 90,
                                heightConstant: 90)
    }

    private func constrainEpisodeNumberLabel() {
        episodeNumberLabel.anchor(left: episodeImageView.rightAnchor,
                                  right: contentBackgroundView.rightAnchor,
                                  leftConstant: 12,
                                  rightConstant: 8)
        episodeNumberLabel.centerYAnchor.constraint(
            equalTo: episodeImageView.centerYAnchor
        ).isActive = true
    }

    private func constrainEpisodeNameLabel() {
        episodeNameLabel.anchor(top: episodeNumberLabel.bottomAnchor,
                                left: episodeImageView.rightAnchor,
                                right: contentBackgroundView.rightAnchor,
                                topConstant: 2,
                                leftConstant: 12,
                                rightConstant: 8)
    }
}
