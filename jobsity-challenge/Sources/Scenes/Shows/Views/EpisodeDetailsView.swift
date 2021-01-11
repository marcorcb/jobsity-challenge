//
//  EpisodeDetailsView.swift
//  jobsity-challenge
//
//  Created by Marco Braga on 10/01/21.
//

import UIKit

final class EpisodeDetailsView: CodedView {

    // MARK: - Layout Components

    private let episodeImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    private let episodeNumberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(font: FontFamily.Gilroy.extraBold, size: 18)
        label.textColor = Asset.Colors.black.color
        label.numberOfLines = .zero
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

    private let episodeSummaryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(font: FontFamily.SFProText.regular, size: 12)
        label.textColor = Asset.Colors.black.color
        label.numberOfLines = .zero
        return label
    }()

    // MARK: - Private Properties

    private var episode: Shows.EpisodesData.ViewData.Episode

    // MARK: - Initialization

    init(episode: Shows.EpisodesData.ViewData.Episode) {
        self.episode = episode
        super.init(frame: .zero)
        backgroundColor = Asset.Colors.white.color
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods

    private func setupUI() {
        let season = String(format: "%02d", episode.season)
        let number = String(format: "%02d", episode.number)
        episodeNumberLabel.text = "S\(season) | E\(number)"
        episodeNameLabel.text = episode.name
        episodeSummaryLabel.text = episode.summary?.htmlToString
        if let originalImage = episode.image?.original, let imageURL = URL(string: originalImage) {
            episodeImageView.kf.indicatorType = .activity
            episodeImageView.kf.setImage(with: imageURL)
        } else {
            episodeImageView.image = Asset.Images.placeholder.image
        }
    }

    // MARK: - View Setup

    override func addSubviews() {
        addSubview(episodeImageView)
        addSubview(episodeNumberLabel)
        addSubview(episodeNameLabel)
        addSubview(episodeSummaryLabel)
    }

    override func constrainSubviews() {
        constrainEpisodeImageView()
        constrainEpisodeNumberLabel()
        constrainEpisodeNameLabel()
        constrainShowSummaryLabel()
    }

    func constrainEpisodeImageView() {
        episodeImageView.anchor(top: safeTopAnchor,
                                left: leftAnchor,
                                right: rightAnchor,
                                widthConstant: 200,
                                heightConstant: 200)
    }

    func constrainEpisodeNumberLabel() {
        episodeNumberLabel.anchor(top: episodeImageView.bottomAnchor,
                                  left: leftAnchor,
                                  right: rightAnchor,
                                  topConstant: 12,
                                  leftConstant: 12,
                                  rightConstant: 12)
    }

    func constrainEpisodeNameLabel() {
        episodeNameLabel.anchor(top: episodeNumberLabel.bottomAnchor,
                                left: leftAnchor,
                                right: rightAnchor,
                                topConstant: 4,
                                leftConstant: 12,
                                rightConstant: 12)
    }

    func constrainShowSummaryLabel() {
        episodeSummaryLabel.anchor(top: episodeNameLabel.bottomAnchor,
                                   left: leftAnchor,
                                   right: rightAnchor,
                                   topConstant: 8,
                                   leftConstant: 12,
                                   rightConstant: 12)
    }
}
