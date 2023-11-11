//
//  GameInfoView.swift
//  iOSDev
//
//  Created by Roman Ivanov on 10.11.2023.
//

import UIKit

class GameInfoView: UIView {
  // MARK: - Properties
  var isCell = false
  private var leagueLabelFontSize: CGFloat = 14
  private var leagueLabelTextColor: UIColor = .white
  private var teamNameLabelFontSize: CGFloat = 17
  private var teamLogoSize: CGFloat = 64
  private var liveOrDateLabelFontSize: CGFloat = 14
  private var minuteLabelColor: UIColor = UIColor(named: "greyColor") ?? .white

  private let leagueLabel = UILabel()
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
  }
  private let liveCircleView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 5)).apply {
    $0.isHidden = true
    $0.backgroundColor = UIColor(named: "redColor")
  }
  private let liveOrDateLabel = UILabel().apply {
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

  // MARK: - init
  required init(isCell: Bool) {
    super.init(frame: .zero)
    self.isCell = isCell

    setElementAttributes()
    addElements()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Override Methods
  override func layoutSubviews() {
    super.layoutSubviews()
    setLiveCircleView()
  }

  // MARK: - Private Methods
  private func setElementAttributes() {
    if isCell {
      leagueLabelFontSize = 10
      leagueLabelTextColor = .white
      teamNameLabelFontSize = 14
      teamLogoSize = 48
      liveOrDateLabelFontSize = 10
      minuteLabelColor = UIColor(named: "greyColor") ?? .gray
    } else {
      leagueLabelFontSize = 14
      leagueLabelTextColor = UIColor(named: "redColor") ?? .red
      teamNameLabelFontSize = 17
      teamLogoSize = 64
      liveOrDateLabelFontSize = 14
      minuteLabelColor = UIColor(named: "redColor") ?? .red
    }

    leagueLabel.font = .systemFont(ofSize: leagueLabelFontSize, weight: .regular)
    leagueLabel.textColor = leagueLabelTextColor
    homeTeamNameLabel.font = homeTeamNameLabel.font.withSize(teamNameLabelFontSize)
    guestTeamNameLabel.font = homeTeamNameLabel.font.withSize(teamNameLabelFontSize)
    liveOrDateLabel.font = .systemFont(ofSize: liveOrDateLabelFontSize, weight: .semibold)
    minuteLabel.textColor = minuteLabelColor
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

      homeTeamLogoImageView.widthAnchor.constraint(equalToConstant: teamLogoSize),
      homeTeamLogoImageView.heightAnchor.constraint(equalToConstant: teamLogoSize),
      guestTeamLogoImageView.widthAnchor.constraint(equalToConstant: teamLogoSize),
      guestTeamLogoImageView.heightAnchor.constraint(equalToConstant: teamLogoSize),

      cellStackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
      cellStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14),
      cellStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),
      cellStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),

      homeTeamInfoStackView.leadingAnchor.constraint(equalTo: cellStackView.leadingAnchor),
      guestTeamInfoStackView.trailingAnchor.constraint(equalTo: cellStackView.trailingAnchor)
    ])
  }

  // MARK: - Public Methods
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
    liveOrDateLabel.attributedText = Helper.shared.getMutableStringWith(
      string: gameDate,
      count: gameDay.count+1,
      color: UIColor(named: "greyColor") ?? .yellow,
      fontSize: liveOrDateLabelFontSize,
      fontWeight: .regular
    )

    switch game.gameCondition {
    case .live:
      liveCircleView.isHidden = false
      liveOrDateLabel.text = NSLocalizedString("live", comment: "")
      liveMinuteStackView.isHidden = false
    case .finished:
      liveCircleView.isHidden = true
      liveMinuteStackView.isHidden = false
    case .notStarted:
      liveCircleView.isHidden = true
      liveMinuteStackView.isHidden = true
      timeOrScoreLabel.text = game.startTime
    }
  }
}
