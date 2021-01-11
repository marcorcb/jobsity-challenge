//
//  ShowDetailsView.swift
//  jobsity-challenge
//
//  Created by Marco Braga on 09/01/21.
//

import UIKit
import PKHUD

final class ShowDetailsView: CodedView {

    // MARK: - Layout Components

    private lazy var headerView: ShowDetailsHeaderView = {
        let view = ShowDetailsHeaderView(show: show)
        return view
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        setupUI(for: tableView)
        registerCells(for: tableView)
        return tableView
    }()

    // MARK: - Private Properties

    private var show: Shows.ShowsData.ViewData.Show

    // MARK: - Initialization

    init(
        tableViewDataSource: UITableViewDataSource,
        tableViewDelegate: UITableViewDelegate,
        show: Shows.ShowsData.ViewData.Show
    ) {
        self.show = show
        super.init(frame: .zero)
        backgroundColor = Asset.Colors.white.color
        tableView.dataSource = tableViewDataSource
        tableView.delegate = tableViewDelegate
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private methods

    private func setupUI(for tableView: UITableView) {
        tableView.backgroundColor = Asset.Colors.white.color
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.separatorColor = .none
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedSectionFooterHeight = .zero
        tableView.sectionFooterHeight = .zero
        tableView.isHidden = false
    }

    private func registerCells(for tableView: UITableView) {
        tableView.register(EpisodeCell.self, forCellReuseIdentifier: EpisodeCell.className)
    }

    // MARK: - Public methods

    func reloadTableView() {
        tableView.reloadData()
    }

    func setupHeaderViewHeightWhenLoaded() {
        tableView.beginUpdates()
        tableView.updateHeaderViewHeight()
        tableView.endUpdates()
    }

    func setupHeaderViewHeight() {
        tableView.updateHeaderViewHeight()
    }

    func startLoading() {
        HUD.show(.progress)
    }

    func stopLoading() {
        HUD.hide()
    }

    // MARK: - View Setup

    override func addSubviews() {
        addSubview(tableView)
        tableView.tableHeaderView = headerView
    }

    override func constrainSubviews() {
        constrainTableView()
    }

    private func constrainTableView() {
        tableView.anchor(top: topAnchor,
                         left: leftAnchor,
                         bottom: bottomAnchor,
                         right: rightAnchor)
    }
}
