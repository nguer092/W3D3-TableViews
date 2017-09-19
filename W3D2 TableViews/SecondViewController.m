//
//  SecondViewController.m
//  W3D2 TableViews
//
//  Created by Nicolas Guerrero on 9/19/17.
//  Copyright © 2017 Nicolas Guerrero. All rights reserved.
//

#import "SecondViewController.h"
#import "LargeLabelTableViewCell.h"

@interface SecondViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *names;
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _names = @[@"Rick Oldman", @"Morty Powers", @"Archer Sterling"];
    self.tableView.dataSource = self;
    self.tableView.rowHeight  =UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 100 ;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.names.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    NSInteger section  = indexPath.section;
    NSInteger row = indexPath.row;
    
    LargeLabelTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    
    cell.cellLabel.text = self.names[row];
    
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"Squad";
}



@end
