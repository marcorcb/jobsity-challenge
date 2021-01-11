//
//  ShowDetailsHeaderView.swift
//  jobsity-challenge
//
//  Created by Marco Braga on 10/01/21.
//

import UIKit

final class ShowDetailsHeaderView: CodedView {

    // MARK: - Layout Components

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
        return label
    }()

    private let scheduleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(font: FontFamily.SFProText.regular, size: 12)
        label.textColor = Asset.Colors.black.color
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = .zero
        return label
    }()

    private let genresLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(font: FontFamily.SFProText.regular, size: 12)
        label.textColor = Asset.Colors.black.color
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = .zero
        return label
    }()

    // MARK: - Private Properties

    private var show: Shows.ShowsData.ViewData.Show

    // MARK: - Initialization

    init(
        show: Shows.ShowsData.ViewData.Show
    ) {
        self.show = show
        super.init(frame: .zero)
        backgroundColor = Asset.Colors.white.color
        setupUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods

    func setupUI() {
        setupScheduleText()
        setupGenresText()
        showNameLabel.text = show.name
        showSummaryLabel.text = show.summary?.htmlToString
        if let originalImage = show.image?.original, let imageURL = URL(string: originalImage) {
            showImageView.kf.indicatorType = .activity
            showImageView.kf.setImage(with: imageURL)
        } else {
            showImageView.image = Asset.Images.placeholder.image
        }
    }

    private func setupScheduleText() {
        var scheduleText = "Schedule: "
        for day in show.schedule.days {
            scheduleText.append(day.rawValue + "s,")
        }

        scheduleText.removeLast()

        if !show.schedule.time.isEmpty {
            scheduleText.append(" at \(show.schedule.time)")
        }

        scheduleLabel.text = scheduleText
    }

    private func setupGenresText() {
        var genresText = "Genres: "
        genresText.append(show.genres.joined(separator: ", "))
        genresLabel.text = genresText
    }

    // MARK: - Public methods

    // MARK: - View Setup

    override func addSubviews() {
        addSubview(showImageView)
        addSubview(showNameLabel)
        addSubview(showSummaryLabel)
        addSubview(scheduleLabel)
        addSubview(genresLabel)
    }

    override func constrainSubviews() {
        constrainShowImageView()
        constrainShowNameLabel()
        constrainShowSummaryLabel()
        constrainScheduleLabel()
        constrainGenresLabel()
    }

    private func constrainShowImageView() {
        showImageView.anchor(top: topAnchor,
                             left: leftAnchor,
                             leftConstant: 10,
                             widthConstant: 150,
                             heightConstant: 220)
    }

    private func constrainShowNameLabel() {
        showNameLabel.anchor(top: showImageView.topAnchor,
                             left: showImageView.rightAnchor,
                             right: rightAnchor,
                             leftConstant: 12,
                             rightConstant: 12)
        showNameLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
    }

    private func constrainShowSummaryLabel() {
        showSummaryLabel.anchor(top: showNameLabel.bottomAnchor,
                                left: showImageView.rightAnchor,
                                bottom: bottomAnchor,
                                right: rightAnchor,
                                topConstant: 2,
                                leftConstant: 12,
                                bottomConstant: 10,
                                rightConstant: 12)
    }

    private func constrainScheduleLabel() {
        scheduleLabel.anchor(top: showImageView.bottomAnchor,
                             left: showImageView.leftAnchor,
                             right: showImageView.rightAnchor,
                             topConstant: 10)
    }

    private func constrainGenresLabel() {
        genresLabel.anchor(top: scheduleLabel.bottomAnchor,
                           left: showImageView.leftAnchor,
                           bottom: bottomAnchor,
                           right: showImageView.rightAnchor,
                           topConstant: 4,
                           bottomConstant: 10)
    }
}
