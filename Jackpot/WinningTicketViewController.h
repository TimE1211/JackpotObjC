//
//  ViewController.h
//  Jackpot
//
//  Created by Timothy Hang on 4/25/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Jackpot-Swift.h"

@protocol WinningTicketViewControllerDelegate

- (void)winningTicketWasChosen:(Ticket *)ticket;

@end

@interface WinningTicketViewController : UIViewController

@property (strong, nonatomic) id<WinningTicketViewControllerDelegate> delegate;

@end

 
