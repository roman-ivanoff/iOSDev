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

  private func addElements() {
    addAutoLayoutSubviews(ballsBackgroundView, gameInfoView)

    NSLayoutConstraint.activate([
      ballsBackgroundView.topAnchor.constraint(equalTo: topAnchor),
      ballsBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
      ballsBackgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
      ballsBackgroundView.heightAnchor.constraint(equalToConstant: 277),

      gameInfoView.leadingAnchor.constraint(equalTo: leadingAnchor),
      gameInfoView.trailingAnchor.constraint(equalTo: trailingAnchor),
      gameInfoView.bottomAnchor.constraint(equalTo: ballsBackgroundView.bottomAnchor, constant: -4),
      gameInfoView.heightAnchor.constraint(equalToConstant: 175)
    ])
  }
}
