//
//  EventDetailModel.swift
//  iOSDev
//
//  Created by Roman Ivanov on 10.11.2023.
//

import Foundation

class EventDetail {
  var game: Game!

  let emptyStatistic = Statistic(
    ballProfessional: "0",
    goalAttempts: "0",
    shotsOnGoal: "0",
    shotsOfGoal: "0",
    freeKicks: "0",
    offsides: "0",
    yellowCards: "0",
    redCards: "0",
    crosses: "0"
  )
}
