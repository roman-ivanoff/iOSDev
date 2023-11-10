//
//  MainCollectionView.swift
//  iOSDev
//
//  Created by Roman Ivanov on 09.11.2023.
//

import UIKit

class MainCollectionView: UICollectionView {
  override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
    let flowLayout = UICollectionViewFlowLayout()
    flowLayout.scrollDirection = .vertical

    super.init(frame: frame, collectionViewLayout: flowLayout)

    showsVerticalScrollIndicator = false
    backgroundColor = UIColor.clear

    register(MainCollectionViewCell.self, forCellWithReuseIdentifier: MainCollectionViewCell.identifier)
    register(
      MainCollectionViewHeader.self,
      forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
      withReuseIdentifier: MainCollectionViewHeader.identifier
    )
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
