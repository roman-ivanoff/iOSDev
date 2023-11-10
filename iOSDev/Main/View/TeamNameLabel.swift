//
//  TeamNameLabel.swift
//  iOSDev
//
//  Created by Roman Ivanov on 09.11.2023.
//

import UIKit

class TeamNameLabel: UILabel {
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setup() {
    font = .systemFont(ofSize: 14, weight: .medium)
    textColor = .white
    numberOfLines = 0
    textAlignment = .center
    sizeToFit()
  }
}
