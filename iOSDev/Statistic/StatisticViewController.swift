//
//  StatisticViewController.swift
//  iOSDev
//
//  Created by Roman Ivanov on 11.11.2023.
//

import UIKit

class StatisticViewController: UIViewController {
  // MARK: - Properties
  let model = StatisticDetail()
  private let contentView = StatisticContentView()

  // MARK: - Lifecycle Methods
  override func viewDidLoad() {
    super.viewDidLoad()
    contentView.collectionView.delegate = self
    contentView.collectionView.dataSource = self
  }

  override func loadView() {
    view = contentView
  }
}

// MARK: - UICollectionViewDelegate
extension StatisticViewController: UICollectionViewDelegate {}

// MARK: - UICollectionViewDataSource
extension StatisticViewController: UICollectionViewDataSource {
  func collectionView(
    _ collectionView: UICollectionView,
    numberOfItemsInSection section: Int
  ) -> Int {
    model.propertyArray.count
  }

  func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
    var cell = UICollectionViewCell()

    if let statCell = collectionView.dequeueReusableCell(
      withReuseIdentifier: StatisticCollectionViewCell.identifier,
      for: indexPath
    ) as? StatisticCollectionViewCell {
      statCell.configure(
        homeTeamStat: model.getStatisticArray(statistic: model.homeTeamStatistic)[indexPath.row],
        guestTeamStat: model.getStatisticArray(statistic: model.guestTeamStatistic)[indexPath.row],
        title: model.propertyArray[indexPath.row]
      )

      cell = statCell
    }

    return cell
  }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension StatisticViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath
  ) -> CGSize {
    CGSize(width: collectionView.frame.width, height: 28)
  }

  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    minimumLineSpacingForSectionAt section: Int
  ) -> CGFloat {
    16
  }

  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    minimumInteritemSpacingForSectionAt section: Int
  ) -> CGFloat {
    16
  }
}
