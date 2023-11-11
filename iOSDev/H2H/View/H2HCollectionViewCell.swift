//
//  H2HCollectionViewCell.swift
//  iOSDev
//
//  Created by Roman Ivanov on 11.11.2023.
//

import UIKit

class H2HCollectionViewCell: UICollectionViewCell, SIdentifiable {
  private let homeTeamNameLabel = H2HTeamNameLabel()
  private let guestTeamNameLabel = H2HTeamNameLabel()
  private let dateLabel = UILabel().apply {
    $0.font = .systemFont(ofSize: 10, weight: .semibold)
    $0.textColor = UIColor(named: "greyColor")
  }

  private let scoreView = ScoreView()

  override init(frame: CGRect) {
    super.init(frame: frame)

    addElements()
    setup()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setup() {
    backgroundColor = UIColor(named: "h2hCellBackgroundColor")
    layer.masksToBounds = false
    layer.cornerRadius = 12
    layer.shadowOffset = CGSize(width: 0, height: 5)
    layer.shadowColor = UIColor(named: "shadowColor")?.cgColor
    layer.shadowOpacity = 1
    layer.shadowRadius = 5
  }

  private func addElements() {
    addAutoLayoutSubviews(dateLabel, scoreView, homeTeamNameLabel, guestTeamNameLabel)

    NSLayoutConstraint.activate([
      dateLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
      dateLabel.centerXAnchor.constraint(equalTo: centerXAnchor),

      scoreView.widthAnchor.constraint(equalToConstant: 62),
      scoreView.heightAnchor.constraint(equalToConstant: 25),
      scoreView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 7),
      scoreView.centerXAnchor.constraint(equalTo: centerXAnchor),

      homeTeamNameLabel.centerYAnchor.constraint(equalTo: scoreView.centerYAnchor),
      homeTeamNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
      homeTeamNameLabel.trailingAnchor.constraint(equalTo: scoreView.leadingAnchor, constant: -20),

      guestTeamNameLabel.centerYAnchor.constraint(equalTo: scoreView.centerYAnchor),
      guestTeamNameLabel.leadingAnchor.constraint(equalTo: scoreView.trailingAnchor, constant: 20),
      guestTeamNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
    ])
  }

  func configure(with game: Game) {
    let gameDay = Helper.shared.convertDate(date: game.date)
    let gameTime = game.startTime
    let gameDate = gameDay + ", " + gameTime
    dateLabel.attributedText = Helper.shared.getMutableStringWith(
      string: gameDate,
      count: gameDay.count+1,
      color: UIColor(named: "greyColor") ?? .gray,
      fontSize: 10,
      fontWeight: .regular)

    homeTeamNameLabel.text = game.homeTeam.name
    guestTeamNameLabel.text = game.guestTeam.name
    scoreView.setScore(text: game.score)
  }
}
