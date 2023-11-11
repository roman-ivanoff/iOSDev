//
//  StatisticDetailModel.swift
//  iOSDev
//
//  Created by Roman Ivanov on 11.11.2023.
//

import Foundation

class StatisticDetail {
  var homeTeamStatistic: Statistic!
  var guestTeamStatistic: Statistic!

  let propertyArray = [
    "Ball Professional",
    "Goal Attempts",
    "Shots On Goal",
    "Shots Of Goal",
    "Free Kicks",
    "Offsides",
    "Yellow Cards",
    "Red Cards",
    "Crosses"
  ]

  func getStatisticArray(statistic: Statistic) -> [String] {
    [
      statistic.ballProfessional,
      statistic.goalAttempts,
      statistic.shotsOnGoal,
      statistic.shotsOfGoal,
      statistic.freeKicks,
      statistic.offsides,
      statistic.yellowCards,
      statistic.redCards,
      statistic.crosses
    ]
  }
}
