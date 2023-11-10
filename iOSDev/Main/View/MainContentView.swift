//
//  MainContentView.swift
//  iOSDev
//
//  Created by Roman Ivanov on 08.11.2023.
//

import UIKit

class MainContentView: UIView {
  let collectionView = MainCollectionView()

  init() {
    super.init(frame: UIScreen.main.bounds)
    backgroundColor = UIColor(named: "backgroundColor")
    addElements()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func addElements() {
    addAutoLayoutSubviews(collectionView)

    NSLayoutConstraint.activate([
      collectionView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
      collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
      collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
      collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
}
