//
//  NavTitleLabel.swift
//  iOSDev
//
//  Created by Roman Ivanov on 10.11.2023.
//

import UIKit

class NavTitleLabel: UILabel {
  override init(frame: CGRect) {
    super.init(frame: frame)

    setup()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setup() {
    font = UIFont(name: "PilatExtended-Bold", size: 16)
    textColor = .white
    text = NSLocalizedString("detail_events", comment: "")
    textAlignment = .center
  }
}
