//
//  ShowsView.swift
//  jobsity-challenge
//
//  Created by Marco Braga on 09/01/21.
//

import UIKit
import PKHUD

final class ShowsView: CodedView {

    // MARK: - Layout Components

    private let searchBar: UISearchBar = {
        let searchBar = UISearchBar(frame: CGRect(x: .zero,
                                                  y: .zero,
                                                  width: UIScreen.main.bounds.width,
                                                  height: 50))
        searchBar.showsCancelButton = true
        return searchBar
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        setupUI(for: tableView)
        registerCells(for: tableView)
        return tableView
    }()

    private lazy var emptyView: ShowsEmptyView = {
        let view = ShowsEmptyView(onTappedReloadButtonClosure: onTappedReloadButtonClosure)
        return view
    }()

    private lazy var errorView: ShowsErrorView = {
        let view = ShowsErrorView(onTappedReloadButtonClosure: onTappedReloadButtonClosure)
        return view
    }()

    // MARK: - Private Properties

    private var onTappedReloadButtonClosure: () -> Void

    // MARK: - Initialization

    init(
        tableViewDataSource: UITableViewDataSource,
        tableViewDelegate: UITableViewDelegate,
        searchBarDelegate: UISearchBarDelegate,
        onTappedReloadButtonClosure: @escaping () -> Void
    ) {
        self.onTappedReloadButtonClosure = onTappedReloadButtonClosure
        super.init(frame: .zero)
        backgroundColor = Asset.Colors.white.color
        emptyView.isHidden = true
        errorView.isHidden = true
        tableView.dataSource = tableViewDataSource
        tableView.delegate = tableViewDelegate
        searchBar.delegate = searchBarDelegate
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods

    private func setupUI(for tableView: UITableView) {
        tableView.backgroundColor = Asset.Colors.white.color
        tableView.estimatedRowHeight = 132
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.separatorColor = .none
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedSectionFooterHeight = .zero
        tableView.sectionFooterHeight = .zero
        tableView.isHidden = false
        tableView.keyboardDismissMode = .onDrag
    }

    private func registerCells(for tableView: UITableView) {
        tableView.register(ShowCell.self, forCellReuseIdentifier: ShowCell.className)
    }

    // MARK: - View Setup

    override func addSubviews() {
        addSubview(tableView)
        addSubview(emptyView)
        addSubview(errorView)
        tableView.tableHeaderView = searchBar
    }

    override func constrainSubviews() {
        constrainTableView()
        constrainEmptyView()
        constrainErrorView()
    }

    private func constrainTableView() {
        tableView.fillSuperview()
    }

    private func constrainEmptyView() {
        emptyView.anchor(top: searchBar.bottomAnchor,
                         left: leftAnchor,
                         bottom: bottomAnchor,
                         right: rightAnchor)
    }

    private func constrainErrorView() {
        errorView.anchor(top: searchBar.bottomAnchor,
                         left: leftAnchor,
                         bottom: bottomAnchor,
                         right: rightAnchor)
    }

    // MARK: - Public methods

    func reloadTableView() {
        tableView.reloadData()
    }

    func startLoading() {
        HUD.show(.progress)
    }

    func stopLoading() {
        HUD.hide()
    }

    func emptyView(isHidden: Bool, isSearching: Bool = false) {
        emptyView.isHidden = isHidden
        emptyView.setupUI(isSearching)
    }

    func errorView(isHidden: Bool) {
        errorView.isHidden = isHidden
    }
}
