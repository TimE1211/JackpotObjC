//
//  ViewController.h
//  Jackpot
//
//  Created by Timothy Hang on 4/25/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Ticket.h"

@interface WinningTicketViewController : UIViewController

@property (nonatomic) NSMutableArray *ticketArray;
@property (nonatomic) Ticket *winningTicket;

@end

