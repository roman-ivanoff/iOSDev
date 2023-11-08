//
//  MainContentView.swift
//  iOSDev
//
//  Created by Roman Ivanov on 08.11.2023.
//

import UIKit

class MainContentView: UIView {
  init() {
    super.init(frame: UIScreen.main.bounds)
    backgroundColor = UIColor(named: "backgroundColor")
    addElements()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func addElements() {

  }
}
