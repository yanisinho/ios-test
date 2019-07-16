//
//  CallDetailsViewController.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import UIKit

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

	override func viewDidLoad() {
		super.viewDidLoad()

	}

}
