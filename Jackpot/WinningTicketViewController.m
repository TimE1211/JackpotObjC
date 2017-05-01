//
//  ViewController.m
//  Jackpot
//
//  Created by Timothy Hang on 4/25/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

#import "WinningTicketViewController.h"

@interface WinningTicketViewController () <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic) NSMutableArray *winningPicks;

@property (weak, nonatomic) IBOutlet UIPickerView *picker;

- (IBAction)checkTicketsButtonWasTapped:(UIButton *)sender;

@end

@implementation WinningTicketViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.winningPicks = [NSMutableArray new];
  self.title = @"Winning Ticket";
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
  return 6;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
  return 53;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
  return 20.0f;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
  return 40.0f;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
  return [NSString stringWithFormat:@"%ld", (long)row + 1];
}

- (IBAction)checkTicketsButtonWasTapped:(UIButton *)sender
{
  [self.winningPicks removeAllObjects];
  
  //david helped me append the array with the picker information
  for (NSInteger x = 6; x > 0; x--)
  {
    NSInteger row = [self.picker selectedRowInComponent:x];
    NSNumber *value = [NSNumber numberWithInteger:row+1];
    [self.winningPicks addObject:value];
  }
  
  Ticket *winningTicket = [[Ticket alloc] initWithPicksArray: self.winningPicks];
  [self.delegate winningTicketWasChosen: winningTicket];
}

@end
