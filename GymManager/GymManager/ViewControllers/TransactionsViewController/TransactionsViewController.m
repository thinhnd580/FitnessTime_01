//
//  TransactionsViewController.m
//  GymManager
//
//  Created by Văn Tiến Tú on 8/11/16.
//  Copyright © 2016 vantientu. All rights reserved.
//

#import "TransactionsViewController.h"
#import "CategoryCell.h"
#import <CCBottomRefreshControl/UIScrollView+BottomRefreshControl.h>

static NSString *const kAddTransactionSegue = @"AddTransactionSegue";
static NSString *const kCellIndentifier = @"CategoryCell";
const CGFloat kTableViewCellHeight = 40.0;

@interface TransactionsViewController () <UITableViewDelegate,UITableViewDataSource,ExpandableTableViewDelegate>

@property (weak, nonatomic) IBOutlet ExpandableTableView *tableView;
@property (strong, nonatomic) NSMutableArray *arrTrans;
@property (strong, nonatomic) UIRefreshControl *refresh;

@end

@implementation TransactionsViewController
#pragma mark - View's Life
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupView {
    //Setup Tableview
    NSMutableArray *arr1 = [NSMutableArray arrayWithObjects:@"1", @"2", nil];
    NSMutableArray *arr2 = [NSMutableArray arrayWithObjects:@"3", @"4", @"5", nil];
    self.arrTrans = [NSMutableArray arrayWithObjects:arr1, arr2, nil];
    [self.tableView setAllHeadersInitiallyCollapsed:NO];
    [self.tableView setScrollEnabled:NO];
    self.tableView.expandableDelegate = self;
    [self.tableView registerNib:[UINib nibWithNibName:kCellIndentifier bundle:nil] forCellReuseIdentifier:kCellIndentifier];
    [self.tableView reloadData];
    self.contraintTableViewCell.constant = self.tableView.contentSize.height;
    //Pull to rrefresh
    self.refresh = [[UIRefreshControl alloc] init];
    [self.refresh addTarget:self action:@selector(reloadDataForWholeView) forControlEvents:UIControlEventValueChanged];
    [self.scrollView insertSubview:self.refresh atIndex:0];
    [self.scrollView setAlwaysBounceVertical:YES];
    [self.indicaLoadMore setHidden:YES];
}

#pragma mark - Load Data 
- (void)reloadDataForWholeView {
    //TODO refresh data here
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSMutableArray *arr1 = [NSMutableArray arrayWithObjects:@"1", @"2", nil];
        NSMutableArray *arr2 = [NSMutableArray arrayWithObjects:@"3", @"4", @"5", nil];
        self.arrTrans = [NSMutableArray arrayWithObjects:arr1, arr2, nil];
        [self.tableView reloadData];
        self.contraintTableViewCell.constant = self.tableView.contentSize.height;
        [self.refresh endRefreshing];
    });
}

#pragma mark - TableView Implementation
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSUInteger count = [self.arrTrans count];
    return count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSUInteger count = [self.tableView totalNumberOfRows:[[self.arrTrans objectAtIndex:section] count] inSection:section];
    return count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kTableViewCellHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return kTableViewHeaderHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIndentifier forIndexPath:indexPath];
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return [self.tableView headerWithTitle:@"asd" totalRows:[[self.arrTrans objectAtIndex:section] count] inSection:section];
}

- (void)didDeleteSection:(NSUInteger)section {
    [self.arrTrans removeObjectAtIndex:section];
    [self.tableView beginUpdates];
    [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationTop];
    [self.tableView endUpdates];
    [self.tableView reloadData];
    [UIView animateWithDuration:0.3 animations:^{
        self.contraintTableViewCell.constant = self.tableView.contentSize.height;
        [self.view layoutIfNeeded];
    }];
}

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewRowAction *ac1 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"Edit" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        NSLog(@"edit");
    }];
    UITableViewRowAction *ac2 = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"Delete" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        NSLog(@"delete");
        [[self.arrTrans objectAtIndex:indexPath.section] removeObjectAtIndex:indexPath.row];
        [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:indexPath.section] withRowAnimation:UITableViewRowAnimationFade];
        //Update Tableview height contraint
        [self.tableView reloadData];
        self.contraintTableViewCell.constant = self.tableView.contentSize.height;
    }];
    return [NSArray arrayWithObjects:ac2, ac1, nil];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
}

- (void)didEndAnimationWithNumberOffCellChange:(NSInteger)numberOfCell{
    CGFloat height = kTableViewCellHeight * numberOfCell;
    [UIView animateWithDuration:0.3 animations:^{
        self.contraintTableViewCell.constant += height;
        [self.view layoutIfNeeded];
    }];
}

#pragma mark - Action Hanlder
- (IBAction)btnLoadMoreClick:(id)sender {
    //TODO refresh data here
    [self.indicaLoadMore setHidden:NO];
    [self.indicaLoadMore startAnimating];
    [self.btnLoadMore setHidden:YES];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.indicaLoadMore setHidden:YES];
        [self.btnLoadMore setHidden:NO];
    });
}

- (IBAction)btnAddTranClick:(id)sender {
    [self performSegueWithIdentifier:kAddTransactionSegue sender:nil];
}

@end
