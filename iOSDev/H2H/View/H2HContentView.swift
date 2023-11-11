//
//  H2HContentView.swift
//  iOSDev
//
//  Created by Roman Ivanov on 11.11.2023.
//

import UIKit

class H2HContentView: UIView {
  let collectionView = H2HCollectionView()

  init() {
    super.init(frame: UIScreen.main.bounds)
    backgroundColor = .clear
    addElements()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func addElements() {
    addAutoLayoutSubviews(collectionView)

    NSLayoutConstraint.activate([
      collectionView.topAnchor.constraint(equalTo: topAnchor),
      collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
      collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
}
