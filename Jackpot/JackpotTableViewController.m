//
//  JackpotTableViewController.m
//  Jackpot
//
//  Created by Timothy Hang on 4/26/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

#import "JackpotTableViewController.h"
#import "Ticket.h"

@interface JackpotTableViewController ()

@property (nonatomic) NSMutableArray *tickets;

@end

@implementation JackpotTableViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  [[Ticket alloc] init];
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"" forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}

#pragma mark - Navigation


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
