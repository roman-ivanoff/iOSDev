//
//  SegmentCollectionView.swift
//  iOSDev
//
//  Created by Roman Ivanov on 12.11.2023.
//

import UIKit

class SegmentCollectionView: UICollectionView {
  override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.scrollDirection = .horizontal

    super.init(frame: frame, collectionViewLayout: flowLayout)

    showsVerticalScrollIndicator = false
    backgroundColor = UIColor.clear

    register(SegmentCell.self, forCellWithReuseIdentifier: SegmentCell.identifier)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
