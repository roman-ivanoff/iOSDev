//
//  EventDetailViewController.swift
//  iOSDev
//
//  Created by Roman Ivanov on 10.11.2023.
//

import UIKit

class EventDetailViewController: UIViewController {
  private let contentView = EventDetailContentView()
  var game = EventDetail()
  private let backButton = BackButton()

  private lazy var h2hViewController: H2HViewController = {
    let viewController = H2HViewController()
    viewController.model.h2h = game.game.h2h

    add(asChildViewController: viewController)

    return viewController
  }()

  private lazy var statisticViewController: StatisticViewController = {
    let viewController = StatisticViewController()

    viewController.model.homeTeamStatistic =
    game.game.gameCondition == .notStarted ? game.emptyStatistic : game.game.homeTeamStatistic
    viewController.model.guestTeamStatistic =
    game.game.gameCondition == .notStarted ? game.emptyStatistic : game.game.guestTeamStatistic

    add(asChildViewController: viewController)

    return viewController
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    setupNavbar()
    contentView.configure(with: game.game)
    setupView()
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

  private func setupView() {
    contentView.segmentedContol.addTarget(self, action: #selector(selectionDidChange(_:)), for: .valueChanged)
    updateView()
  }

  @objc private func selectionDidChange(_ sender: UISegmentedControl) {
    updateView()
  }

  private func updateView() {
    if contentView.segmentedContol.selectedSegmentIndex == 0 {
      remove(asChildViewController: statisticViewController)
      add(asChildViewController: h2hViewController)
    } else {
      remove(asChildViewController: h2hViewController)
      add(asChildViewController: statisticViewController)
    }
  }

  private func add(asChildViewController viewController: UIViewController) {
    addChild(viewController)

    contentView.addToStatisticViewAndSetConstraints(view: viewController.view)

    viewController.didMove(toParent: self)
  }

  private func remove(asChildViewController viewController: UIViewController) {
    viewController.willMove(toParent: nil)

    viewController.view.removeFromSuperview()

    viewController.removeFromParent()
  }
}
