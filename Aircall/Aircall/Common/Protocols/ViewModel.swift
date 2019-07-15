//
//  ViewModel.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import Foundation

/**

	Describes an item which can be used as `ViewModel` item.

	Please read [MVVM](https://en.wikipedia.org/wiki/Model–view–viewmodel).
	This describes what is a ViewModel in MVVM design pattern.

*/
//swiftlint:disable type_name
protocol ViewModel {

	/// `ViewModel`'s input.
  associatedtype In

  /// `ViewModel`'s output.
  associatedtype Out

  /**

  	Produce `ViewModel`'s output from `ViewModel`'s input.

  	- parameters:
  	  - input: `ViewModel` input.

		- returns: `ViewModel` output

  */
  func setup(from input: In) -> Out

}
//swiftlint:enable type_name
