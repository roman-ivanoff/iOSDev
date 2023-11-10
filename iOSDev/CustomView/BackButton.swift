//
//  BackButton.swift
//  iOSDev
//
//  Created by Roman Ivanov on 10.11.2023.
//

import UIKit

class BackButton: UIButton {
  override init(frame: CGRect) {
    super.init(frame: frame)

    setup()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setup() {
    setImage(UIImage(systemName: "arrow.left"), for: .normal)
    tintColor = UIColor(named: "greyColor")
  }
}
