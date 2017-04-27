//
//  Ticket.h
//  Jackpot
//
//  Created by Timothy Hang on 4/25/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ticket : NSObject

@property (nonatomic) NSSet *picks;
@property (nonatomic) NSString *payout;
@property (assign) Boolean *winner;

+ (Ticket *)init;

@end
