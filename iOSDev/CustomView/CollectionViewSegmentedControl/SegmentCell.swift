//
//  SegmentCell.swift
//  iOSDev
//
//  Created by Roman Ivanov on 12.11.2023.
//

import UIKit

class SegmentCell: UICollectionViewCell, SIdentifiable {
  public let titleLabel = UILabel()

  override init(frame: CGRect) {
    super.init(frame: frame)

    addElements()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func addElements() {
    addAutoLayoutSubviews(titleLabel)

    NSLayoutConstraint.activate([
      titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
      titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
    ])
  }
}
