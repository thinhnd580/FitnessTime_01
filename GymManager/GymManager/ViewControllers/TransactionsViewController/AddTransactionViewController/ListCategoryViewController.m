//
//  ListCategoryViewController.m
//  GymManager
//
//  Created by Thinh on 8/15/16.
//  Copyright © 2016 vantientu. All rights reserved.
//

#import "ListCategoryViewController.h"
#import "CategoryCell.h"
#import "PopoverQuatityViewController.h"

static NSString *const kCellIndentifier = @"CategoryCell";
static NSString *const kShowQuantitySegue = @"ShowQuatitySegue";

@interface ListCategoryViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *arrCategory;

@end

@implementation ListCategoryViewController

#pragma mark - View's life
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.navigationController setNavigationBarHidden:NO];
    self.arrCategory = [NSMutableArray arrayWithObjects:@"1", @"2", @"3", nil];
    [self.tableView registerNib:[UINib nibWithNibName:kCellIndentifier bundle:nil] forCellReuseIdentifier:kCellIndentifier];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView implementation
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.arrCategory count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIndentifier forIndexPath:indexPath];
    cell.lbCategory.text = [self.arrCategory objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:kShowQuantitySegue sender:indexPath];
}

#pragma mark - Button Hanlder
- (IBAction)btnCancelClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:kShowQuantitySegue]) {
        PopoverQuatityViewController *quantityVC = segue.destinationViewController;
        [quantityVC didEnterQuantityWithCompletionBlock:^(NSUInteger quantity) {
            NSLog(@"Quantity : %d with row: %d", quantity, ((NSIndexPath*)sender).row);
            [self dismissViewControllerAnimated:YES completion:nil];
        }];
    }
}

@end