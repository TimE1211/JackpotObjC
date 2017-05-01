//
//  JackpotTableViewController.m
//  Jackpot
//
//  Created by Timothy Hang on 4/26/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

#import "JackpotTableViewController.h"
#import "WinningTicketViewController.h"

@interface JackpotTableViewController ()

@property (nonatomic) NSMutableArray *tickets;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButton;

- (IBAction)createNewTicket:(id)sender;

@end

@implementation JackpotTableViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.title = @"Lottery Tickets";
  self.tickets = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tickets.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TicketCell" forIndexPath:indexPath];
  
  Ticket *aTicket = self.tickets[indexPath.row];
  cell.textLabel.text = [aTicket numberDescription];
  
  if (aTicket.winner)
  {
    cell.backgroundColor = UIColor.greenColor;
    cell.detailTextLabel.text = aTicket.payout;
  }
  else
  {
    cell.backgroundColor = UIColor.whiteColor;
    cell.detailTextLabel.text = @"";
  }
  return cell;
}

- (void)winningTicketWasChosen:(Ticket *)winningTicket
{
  [self.navigationController popToRootViewControllerAnimated:YES];
  [self checkForWinnersUsingTicket:winningTicket];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
  if ([segue.identifier isEqualToString:@"CheckTicketSegue"])
  {
    WinningTicketViewController *WinningTicketVC = (WinningTicketViewController *)[segue destinationViewController];
    WinningTicketVC.delegate = self;
  }
}

- (IBAction)createNewTicket:(UIBarButtonItem *)sender
{
  Ticket *ticket = [[Ticket alloc] init];
  [self.tickets addObject: ticket];
  [self.tableView reloadData];
}

- (void)checkForWinnersUsingTicket:(Ticket *)winningTicket

{
  for (Ticket *ticket in self.tickets)
  {
    [ticket compareWithTicket:winningTicket];
  }

  [self.tableView reloadData];
}

@end
