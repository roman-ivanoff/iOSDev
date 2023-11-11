//
//  ScoreView.swift
//  iOSDev
//
//  Created by Roman Ivanov on 11.11.2023.
//

import UIKit

class ScoreView: UIView {
  private let scoreLabel = UILabel().apply {
    $0.font = .systemFont(ofSize: 14, weight: .semibold)
    $0.textColor = UIColor(named: "redColor")
  }

  init() {
    super.init(frame: UIScreen.main.bounds)
    backgroundColor = UIColor(named: "scoreBackgroundColor")
    addElements()
    setRoundCorners()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func addElements() {
    addAutoLayoutSubviews(scoreLabel)

    NSLayoutConstraint.activate([
      scoreLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
      scoreLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
    ])
  }

  private func setRoundCorners() {
    layer.cornerRadius = 13
    clipsToBounds = true
  }

  func setScore(text: String) {
    scoreLabel.text = text
  }
}
