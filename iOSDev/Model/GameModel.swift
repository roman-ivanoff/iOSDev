//
//  GameModel.swift
//  iOSDev
//
//  Created by Roman Ivanov on 09.11.2023.
//

import Foundation

struct Game {
  let gameCondition: GameCondition
  let startTime: String
  let homeTeam: Team
  let guestTeam: Team
  let league: String
  let score: String
  let time: String
  let date: String
  let h2h: [Game]
  let homeTeamStatistic: Statistic
  let guestTeamStatistic: Statistic
}

enum GameCondition {
  case live
  case finished
  case notStarted
}
