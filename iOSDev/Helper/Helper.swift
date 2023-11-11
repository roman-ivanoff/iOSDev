//
//  Helper.swift
//  iOSDev
//
//  Created by Roman Ivanov on 09.11.2023.
//

import UIKit

class Helper {
  static let shared = Helper()

  public func convertDate(date: String) -> String {
    let olDateFormatter = DateFormatter()
    olDateFormatter.dateFormat = "yyyy-MM-dd"
    guard let oldDate = olDateFormatter.date(from: date) else { return "" }
    let convertDateFormatter = DateFormatter()
    convertDateFormatter.dateFormat = "d MMM"
    return convertDateFormatter.string(from: oldDate)
  }

  public func getMutableStringWith(
    string: String,
    count: Int,
    color: UIColor,
    fontSize: CGFloat,
    fontWeight: UIFont.Weight
  ) -> NSMutableAttributedString {
    let mutableString = NSMutableAttributedString(string: string)

    mutableString.addAttributes([
      NSAttributedString.Key.foregroundColor: color,
      NSAttributedString.Key.font: UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
    ], range: NSRange(location: 0, length: count))

    return mutableString
  }
}
