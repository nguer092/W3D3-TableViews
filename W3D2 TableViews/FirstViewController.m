//
//  FirstViewController.m
//  W3D2 TableViews
//
//  Created by Nicolas Guerrero on 9/19/17.
//  Copyright © 2017 Nicolas Guerrero. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController () <UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray * textRecords;
@property (nonatomic, strong) NSArray *otherNames;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.textRecords = [[NSMutableArray alloc] initWithObjects:@"Nick", @"Jayson", @"Paul", @"Willi", @"James", nil];
    
//    This declares " I am going to be your data source"
    self.tableView.dataSource = self;
    
//    Use reuse identifiers recycling --- "dequeReusableCellWithIdentifier"
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    _otherNames = @[@"Jon", @"Bran", @"Rick", @"Morty"];
    
}

#pragma mark - UITableViewDataSource (to know what delegate methods im implementing)

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    table view - check if its the right one
//    section - check to see which section the delegate method is asking (these infos get passed by delegate)
    if (section ==0){
        return _otherNames.count;
    }
    return self.textRecords.count;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    Index Parh carries section and row information together
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;

//    UITableViewCell *cell = [[UITableViewCell alloc] init];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    NSString * text;
    if(section == 0) {
        text = _otherNames[row];
    } else {
        text = self.textRecords[row];

    }
    
    cell.textLabel.text = text;
    
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"ClassMates";
    } else {
        return @"Enemies";
    }
}



@end
