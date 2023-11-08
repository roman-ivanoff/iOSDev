//
//  MainViewController.swift
//  iOSDev
//
//  Created by Roman Ivanov on 08.11.2023.
//

import UIKit

class MainViewController: UIViewController {
  private let contentView = MainContentView()

  override func viewDidLoad() {
    super.viewDidLoad()

    setupNavbar()
  }

  override func loadView() {
    view = contentView
  }

  private func setupNavbar() {
    navigationItem.hidesBackButton = true
  }
}
