//
//  ShowsErrorView.swift
//  jobsity-challenge
//
//  Created by Marco Braga on 11/01/21.
//

import UIKit

final class ShowsErrorView: CodedView {

    // MARK: - Layout Components

    private let errorLabel: UILabel = {
        let label = UILabel()
        label.text = L10n.Shows.error
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

    // MARK: - View Setup

    override func addSubviews() {
        addSubview(errorLabel)
        addSubview(reloadButton)
    }

    override func constrainSubviews() {
        constrainErrorLabel()
        constrainReloadButton()
    }

    private func constrainErrorLabel() {
        errorLabel.anchor(left: leftAnchor,
                          right: rightAnchor,
                          leftConstant: 12,
                          rightConstant: 12)
        errorLabel.anchorCenterYToSuperview()
    }

    private func constrainReloadButton() {
        reloadButton.anchor(top: errorLabel.bottomAnchor,
                            topConstant: 8,
                            widthConstant: 24,
                            heightConstant: 24)
        reloadButton.anchorCenterXToSuperview()
    }
}
