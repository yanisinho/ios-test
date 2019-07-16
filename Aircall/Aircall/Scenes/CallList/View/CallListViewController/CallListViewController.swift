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

	}

}
