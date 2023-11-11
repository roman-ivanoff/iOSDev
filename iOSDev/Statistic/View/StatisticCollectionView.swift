//
//  StatisticCollectionView.swift
//  iOSDev
//
//  Created by Roman Ivanov on 11.11.2023.
//

import UIKit

class StatisticCollectionView: UICollectionView {
  override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.scrollDirection = .vertical

    super.init(frame: frame, collectionViewLayout: flowLayout)

    showsVerticalScrollIndicator = false
    backgroundColor = UIColor.clear

    register(
      StatisticCollectionViewCell.self,
      forCellWithReuseIdentifier: StatisticCollectionViewCell.identifier
    )
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
