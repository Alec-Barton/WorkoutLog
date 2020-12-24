//
//  UICollectionView+Extensions.swift
//  WorkoutLog
//
//  Created by Alec Barton on 12/23/20.
//  Copyright © 2020 Alec Barton. All rights reserved.
//

import UIKit

extension UICollectionView {
    // Calculate content size of collection view with cells of set height but variable width
    static func contentSizeFor(collectionViewWidth: CGFloat, cellWidths: [CGFloat], cellHeight: CGFloat, verticalPadding: CGFloat, horizontalPadding: CGFloat) -> CGSize {
        guard !cellWidths.isEmpty else { return .zero }
        var totalCellWidth: CGFloat = 0
        for width in cellWidths {
            totalCellWidth += (width + (2 * verticalPadding))
        }
        let rows = ceil(totalCellWidth / collectionViewWidth)
        let totalVerticalPadding: CGFloat = rows > 1 ? (rows - 1) * verticalPadding : 0
        let totalHeight = (rows * cellHeight) + totalVerticalPadding
        return CGSize(width: collectionViewWidth, height: totalHeight)
    }
    
    // TODO:
    // would like an option to "justify" collection view cells
    // to have the cells adjust their width or spacing to equally fill the row
    // theres probably a simple way to do this, this is just a reminder to research it
    func justifyCells() {}
}
