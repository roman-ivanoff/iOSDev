//
//  EventDetailContentView.swift
//  iOSDev
//
//  Created by Roman Ivanov on 10.11.2023.
//

import UIKit

class EventDetailContentView: UIView {
  private let ballsBackgroundView = BallsBackgroundView()
  private let gameInfoView = GameInfoView(isCell: false)
  let segmentedContol = UISegmentedControl(items: ["H2H", "Statistic"]).apply {
    $0.selectedSegmentIndex = 0
  }

  private let statisticView = UIView().apply {
    $0.backgroundColor = UIColor(named: "secondaryBackgroundColor")
  }

  init() {
    super.init(frame: UIScreen.main.bounds)
    backgroundColor = UIColor(named: "backgroundColor")
    addElements()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func configure(with game: Game) {
    gameInfoView.configure(with: game)
  }

  func addToStatisticViewAndSetConstraints(view: UIView) {
    statisticView.addAutoLayoutSubviews(view)

    NSLayoutConstraint.activate([
      view.topAnchor.constraint(equalTo: statisticView.topAnchor, constant: 16),
      view.leadingAnchor.constraint(equalTo: statisticView.leadingAnchor, constant: 12),
      view.trailingAnchor.constraint(equalTo: statisticView.trailingAnchor, constant: -12),
      view.bottomAnchor.constraint(equalTo: statisticView.bottomAnchor, constant: -12)
    ])
  }

  private func addElements() {
    addAutoLayoutSubviews(ballsBackgroundView, gameInfoView, segmentedContol, statisticView)

    NSLayoutConstraint.activate([
      ballsBackgroundView.topAnchor.constraint(equalTo: topAnchor),
      ballsBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
      ballsBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
      ballsBackgroundView.heightAnchor.constraint(equalToConstant: 277),

      gameInfoView.leadingAnchor.constraint(equalTo: leadingAnchor),
      gameInfoView.trailingAnchor.constraint(equalTo: trailingAnchor),
      gameInfoView.bottomAnchor.constraint(equalTo: ballsBackgroundView.bottomAnchor, constant: -4),
      gameInfoView.heightAnchor.constraint(equalToConstant: 175),

      segmentedContol.topAnchor.constraint(equalTo: ballsBackgroundView.bottomAnchor, constant: 20),
      segmentedContol.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
      segmentedContol.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

      statisticView.topAnchor.constraint(equalTo: segmentedContol.bottomAnchor, constant: 20),
      statisticView.leadingAnchor.constraint(equalTo: leadingAnchor),
      statisticView.trailingAnchor.constraint(equalTo: trailingAnchor),
      statisticView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -65)
    ])
  }
}
