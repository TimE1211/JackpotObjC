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

- (void)winningTicketWasChosen:(Ticket *)winningTicket;

@end

@interface WinningTicketViewController : UIViewController

@property (nonatomic) NSMutableArray *winningTicket;
@property (nonatomic) id<WinningTicketViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UIPickerView *ticketPicker;


@end

