//
//  CallListViewController.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import UIKit
import RxSwift
import RxDataSources
import Reusable

final class CallListViewController: UITableViewController {

	// MARK: - IBOutlet

	@IBOutlet var resetBarButtonItem: UIBarButtonItem!

	// MARK: - Properties

	/// ActivityList view model.
	private let viewModel: CallListViewModel

	/// RxSwift dispose bag.
	private let disposeBag = DisposeBag()

	typealias CallOrdered = RxTableViewSectionedAnimatedDataSource<AnimatableSectionModel<String, CDCall>>
	var dataSource = CallOrdered(configureCell: { _, tableView, indexPath, call in
		let cell: CallListTableViewCell = tableView.dequeueReusableCell(for: indexPath)
		Configurator.update(cell, with: call)
		return cell
	})

	/**

	`CallListViewController` custom initializer.

	- Parameters:
	  - viewModel: The view model populating the view controller.

	*/
	init(viewModel: CallListViewModel) {
		self.viewModel = viewModel
		super.init(
			nibName: "CallListViewController",
			bundle: nil
		)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) is not supported")
	}

	// MARK: - Lifecycle

	override func viewDidLoad() {
		super.viewDidLoad()
		title = Localized.title
		definesPresentationContext = true
		tableView.tableFooterView = UIView()
		tableView.rowHeight = UITableView.automaticDimension
		tableView.estimatedRowHeight = 44
		tableView.tintColor = Color.background
		tableView.refreshControl = ACRefreshControl()
		tableView.register(cellType: CallListTableViewCell.self)
		tableView.dataSource = nil
		view.backgroundColor = Color.background
		navigationItem.setRightBarButton(resetBarButtonItem, animated: false)
		setupRxSwift()
	}

	override func viewWillAppear(
		_ animated: Bool
		) {
		super.viewWillAppear(animated)
		viewModel.update()
	}

}

// MARK: - RxSwift

extension CallListViewController {

	/// Configure RxSwift
	func setupRxSwift() {

		// Setup ViewModel.Output
		let output = viewModel.setup(from:
			CallListViewModel.Input(
				refresh: tableView.refreshControl!.rx.controlEvent(.valueChanged).asObservable(),
				reset: resetBarButtonItem.rx.tap.asObservable(),
				select: tableView.rx.modelSelected(CDCall.self).asObservable()
			)
		)

		// Bind data source with table view.
		output.dataSource
			.bind(to: tableView.rx.items(dataSource: dataSource))
			.disposed(by: disposeBag)

		// Bind refresh control
		if let refreshControl = tableView.refreshControl {
			output.isLoading
				.drive(onNext: { isLoading in
					DispatchQueue.main.async {
						refreshControl.refreshing(isLoading)
					}
				}).disposed(by: disposeBag)
		}

	}

}
