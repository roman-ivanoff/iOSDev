//
//  MainViewController.swift
//  iOSDev
//
//  Created by Roman Ivanov on 08.11.2023.
//

import UIKit

class MainViewController: UIViewController {
  private let contentView = MainContentView()
  var model = MainModel()

  override func viewDidLoad() {
    super.viewDidLoad()

    setupNavbar()
    contentView.tableView.delegate = self
    contentView.tableView.dataSource = self
  }

  override func loadView() {
    view = contentView
  }

  private func setupNavbar() {
    navigationItem.hidesBackButton = true
  }
}

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
}

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
