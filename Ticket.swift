//
//  Ticket.swift
//  Jackpot
//
//  Created by Timothy Hang on 4/30/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

import Foundation

class Ticket: NSObject
{
  var winner: Bool
  var payout: String
  fileprivate var picks = Set<Int>()
  
  override init()
  {
    winner = false
    payout = ""
    super.init()
    for _ in 0..<6
    {
      createPick()
    }
  }
  
  init(picksArray: Array<Int>)
  {
    winner = false
    payout = ""
    for i in 0..<picksArray.count
    {
      picks.insert(picksArray[i])
    }
  }
  
  func createPick()
  {
    var pickFound = false
    repeat
    {
      let aPick = Int(arc4random() % 53 + 1)
      if !picks.contains(aPick)
      {
        picks.insert(aPick)
        pickFound = true
      }
    } while !pickFound
  }
  
  func numberDescription() -> String
  {
    var numbers = ""
    for pick in picks.sorted()
    {
      numbers = numbers + " \(pick)"
    }
    return numbers
  }
  
  func picksArray() -> [Int]
  {
    var picksArray = [Int]()
    
    for pick in picks.sorted()
    {
      picksArray.append(pick)
    }
    return picksArray
  }
  
  func compareWithTicket(_ anotherTicket: Ticket)
  {
    let anotherTicketPicks = anotherTicket.picksArray()
    var matchCount = 0
    
    for aPossiblePick in anotherTicketPicks
    {
      if picks.contains(aPossiblePick)
      {
        matchCount += 1
      }
    }
    
    switch matchCount
    {
    case 3:
      winner = true
      payout = "$1"
    case 4:
      winner = true
      payout = "$5"
    case 5:
      winner = true
      payout = "$20"
    case 6:
      winner = true
      payout = "$100"
    default:
      winner = false
      payout = ""
    }
  }
}
