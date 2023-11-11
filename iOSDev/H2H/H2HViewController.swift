//
//  H2HViewController.swift
//  iOSDev
//
//  Created by Roman Ivanov on 11.11.2023.
//

import UIKit

class H2HViewController: UIViewController {
  // MARK: - Properties
  private let contentView = H2HContentView()
  let model = H2HModel()

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
extension H2HViewController: UICollectionViewDelegate {}

// MARK: - UICollectionViewDataSource
extension H2HViewController: UICollectionViewDataSource {
  func collectionView(
    _ collectionView: UICollectionView,
    numberOfItemsInSection section: Int
  ) -> Int {
    model.h2h.count
  }

  func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
    var cell = UICollectionViewCell()

    if let h2hCell = collectionView.dequeueReusableCell(
      withReuseIdentifier: H2HCollectionViewCell.identifier,
      for: indexPath
    ) as? H2HCollectionViewCell {
      h2hCell.configure(with: model.h2h[indexPath.row])

      cell = h2hCell
    }

    return cell
  }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension H2HViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath
  ) -> CGSize {
    CGSize(width: collectionView.frame.width, height: 69)
  }

  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    minimumLineSpacingForSectionAt section: Int
  ) -> CGFloat {
    12
  }

  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    minimumInteritemSpacingForSectionAt section: Int
  ) -> CGFloat {
    12
  }
}
