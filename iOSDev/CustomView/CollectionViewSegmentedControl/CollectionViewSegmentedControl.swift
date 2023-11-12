//
//  CollectionViewSegmentedControl.swift
//  iOSDev
//
//  Created by Roman Ivanov on 12.11.2023.
//

import UIKit

class CollectionViewSegmentedControl: UIControl {
  // MARK: - Properties
  private var collectionView = SegmentCollectionView()
  public var selectedBackgroundColor: UIColor = UIColor(named: "orangeColor") ?? .orange
  public var unselectedBackgroundColor: UIColor = UIColor(named: "secondaryBackgroundColor") ?? .gray
  public var selectedTextColor: UIColor = .white
  public var unselectedTextColor: UIColor = UIColor(named: "greyColor") ?? .white
  public let font: UIFont = UIFont.systemFont(ofSize: 17, weight: .medium)

  public var items: [String] = [] {
    didSet {
      collectionView.reloadData()
    }
  }

  public var selectedItem: String {
    return self.items[self.selectedIndex]
  }

  public var selectedIndex: Int = 0 {
    didSet {
      collectionView.reloadData()
      sendActions(for: .valueChanged)
    }
  }

  public var labelPadding: CGFloat = 20 {
    didSet {
      collectionView.reloadData()
    }
  }

  // MARK: - init
  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
    addElements()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: - Private Methods
  private func setup() {
    backgroundColor = .clear
    collectionView.delegate = self
    collectionView.dataSource = self
    collectionView.isScrollEnabled = true
  }

  private func addElements() {
    addAutoLayoutSubviews(collectionView)

    NSLayoutConstraint.activate([
      collectionView.topAnchor.constraint(equalTo: topAnchor),
      collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
      collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
}

// MARK: - UICollectionViewDelegate
extension CollectionViewSegmentedControl: UICollectionViewDelegate {
  func collectionView(
    _ collectionView: UICollectionView,
    didSelectItemAt indexPath: IndexPath
  ) {
    selectedIndex = indexPath.row
  }
}

// MARK: - UICollectionViewDataSource
extension CollectionViewSegmentedControl: UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    1
  }

  func collectionView(
    _ collectionView: UICollectionView,
    numberOfItemsInSection section: Int
  ) -> Int {
    items.count
  }

  func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
    var cell = UICollectionViewCell()

    if let segmentCell = collectionView.dequeueReusableCell(
      withReuseIdentifier: SegmentCell.identifier,
      for: indexPath
    ) as? SegmentCell {
      segmentCell.titleLabel.font = self.font
      segmentCell.titleLabel.text = items[indexPath.row]

      if indexPath.row == selectedIndex {
        segmentCell.backgroundColor = selectedBackgroundColor
        segmentCell.titleLabel.textColor = selectedTextColor
      } else {
        segmentCell.backgroundColor = unselectedBackgroundColor
        segmentCell.titleLabel.textColor = unselectedTextColor
      }

      segmentCell.layer.cornerRadius = segmentCell.frame.height / 2

      cell = segmentCell
    }

    return cell
  }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension CollectionViewSegmentedControl: UICollectionViewDelegateFlowLayout {
  public func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath
  ) -> CGSize {
    if self.items.isEmpty {
      return CGSize(width: 128, height: 32)
    }

    let tempLabel = UILabel()
    tempLabel.text = self.items[indexPath.item]
    tempLabel.font = self.font

    let width = tempLabel.intrinsicContentSize.width + (self.labelPadding * 1.2)
    return CGSize(width: width, height: 32)
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
