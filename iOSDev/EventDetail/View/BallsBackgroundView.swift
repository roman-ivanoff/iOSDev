//
//  BallsBackgroundView.swift
//  iOSDev
//
//  Created by Roman Ivanov on 10.11.2023.
//

import UIKit

class BallsBackgroundView: UIView {
  // MARK: - Properties
  private let topBallImageView = UIImageView().apply {
    $0.image = UIImage(named: "topBall")
    $0.contentMode = .scaleAspectFit
  }

  private let bottomBallImageView = UIImageView().apply {
    $0.image = UIImage(named: "bottomBall")
    $0.contentMode = .scaleAspectFit
  }

  // MARK: - init
  init() {
    super.init(frame: UIScreen.main.bounds)
    backgroundColor = UIColor(named: "secondaryBackgroundColor")
    addElements()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Private Methods
  private func addElements() {
    addAutoLayoutSubviews(topBallImageView, bottomBallImageView)

    NSLayoutConstraint.activate([
      topBallImageView.topAnchor.constraint(equalTo: topAnchor),
      topBallImageView.trailingAnchor.constraint(equalTo: trailingAnchor),

      bottomBallImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
      bottomBallImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
}
