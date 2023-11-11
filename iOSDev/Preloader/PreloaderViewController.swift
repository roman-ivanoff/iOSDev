//
//  ViewController.swift
//  iOSDev
//
//  Created by Roman Ivanov on 08.11.2023.
//

import UIKit

class PreloaderViewController: UIViewController {
  // MARK: - Properties
  private let contentView = PreloaderContentView()

  // MARK: - Lifecycle Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    pushToMainAfter(delay: 5)
  }

  override func loadView() {
    view = contentView
  }

  // MARK: - Private Methods
  private func pushToMainAfter(delay seconds: Double) {
    let testData = TestData()
    let mainVC = MainViewController()
    mainVC.model.games = testData.generate()
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
      self.navigationController?.pushViewController(mainVC, animated: true)
    }
  }
}
