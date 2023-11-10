//
//  MainCollectionViewCell.swift
//  iOSDev
//
//  Created by Roman Ivanov on 09.11.2023.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell, SIdentifiable {
  private let leagueLabel = UILabel().apply {
    $0.font = .systemFont(ofSize: 10, weight: .regular)
    $0.textColor = .white
  }
  private let homeTeamLogoImageView = UIImageView().apply {
    $0.contentMode = .scaleAspectFit
    $0.clipsToBounds = true
  }
  private let guestTeamLogoImageView = UIImageView().apply {
    $0.contentMode = .scaleAspectFit
    $0.clipsToBounds = true
  }
  private let homeTeamNameLabel = TeamNameLabel()
  private let guestTeamNameLabel = TeamNameLabel()
  private let timeOrScoreLabel = UILabel().apply {
    $0.font = UIFont(name: "PilatExtended-Black", size: 20)
    $0.textColor = .white
  }
  private let minuteLabel = UILabel().apply {
    $0.font = .systemFont(ofSize: 16, weight: .medium)
    $0.textColor = UIColor(named: "greyColor")
  }
  private let liveCircleView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 5)).apply {
    $0.isHidden = true
    $0.backgroundColor = UIColor(named: "redColor")
  }
  private let liveOrDateLabel = UILabel().apply {
    $0.font = .systemFont(ofSize: 10, weight: .regular)
    $0.textColor = .white
  }
  private let homeTeamInfoStackView = UIStackView().apply {
    $0.axis = .vertical
    $0.spacing = 2
    $0.alignment = .center
  }
  private let guestTeamInfoStackView = UIStackView().apply {
    $0.axis = .vertical
    $0.spacing = 2
    $0.alignment = .center
  }
  private let liveMinuteStackView = UIStackView().apply {
    $0.axis = .horizontal
    $0.spacing = 4
    $0.alignment = .center
  }
  private let scoreTimeStackView = UIStackView().apply {
    $0.axis = .vertical
    $0.spacing = 4
    $0.alignment = .center
  }
  private let gameStackView = UIStackView().apply {
    $0.axis = .horizontal
    $0.distribution = .equalSpacing
    $0.alignment = .center
  }

  private let cellStackView = UIStackView().apply {
    $0.axis = .vertical
    $0.distribution = .equalSpacing
    $0.alignment = .center
  }

  override init(frame: CGRect) {
    super.init(frame: frame)

    addElements()
    setup()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    setLiveCircleView()
  }

  private func setup() {
    backgroundColor = UIColor(named: "secondaryBackgroundColor")

    layer.masksToBounds = false
    layer.cornerRadius = 15
    layer.borderWidth = 1
    layer.borderColor = UIColor(named: "borderColor")?.cgColor
  }

  private func setLiveCircleView() {
    liveCircleView.layer.cornerRadius = liveCircleView.bounds.size.height / 2
    liveCircleView.clipsToBounds = true
  }

  private func addElements() {
    addAutoLayoutSubviews(cellStackView)

    homeTeamInfoStackView.addArrangedSubview(homeTeamLogoImageView)
    homeTeamInfoStackView.addArrangedSubview(homeTeamNameLabel)

    guestTeamInfoStackView.addArrangedSubview(guestTeamLogoImageView)
    guestTeamInfoStackView.addArrangedSubview(guestTeamNameLabel)

    liveMinuteStackView.addArrangedSubview(liveCircleView)
    liveMinuteStackView.addArrangedSubview(minuteLabel)

    scoreTimeStackView.addArrangedSubview(timeOrScoreLabel)
    scoreTimeStackView.addArrangedSubview(liveMinuteStackView)

    gameStackView.addArrangedSubview(homeTeamInfoStackView)
    gameStackView.addArrangedSubview(scoreTimeStackView)
    gameStackView.addArrangedSubview(guestTeamInfoStackView)

    cellStackView.addArrangedSubview(leagueLabel)
    cellStackView.addArrangedSubview(gameStackView)
    cellStackView.addArrangedSubview(liveOrDateLabel)

    NSLayoutConstraint.activate([

      liveCircleView.widthAnchor.constraint(equalToConstant: 5),
      liveCircleView.heightAnchor.constraint(equalToConstant: 5),

      homeTeamInfoStackView.widthAnchor.constraint(equalToConstant: 108),
      guestTeamInfoStackView.widthAnchor.constraint(equalToConstant: 108),

      homeTeamInfoStackView.topAnchor.constraint(equalTo: guestTeamInfoStackView.topAnchor),
      homeTeamInfoStackView.bottomAnchor.constraint(equalTo: guestTeamInfoStackView.bottomAnchor),
      gameStackView.heightAnchor.constraint(equalTo: homeTeamInfoStackView.heightAnchor, multiplier: 1),

      homeTeamLogoImageView.widthAnchor.constraint(equalToConstant: 48),
      homeTeamLogoImageView.heightAnchor.constraint(equalToConstant: 48),
      guestTeamLogoImageView.widthAnchor.constraint(equalToConstant: 48),
      guestTeamLogoImageView.heightAnchor.constraint(equalToConstant: 48),

      cellStackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
      cellStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
      cellStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),
      cellStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),

      homeTeamInfoStackView.leadingAnchor.constraint(equalTo: cellStackView.leadingAnchor),
      guestTeamInfoStackView.trailingAnchor.constraint(equalTo: cellStackView.trailingAnchor)
    ])
  }

  private func setColorToDate(
    string: String,
    count: Int,
    color: UIColor
  ) -> NSMutableAttributedString {
    let mutableString = NSMutableAttributedString(string: string)

    mutableString.addAttribute(
      NSAttributedString.Key.foregroundColor,
      value: color,
      range: NSRange(location: 0, length: count)
    )

    return mutableString
  }

  func configure(with game: Game) {
    leagueLabel.text = game.league
    homeTeamLogoImageView.image = UIImage(named: game.homeTeam.logo)
    homeTeamNameLabel.text = game.homeTeam.name
    guestTeamLogoImageView.image = UIImage(named: game.guestTeam.logo)
    guestTeamNameLabel.text = game.guestTeam.name
    timeOrScoreLabel.text = game.score
    minuteLabel.text = game.time
    let gameDay = Helper.shared.convertDate(date: game.date)
    let gameTime = game.startTime
    let gameDate = gameDay + ", " + gameTime
    liveOrDateLabel.attributedText = setColorToDate(
      string: gameDate,
      count: gameDay.count+1,
      color: UIColor(named: "greyColor") ?? .yellow
    )

    switch game.gameCondition {
    case .live:
      layer.borderColor = UIColor(named: "redColor")?.cgColor
      liveCircleView.isHidden = false
      liveOrDateLabel.text = NSLocalizedString("live", comment: "")
      liveMinuteStackView.isHidden = false
    case .finished:
      liveCircleView.isHidden = true
      liveMinuteStackView.isHidden = false
      layer.borderColor = UIColor(named: "borderColor")?.cgColor
    case .notStarted:
      liveCircleView.isHidden = true
      liveMinuteStackView.isHidden = true
      timeOrScoreLabel.text = game.startTime
      layer.borderColor = UIColor(named: "borderColor")?.cgColor
    }
  }
}
