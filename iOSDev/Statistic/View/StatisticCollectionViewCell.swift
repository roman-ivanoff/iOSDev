//
//  StatisticCollectionViewCell.swift
//  iOSDev
//
//  Created by Roman Ivanov on 11.11.2023.
//

import UIKit

class StatisticCollectionViewCell: UICollectionViewCell, SIdentifiable {
  // MARK: - Properties
  private let homeTeamStatLabel = StatLabel().apply {
    $0.textAlignment = .left
  }
  private let guestTeamStatLabel = StatLabel().apply {
    $0.textAlignment = .right
  }
  private let statTitleLabel = UILabel().apply {
    $0.font = .systemFont(ofSize: 14, weight: .regular)
    $0.textColor = UIColor(named: "greyColor")
    $0.textAlignment = .center
  }
  private let cellStackView = UIStackView().apply {
    $0.axis = .horizontal
    $0.distribution = .fillEqually
    $0.alignment = .center
    $0.spacing = 8
  }

  // MARK: - init
  override init(frame: CGRect) {
    super.init(frame: frame)

    setup()
    addElements()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  private func setup() {
    layer.borderColor = UIColor.clear.cgColor
    backgroundColor = UIColor(named: "secondaryBackgroundColor")
  }

  // MARK: - Private Methods
  private func addElements() {
    addAutoLayoutSubviews(cellStackView)
    cellStackView.addArrangedSubview(homeTeamStatLabel)
    cellStackView.addArrangedSubview(statTitleLabel)
    cellStackView.addArrangedSubview(guestTeamStatLabel)

    NSLayoutConstraint.activate([
      cellStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
      cellStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
      cellStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0)
    ])
  }

  // MARK: - Public Methods
  func configure(homeTeamStat: String, guestTeamStat: String, title: String) {
    homeTeamStatLabel.text = homeTeamStat
    guestTeamStatLabel.text = guestTeamStat
    statTitleLabel.text = title
  }
}
