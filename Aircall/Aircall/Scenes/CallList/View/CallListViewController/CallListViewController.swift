//
//  CallListViewController.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import UIKit
import RxSwift

final class CallListViewController: UITableViewController {

	// MARK: - IBOutlet

	@IBOutlet var resetBarButtonItem: UIBarButtonItem!

	// MARK: - Properties

	/// RxSwift dispose bag.
	private let disposeBag = DisposeBag()

	// MARK: - Lifecycle

	override func viewDidLoad() {
		super.viewDidLoad()

	}

}
