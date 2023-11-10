//
//  TestData.swift
//  iOSDev
//
//  Created by Roman Ivanov on 09.11.2023.
//

import Foundation

struct TestData {
  // Sample team names from the English Premier League
  let eplTeams = [
    "Arsenal",
    "Aston Villa",
    "Brighton & Hove Albion",
    "Burnley",
    "Chelsea",
    "Crystal Palace",
    "Everton",
    "Leeds United",
    "Leicester City",
    "Liverpool",
    "Manchester City",
    "Manchester United",
    "Newcastle United",
    "Norwich City",
    "Southampton",
    "Tottenham Hotspur",
    "Watford",
    "West Ham United",
    "Wolverhampton Wanderers"
  ]

  private func randomStatistic() -> Statistic {
    return Statistic(
      ballProfessional: "\(Int.random(in: 0...70))%",
      goalAttempts: "\(Int.random(in: 0...15))",
      shotsOnGoal: "\(Int.random(in: 0...10))",
      shotsOfGoal: "\(Int.random(in: 0...10))",
      freeKicks: "\(Int.random(in: 0...10))",
      offsides: "\(Int.random(in: 0...5))",
      yellowCards: "\(Int.random(in: 0...5))",
      redCards: "\(Int.random(in: 0...2))",
      crosses: "\(Int.random(in: 0...20))"
    )
  }

  private func generatePreviousGame(homeTeam: Team, guestTeam: Team) -> Game {
    return Game(
      gameCondition: .finished,
      startTime: "2023-11-01",
      homeTeam: homeTeam,
      guestTeam: guestTeam,
      league: "Premier League",
      score: "\(Int.random(in: 0...5)) - \(Int.random(in: 0...5))",
      time: "90'",
      date: "2023-11-01",
      h2h: [],
      homeTeamStatistic: randomStatistic(),
      guestTeamStatistic: randomStatistic()
    )
  }

  private func generateRandomConditionGame() -> GameCondition {
    switch Int.random(in: 0...2) {
    case 0: return .finished
    case 1: return .live
    case 2: return .notStarted
    default: return .finished
    }
  }

  func generate() -> [Game] {
    var games: [Game] = []

    for _ in 1...15 {
      let homeTeamName = eplTeams.randomElement() ?? "Home Team"
      let guestTeamName = eplTeams.randomElement() ?? "Guest Team"

      let homeTeam = Team(name: homeTeamName, logo: "chelseaLogo")
      let guestTeam = Team(name: guestTeamName, logo: "chelseaLogo")

      var h2hGames: [Game] = []
      for _ in 1...5 {
        h2hGames.append(generatePreviousGame(homeTeam: homeTeam, guestTeam: guestTeam))
      }

      let game = Game(
        gameCondition: generateRandomConditionGame(),
        startTime: "12:00",
        homeTeam: homeTeam,
        guestTeam: guestTeam,
        league: "English Premier League",
        score: "\(Int.random(in: 0...5)) : \(Int.random(in: 0...5))",
        time: "90'",
        date: "2023-11-09",
        h2h: h2hGames,
        homeTeamStatistic: randomStatistic(),
        guestTeamStatistic: randomStatistic()
      )

      games.append(game)
    }

    return games
  }
}
