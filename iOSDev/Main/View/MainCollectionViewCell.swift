//
//  MainCollectionViewCell.swift
//  iOSDev
//
//  Created by Roman Ivanov on 09.11.2023.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell, SIdentifiable {
  // MARK: - Properties
  private let gameInfoView = GameInfoView(isCell: true)

  // MARK: - init
  override init(frame: CGRect) {
    super.init(frame: frame)

    addElements()
    setup()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Private Methods
  private func setup() {
    backgroundColor = UIColor(named: "secondaryBackgroundColor")

    layer.masksToBounds = false
    layer.cornerRadius = 15
    layer.borderWidth = 1
    layer.borderColor = UIColor(named: "borderColor")?.cgColor
  }

  private func addElements() {
    addAutoLayoutSubviews(gameInfoView)

    NSLayoutConstraint.activate([
      gameInfoView.topAnchor.constraint(equalTo: topAnchor),
      gameInfoView.leadingAnchor.constraint(equalTo: leadingAnchor),
      gameInfoView.trailingAnchor.constraint(equalTo: trailingAnchor),
      gameInfoView.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }

  // MARK: - Public Methods
  func configure(with game: Game) {
    gameInfoView.configure(with: game)

    switch game.gameCondition {

    case .live:
      layer.borderColor = UIColor(named: "redColor")?.cgColor
    case .finished:
      layer.borderColor = UIColor(named: "borderColor")?.cgColor
    case .notStarted:
      layer.borderColor = UIColor(named: "borderColor")?.cgColor
    }
  }
}
