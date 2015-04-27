//
//  SwitchSportView.m
//  The Excuse Book
//
//  Created by Jeremey Rodriguez on 4/26/15.
//  Copyright (c) 2015 SingleCog Software. All rights reserved.
//

#import "SwitchSportView.h"
#import "WYPopoverController.h"
#import "DefaultController.h"
#import "SportsModel.h"

@interface SwitchSportView ()

@property (nonatomic, strong) NSArray *arrSports;

-(void)loadData;
-(void)UpdateDefaultSport;

@end

@implementation SwitchSportView

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tblSports.delegate = self;
    self.tblSports.dataSource = self;
    
    // drop shadow for the table
    self.tblSports.layer.shadowColor = [UIColor blackColor].CGColor;
    self.tblSports.layer.shadowOffset = CGSizeMake(1.0f, 1.0f);
    self.tblSports.layer.masksToBounds = NO;
    self.tblSports.layer.shadowOpacity = 1.0;
    [self.tblSports setSeparatorColor:[UIColor blackColor]];
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone) {
        // this doesn't seem to work
        [WYPopoverController setDefaultTheme:[WYPopoverTheme theme]];
        WYPopoverBackgroundView *appearance = [WYPopoverBackgroundView appearance];
        appearance.backgroundColor = [UIColor colorWithRed:.16 green:.45 blue:.81 alpha:1];
        
    } else {
        self.popoverPresentationController.backgroundColor = [UIColor colorWithRed:.16 green:.45 blue:.81 alpha:1];
    }
    
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@""]) {
        //ChooseDiver *switchDiver = [segue destinationViewController];
        
    }
}

// keeps the color of the selected cell the same -
// in Ipad because of some unknown apple logic
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.defaultSportID = [[self.arrSports objectAtIndex:indexPath.row] objectAtIndex:0];
    
    [self UpdateDefaultSport];
    
    // either return to parent method or create a segue way back and use this
    [self performSegueWithIdentifier:@"" sender:self];
}

-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath  {
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.contentView.backgroundColor = cell.contentView.backgroundColor;
    
}

-(void)tableView:(UITableView*)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    cell.contentView.backgroundColor = cell.contentView.backgroundColor;
}

// tells the tableView we want to have just one section
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// specifies the total number of rows displayed in the table view
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrSports.count;
}

// sets each rows height
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 40.0;
    
}

// displays a row's data
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // dequeue the cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"idCellRecord" forIndexPath:indexPath];
    
    cell.textLabel.font = [UIFont systemFontOfSize:16.0];
    cell.textLabel.numberOfLines = 1;
    cell.backgroundColor = [UIColor clearColor];
    
    // set the loaded data to the appropriate cell labels
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [[self.arrSports objectAtIndex:indexPath.row] objectAtIndex:1]];
    
    return cell;
}


#pragma Private methods

-(void)loadData {
    
    //get the results
    if (self.arrSports != nil) {
        self.arrSports = nil;
    }
    
    SportsModel *sport = [[SportsModel alloc] init];
    self.arrSports = sport.GetSportsAndIDs;
    
    [self.tblSports reloadData];
    
}

-(void)UpdateDefaultSport {
    
    DefaultController *defaultSport = [[DefaultController alloc] init];
    
    [defaultSport UpdateDefaultSport:self.defaultSportID];
    
}

@end
