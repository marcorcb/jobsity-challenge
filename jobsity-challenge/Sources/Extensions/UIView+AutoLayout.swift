//
//  UIView+AutoLayout.swift
//  jobsity-challenge
//
//  Created by Marco Braga on 08/01/21.
//

import UIKit

extension UIView {
    /// Add anchors from any side of the current view into the specified anchors and
    /// returns the newly added constraints.
    ///
    /// - Parameters:
    ///   - top: current view's top anchor will be anchored into the specified anchor
    ///   - left: current view's left anchor will be anchored into the specified anchor
    ///   - bottom: current view's bottom anchor will be anchored into the specified anchor
    ///   - right: current view's right anchor will be anchored into the specified anchor
    ///   - topConstant: current view's top anchor margin
    ///   - leftConstant: current view's left anchor margin
    ///   - bottomConstant: current view's bottom anchor margin
    ///   - rightConstant: current view's right anchor margin
    ///   - widthConstant: current view's width
    ///   - heightConstant: current view's height
    /// - Returns: array of newly added constraints (if applicable).
    @discardableResult
    public func anchor(
        top: NSLayoutYAxisAnchor? = nil,
        left: NSLayoutXAxisAnchor? = nil,
        bottom: NSLayoutYAxisAnchor? = nil,
        right: NSLayoutXAxisAnchor? = nil,
        topConstant: CGFloat = 0,
        leftConstant: CGFloat = 0,
        bottomConstant: CGFloat = 0,
        rightConstant: CGFloat = 0,
        widthConstant: CGFloat = 0,
        heightConstant: CGFloat = 0
    ) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false

        var anchors = [NSLayoutConstraint]()

        if let top = top {
            anchors.append(topAnchor.constraint(equalTo: top, constant: topConstant))
        }

        if let left = left {
            anchors.append(leftAnchor.constraint(equalTo: left, constant: leftConstant))
        }

        if let bottom = bottom {
            anchors.append(bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant))
        }

        if let right = right {
            anchors.append(rightAnchor.constraint(equalTo: right, constant: -rightConstant))
        }

        if widthConstant > 0 {
            anchors.append(widthAnchor.constraint(equalToConstant: widthConstant))
        }

        if heightConstant > 0 {
            anchors.append(heightAnchor.constraint(equalToConstant: heightConstant))
        }

        anchors.forEach({ $0.isActive = true })

        return anchors
    }

    /// Add anchors from any side of the current view into the specified anchors and
    /// returns the newly added constraints.
    ///
    /// - Parameters:
    ///   - top: current view's top anchor will be anchored into the specified anchor
    ///   - leading: current view's leading anchor will be anchored into the specified anchor
    ///   - bottom: current view's bottom anchor will be anchored into the specified anchor
    ///   - trailing: current view's trailing anchor will be anchored into the specified anchor
    ///   - topConstant: current view's top anchor margin
    ///   - leftConstant: current view's left anchor margin
    ///   - bottomConstant: current view's bottom anchor margin
    ///   - rightConstant: current view's right anchor margin
    ///   - widthConstant: current view's width
    ///   - heightConstant: current view's height
    /// - Returns: array of newly added constraints (if applicable).
    @discardableResult
    public func anchor(
        top: NSLayoutYAxisAnchor? = nil,
        leading: NSLayoutXAxisAnchor,
        bottom: NSLayoutYAxisAnchor? = nil,
        trailing: NSLayoutXAxisAnchor,
        topConstant: CGFloat = 0,
        leadingConstant: CGFloat = 0,
        bottomConstant: CGFloat = 0,
        trailingConstant: CGFloat = 0,
        widthConstant: CGFloat = 0,
        heightConstant: CGFloat = 0
    ) -> [NSLayoutConstraint] {
        translatesAutoresizingMaskIntoConstraints = false

        var anchors = anchor(
            top: top,
            bottom: bottom,
            topConstant: topConstant,
            bottomConstant: bottomConstant,
            widthConstant: widthConstant,
            heightConstant: heightConstant
        )
        let leadingContraint = leadingAnchor.constraint(equalTo: leading, constant: leadingConstant)
        let traillingConstraint = trailingAnchor.constraint(equalTo: trailing, constant: -trailingConstant)
        anchors.append(leadingContraint)
        anchors.append(traillingConstraint)

        [leadingContraint, traillingConstraint].forEach({ $0.isActive = true })

        return anchors
    }

    /// makes the view to fill the entire superview.
    public func fillSuperview() {
        anchor(
            top: superview?.topAnchor,
            left: superview?.leftAnchor,
            bottom: superview?.bottomAnchor,
            right: superview?.rightAnchor
        )
    }

    /// Anchor center X into current view's superview with a constant margin value.
    ///
    /// - Parameter constant: constant of the anchor constraint (default is 0).
    public func anchorCenterXToSuperview(constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if let anchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        }
    }

    /// Anchor center Y into current view's superview with a constant margin value.
    ///
    /// - Parameter withConstant: constant of the anchor constraint (default is 0).
    public func anchorCenterYToSuperview(constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if let anchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        }
    }

    /// Anchor center X and Y into current view's superview
    public func anchorCenterSuperview() {
        anchorCenterXToSuperview()
        anchorCenterYToSuperview()
    }

    /// Returns the `safeAreaLayoutGuide.bottomAnchor`, if available,
    /// otherwhise, returns `bottomAnchor`
    public var safeBottomAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.bottomAnchor
        } else {
            return bottomAnchor
        }
    }

    /// Returns the `safeAreaLayoutGuide.topAnchor`, if available,
    /// otherwhise, returns `topAnchor`
    public var safeTopAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.topAnchor
        } else {
            return topAnchor
        }
    }

    /// Returns the `safeAreaLayoutGuide.trailingAnchor`, if available,
    /// otherwhise, returns `trailingAnchor`
    public var safeTrailingAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.trailingAnchor
        } else {
            return trailingAnchor
        }
    }

    /// Returns the `safeAreaLayoutGuide.leadingAnchor`, if available,
    /// otherwhise, returns `leadingAnchor`
    public var safeLeadingAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.leadingAnchor
        } else {
            return leadingAnchor
        }
    }

    /// Simplifies layouting with a constraint array
    /// - Parameter constraints: the constraints to apply to the view
    public func layout(using constraints: [NSLayoutConstraint]) {
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints)
    }
}
