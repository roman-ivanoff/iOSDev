//
//  ViewController.swift
//  iOSDev
//
//  Created by Roman Ivanov on 08.11.2023.
//

import UIKit

class PreloaderViewController: UIViewController {
  private let contentView = PreloaderContentView()

  override func viewDidLoad() {
    super.viewDidLoad()
    // TODO: change time
    pushToMainAfter(delay: 1)
  }

  override func loadView() {
    view = contentView
  }

  private func pushToMainAfter(delay seconds: Double) {
    let testData = TestData()
    let mainVC = MainViewController()
    mainVC.model.games = testData.generate()
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
      self.navigationController?.pushViewController(mainVC, animated: true)
    }
  }
}
