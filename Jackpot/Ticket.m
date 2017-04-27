//
//  Ticket.m
//  Jackpot
//
//  Created by Timothy Hang on 4/25/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

#import "Ticket.h"

@implementation Ticket

+ (Ticket *)init;
{
  Ticket *aTicket = nil;
  aTicket.winner = false;
  aTicket.payout = @"";
//  for ( * in);
//  {
    [self createPick];
//  }
}

- (void)init: (NSArray *)picksArray
{
  self.winner = false;
  self.payout = @"";
  for (i in 0..<picksArray.count)
  {
    [self.picks insert(picksArray[i])]
  }
}

- (void)createPick;
{
  Boolean *pickFound = false;
  repeat
  {
    let aPick = Int(arc4random() % 53 + 1)
    if (![self.picks contains(aPick)])
    {
      picks.insert(aPick)
      pickFound = true
    }
  } while !pickFound
}

@end
