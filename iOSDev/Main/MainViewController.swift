//
//  MainViewController.swift
//  iOSDev
//
//  Created by Roman Ivanov on 08.11.2023.
//

import UIKit

class MainViewController: UIViewController {
  // MARK: - Properties
  private let contentView = MainContentView()
  var model = MainModel()

  // MARK: - Lifecycle Methods
  override func viewDidLoad() {
    super.viewDidLoad()

    setupNavbar()
    contentView.collectionView.delegate = self
    contentView.collectionView.dataSource = self
  }

  override func loadView() {
    view = contentView
  }

  // MARK: - Private Methods
  private func setupNavbar() {
    navigationItem.hidesBackButton = true
  }
}

// MARK: - UICollectionViewDelegate
extension MainViewController: UICollectionViewDelegate {
  func collectionView(
    _ collectionView: UICollectionView,
    viewForSupplementaryElementOfKind kind: String,
    at indexPath: IndexPath
  ) -> UICollectionReusableView {
    if kind == UICollectionView.elementKindSectionHeader {
      let headerView = collectionView.dequeueReusableSupplementaryView(
        ofKind: kind,
        withReuseIdentifier: MainCollectionViewHeader.identifier,
        for: indexPath
      )

      return headerView
    } else {
      return UICollectionReusableView()
    }
  }

  func collectionView(
    _ collectionView: UICollectionView,
    didSelectItemAt indexPath: IndexPath
  ) {
    let eventDetailVC = EventDetailViewController()
    eventDetailVC.game.game = model.games[indexPath.row]
    navigationController?.pushViewController(eventDetailVC, animated: true)
  }
}

// MARK: - UICollectionViewDataSource
extension MainViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    model.games.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    var cell = UICollectionViewCell()

    if let gameCell = collectionView.dequeueReusableCell(
      withReuseIdentifier: MainCollectionViewCell.identifier,
      for: indexPath
    ) as? MainCollectionViewCell {
      gameCell.configure(with: model.games[indexPath.row])

      cell = gameCell
    }

    return cell
  }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension MainViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath
  ) -> CGSize {
    CGSize(width: collectionView.frame.width, height: 129)
  }

  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    referenceSizeForHeaderInSection section: Int
  ) -> CGSize {
    CGSize(width: collectionView.frame.width, height: 65)
  }

  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    minimumLineSpacingForSectionAt section: Int
  ) -> CGFloat {
    20
  }

  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    minimumInteritemSpacingForSectionAt section: Int
  ) -> CGFloat {
    20
  }
}
