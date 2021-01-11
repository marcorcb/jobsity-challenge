//
//  SeasonExpandableView.swift
//  jobsity-challenge
//
//  Created by Marco Braga on 10/01/21.
//

import UIKit
import Kingfisher

struct SeasonExpandableViewData {
    let season: Int
    let episodeCount: Int
}

final class SeasonExpandableView: CodedView {

    // MARK: - Layout Components

    private lazy var contentView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.layer.borderWidth = 2
        view.layer.borderColor = Asset.Colors.lightGray.color.cgColor
        view.addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                         action: #selector(didTapContentView)))
        return view
    }()

    private let seasonLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(font: FontFamily.SFProText.regular, size: 14)
        label.textColor = Asset.Colors.black.color
        return label
    }()

    private let arrowImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    private let episodesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(font: FontFamily.SFProText.regular, size: 14)
        label.textColor = Asset.Colors.black.color
        return label
    }()

    // MARK: - Private Properties

    private var viewData: SeasonExpandableViewData
    private var onTappedExapandableViewClosure: (Int) -> Void

    // MARK: - Initialization

    init(viewData: SeasonExpandableViewData,
         onTappedExapandableViewClosure: @escaping (Int) -> Void,
         isExpanded: Bool) {
        self.viewData = viewData
        self.onTappedExapandableViewClosure = onTappedExapandableViewClosure
        super.init(frame: .zero)
        backgroundColor = Asset.Colors.white.color
        setupUI(isExpanded)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods

    private func setupUI(_ isExpanded: Bool) {
        seasonLabel.text = L10n.Show.season(viewData.season)
        episodesLabel.text = L10n.Show.episodes(viewData.episodeCount)
        if isExpanded {
            arrowImageView.image = Asset.Images.iconUp.image.withTintColor(Asset.Colors.black.color,
                                                                           renderingMode: .automatic)
        } else {
            arrowImageView.image = Asset.Images.iconDown.image.withTintColor(Asset.Colors.black.color,
                                                                             renderingMode: .automatic)
        }
    }

    @objc private func didTapContentView() {
        onTappedExapandableViewClosure(viewData.season)
    }

    // MARK: - View Setup

    override func addSubviews() {
        addSubview(contentView)
        contentView.addSubview(seasonLabel)
        contentView.addSubview(episodesLabel)
        contentView.addSubview(arrowImageView)
    }

    override func constrainSubviews() {
        constrainContentView()
        constrainSeasonLabel()
        constrainEpisodesLabel()
        constrainArrowImageView()
    }

    private func constrainContentView() {
        contentView.anchor(top: topAnchor,
                           left: leftAnchor,
                           bottom: bottomAnchor,
                           right: rightAnchor,
                           topConstant: 10,
                           leftConstant: 10,
                           bottomConstant: 10,
                           rightConstant: 10)
    }

    private func constrainSeasonLabel() {
        seasonLabel.anchor(top: contentView.topAnchor,
                           left: contentView.leftAnchor,
                           bottom: contentView.bottomAnchor,
                           topConstant: 12,
                           leftConstant: 10,
                           bottomConstant: 12)
    }

    private func constrainEpisodesLabel() {
        episodesLabel.anchor(right: contentView.rightAnchor,
                             rightConstant: 10)
        episodesLabel.centerYAnchor.constraint(equalTo: seasonLabel.centerYAnchor).isActive = true
    }

    private func constrainArrowImageView() {
        arrowImageView.anchor(right: episodesLabel.leftAnchor,
                              rightConstant: 12,
                              widthConstant: 15,
                              heightConstant: 15)
        arrowImageView.centerYAnchor.constraint(equalTo: episodesLabel.centerYAnchor).isActive = true
    }
}
