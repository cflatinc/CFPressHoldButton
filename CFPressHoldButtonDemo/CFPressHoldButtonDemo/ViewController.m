//
//  ViewController.m
//  CFPressHoldButtonDemo
//
//  Created by Hiromasa OHNO on 2014/05/30.
//  Copyright (c) 2014年 CFlat. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *temporalView;

@end

@implementation ViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    cell.contentView.pressHoldButtonDelegate = self;
    cell.contentView.userInteractionEnabled = YES;
    cell.contentView.tag = indexPath.row;
    cell.textLabel.text = [NSString stringWithFormat:@"row %02d", indexPath.row];
    return cell;
}

#pragma mark CFPressHoldButtonDelegate -

- (void)didStartHolding:(UIView *)targetView
{
    self.temporalView = [UIView new];
    self.temporalView.frame = self.view.bounds;
    self.temporalView.backgroundColor = [UIColor whiteColor];
    
    UILabel *label = [UILabel new];
    label.frame = CGRectMake(50, 200, 220, 50);
    label.textAlignment = NSTextAlignmentCenter;
    label.text = [NSString stringWithFormat:@"row %2d pressed", targetView.tag];
    [self.temporalView addSubview:label];
    
    [self.view addSubview:self.temporalView];
}

- (void)didFinishHolding:(UIView *)targetView
{
    [self.temporalView removeFromSuperview];
    self.temporalView = nil;
}

@end
