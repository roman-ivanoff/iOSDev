//
//  EventDetailViewController.swift
//  iOSDev
//
//  Created by Roman Ivanov on 10.11.2023.
//

import UIKit

class EventDetailViewController: UIViewController {
  let contentView = EventDetailContentView()
  var game = EventDetail()
  let backButton = BackButton()

  override func viewDidLoad() {
    super.viewDidLoad()

    setupNavbar()
    contentView.configure(with: game.game)
  }

  override func loadView() {
    view = contentView
  }

  private func setupNavbar() {
    navigationItem.titleView = NavTitleLabel()

    backButton.addTarget(self, action: #selector(popVC(_:)), for: .touchUpInside)
    navigationItem.setLeftBarButton(UIBarButtonItem(customView: backButton), animated: true)
  }

  @objc private func popVC(_ sender: UIButton) {
    navigationController?.popViewController(animated: true)
  }
}
