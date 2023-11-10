//
//  MainCollectionViewHeader.swift
//  iOSDev
//
//  Created by Roman Ivanov on 09.11.2023.
//

import UIKit

class MainCollectionViewHeader: UICollectionReusableView, SIdentifiable {
  private let headerLabel = UILabel().apply {
    $0.text = NSLocalizedString("all_events", comment: "").uppercased()
    $0.font = UIFont(name: "PilatExtended-Black", size: 20)
    $0.textColor = .white
    $0.sizeToFit()
  }

  override init(frame: CGRect) {
    super.init(frame: frame)
    addViews()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func addViews() {
    addAutoLayoutSubviews(headerLabel)

    NSLayoutConstraint.activate([
      headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
      headerLabel.topAnchor.constraint(equalTo: topAnchor),
      headerLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
}
