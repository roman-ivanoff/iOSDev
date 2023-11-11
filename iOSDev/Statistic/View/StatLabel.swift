//
//  StatLabel.swift
//  iOSDev
//
//  Created by Roman Ivanov on 11.11.2023.
//

import UIKit

class StatLabel: UILabel {
  override init(frame: CGRect) {
    super.init(frame: frame)

    setup()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setup() {
    font = .systemFont(ofSize: 16, weight: .semibold)
    textColor = .white
  }
}
