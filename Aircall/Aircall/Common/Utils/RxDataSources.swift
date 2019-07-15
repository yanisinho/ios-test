//
//  RxDataSources.swift
//  Aircall
//
//  Created by Yanis SIDAHMED on 16/07/2019.
//  Copyright © 2019 Yanis SG. All rights reserved.
//

import Foundation
import RxDataSources

struct RxDataSources {

	// MARK: - Private

	/**

	Build `RxDataSources` animatable sections.

	Use this method if you want animatable sections.

	- Parameters:
		- items: `Array` of items embedded in section array.

	- Returns: `AnimatableSectionModel` array.

	*/
	private static func animatableSectionModels<T: IdentifiableType & Sortable>(
		from items: [[T]]
		) -> [AnimatableSectionModel<String, T>] {
		return items.map { itemsInSection -> AnimatableSectionModel<String, T> in
			let firstCharacter = itemsInSection.first?.day ?? ""
			let model = String(firstCharacter).capitalized
			return AnimatableSectionModel<String, T>(model: model, items: itemsInSection)
		}
	}

	/**

	Build items sections.

	Create items sections from items array.

	- Parameters:
		- items: Array of items.

	- Returns: Array of items sorted in sections.

	*/
	private static func sortedSections<T: Sortable & Comparable>(
		items: [T]
		) -> [[T]] {
		let sortedItems = items.sorted(by: <)
		let groupedItems = sortedItems.reduce([[T]]()) {
			guard var last = $0.last else { return [[$1]] }
			var collection = $0
			if last.first!.grouping == $1.grouping {
				last += [$1]
				collection[collection.count - 1] = last
			} else {
				collection += [[$1]]
			}
			return collection
		}
		return groupedItems.reversed()
	}

	// MARK: - Public

	/**

	Build `RxDataSources` animatable sections.

	Use this method if you want animatable sections.

	- Parameters:
		- items: `Array` of items.

	- Returns: `AnimatableSectionModel` array.

	*/
	static func animatableSections<T: IdentifiableType & Sortable & Comparable>(
		from items: [T]
		) -> [AnimatableSectionModel<String, T>] {
		let sections = sortedSections(items: items)
		return animatableSectionModels(from: sections)
	}

}
