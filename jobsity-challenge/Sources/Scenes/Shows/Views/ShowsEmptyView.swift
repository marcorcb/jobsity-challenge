//
//  ShowsEmptyView.swift
//  jobsity-challenge
//
//  Created by Marco Braga on 11/01/21.
//

import UIKit

final class ShowsEmptyView: CodedView {

    // MARK: - Layout Components

    private let emptyLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(font: FontFamily.Gilroy.extraBold, size: 18)
        label.textColor = Asset.Colors.black.color
        label.textAlignment = .center
        return label
    }()

    private lazy var reloadButton: UIButton = {
        let button = UIButton()
        button.setImage(Asset.Images.icReloadArrow.image, for: .normal)
        button.addTarget(self, action: #selector(didTapReloadButton), for: .touchUpInside)
        return button
    }()

    // MARK: - Private Properties

    private var onTappedReloadButtonClosure: () -> Void

    // MARK: - Initialization

    init(onTappedReloadButtonClosure: @escaping () -> Void) {
        self.onTappedReloadButtonClosure = onTappedReloadButtonClosure
        super.init(frame: .zero)
        backgroundColor = Asset.Colors.white.color
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods

    @objc private func didTapReloadButton() {
        onTappedReloadButtonClosure()
    }

    // MARK: - Public methods

    func setupUI(_ isSearching: Bool) {
        emptyLabel.text = isSearching ? L10n.Shows.emptySearch : L10n.Shows.emptyShows
        reloadButton.isHidden = isSearching
    }

    // MARK: - View Setup

    override func addSubviews() {
        addSubview(emptyLabel)
        addSubview(reloadButton)
    }

    override func constrainSubviews() {
        constrainEmptyLabel()
        constrainReloadButton()
    }

    private func constrainEmptyLabel() {
        emptyLabel.anchor(left: leftAnchor,
                          right: rightAnchor,
                          leftConstant: 12,
                          rightConstant: 12)
        emptyLabel.anchorCenterYToSuperview()
    }

    private func constrainReloadButton() {
        reloadButton.anchor(top: emptyLabel.bottomAnchor,
                            topConstant: 8,
                            widthConstant: 24,
                            heightConstant: 24)
        reloadButton.anchorCenterXToSuperview()
    }
}
