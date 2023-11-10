//
//  MainContentView.swift
//  iOSDev
//
//  Created by Roman Ivanov on 08.11.2023.
//

import UIKit

class MainContentView: UIView {
  let tableView = MainCollectionView()

  init() {
    super.init(frame: UIScreen.main.bounds)
    backgroundColor = UIColor(named: "backgroundColor")
    addElements()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func addElements() {
    addAutoLayoutSubviews(tableView)

    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
      tableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
      tableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
      tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
}
