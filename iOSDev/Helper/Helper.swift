//
//  Helper.swift
//  iOSDev
//
//  Created by Roman Ivanov on 09.11.2023.
//

import Foundation

class Helper {
  static let shared = Helper()

  public func convertDate(date: String) -> String {
    let olDateFormatter = DateFormatter()
    olDateFormatter.dateFormat = "yyyy-MM-dd"
    guard let oldDate = olDateFormatter.date(from: date) else { return "" }
    let convertDateFormatter = DateFormatter()
    convertDateFormatter.dateFormat = "MMM dd"
    return convertDateFormatter.string(from: oldDate)
  }
}
