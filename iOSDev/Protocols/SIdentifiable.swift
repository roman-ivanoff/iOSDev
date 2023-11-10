//
//  SIdentifiable.swift
//  iOSDev
//
//  Created by Roman Ivanov on 09.11.2023.
//

import Foundation

protocol SIdentifiable {
  static var identifier: String { get }
  var identifier: String { get }
}

extension SIdentifiable {
  static var identifier: String { String(describing: self) }
  var identifier: String { Self.identifier }
}
