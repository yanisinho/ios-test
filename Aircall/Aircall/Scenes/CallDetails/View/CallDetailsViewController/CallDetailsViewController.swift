//
//  CallDetailsViewController.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import UIKit
import RxSwift

final class CallDetailsViewController: UIViewController, CallDisplayable {

	// MARK: - IBOutlet

	@IBOutlet weak var archiveBarButtonItem: UIBarButtonItem!
	@IBOutlet weak var directionImageView: UIImageView!
	@IBOutlet weak var archivedImageView: UIImageView!

	// MARK: CallDisplayable

	@IBOutlet weak var typeImageView: UIImageView!
	@IBOutlet weak var fromLabel: ACTitleLabel!
	@IBOutlet weak var toLabel: ACSubtitleLabel!
	@IBOutlet weak var createAtLabel: ACSubtitleLabel!

	// MARK: - Properties
	weak var coordinator: CallDetailsCoordinator?
	private let viewModel: CallDetailsViewModel
	private let disposeBag = DisposeBag()

	// MARK: - Initialization

	init(viewModel: CallDetailsViewModel) {
		self.viewModel = viewModel
		super.init(
			nibName: "CallDetailsViewController",
			bundle: nil
		)
	}

	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) is not supported")
	}

	// MARK: - Lifecycle

	override func viewDidLoad() {
		super.viewDidLoad()
		navigationItem.setRightBarButton(archiveBarButtonItem, animated: false)
		setupRxSwift()
	}

	override func viewWillAppear(
		_ animated: Bool
		) {
		super.viewWillAppear(animated)
		viewModel.defaut()
		viewModel.update()
	}

}

// MARK: - RxSwift

extension CallDetailsViewController {

	/// Configure RxSwift.
	func setupRxSwift() {
	
	}

}
