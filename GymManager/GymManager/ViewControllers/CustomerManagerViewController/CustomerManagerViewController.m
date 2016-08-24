//
//  CustomerManagerViewController.m
//  GymManager
//
//  Created by Văn Tiến Tú on 8/14/16.
//  Copyright © 2016 vantientu. All rights reserved.
//

#import "CustomerManagerViewController.h"
#import "CustomerManagerCollectionViewCell.h"
#import "AddNewCustomerViewController.h"
#import "InfoCustomerManagerViewController.h"

NSString *const kCustomerManagerCollectionViewCellIdentifier = @"CustomerManagerCollectionViewCell";
CGFloat const kCornerRadiusAddNewCustomer = 20.0f;
//TODO
NSString *const kNameCustomer = @"Ngo Van Van Duong";

@interface CustomerManagerViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, AddNewCustomerViewControllerDelegate, CustomerManagerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *buttonAddNewCustomer;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSMutableArray *arrCustomers;

@end

@implementation CustomerManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupView];
    [self getAllCustomers];
}

- (void)getAllCustomers {
    [MBProgressHUD showHUDAddedTo:self.view animated:true];
    CustomerManager *customerManager = [[CustomerManager alloc] init];
    customerManager.delegate = self;
    [customerManager getAllCustomers];
}

#pragma mark - CustomerManagerDelegate 
- (void)didResponseWithMessage:(NSString *)message withError:(NSError *)error returnArray:(NSArray *)arrCustomers {
    if (error) {
        [MBProgressHUD hideHUDForView:self.view animated:true];
        [AlertManager showAlertWithTitle:kRegisterRequest message:message viewControler:self reloadAction:^{
            [self getAllCustomers];
        }];
    } else {
        [MBProgressHUD hideHUDForView:self.view animated:true];
        self.arrCustomers = arrCustomers.mutableCopy;
        [self.collectionView reloadData];
    }
}

#pragma mark - Set up view
- (void)setupView {
    //TODO
    self.title = kCustomerManagerTitle;
    self.buttonAddNewCustomer.layer.cornerRadius = kCornerRadiusAddNewCustomer;
}

#pragma mark - UICollectionViewDataSources
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.arrCustomers.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CustomerManagerCollectionViewCell *cell = (CustomerManagerCollectionViewCell *)[collectionView
        dequeueReusableCellWithReuseIdentifier:kCustomerManagerCollectionViewCellIdentifier
        forIndexPath:indexPath];
    [cell cellWithCustomer:self.arrCustomers[indexPath.row]];
    return cell;
}

#pragma mark - UICollecitonViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    [collectionView deselectItemAtIndexPath:indexPath animated:true];
    //TODO
    UIStoryboard *customerStoryboard = [UIStoryboard
        storyboardWithName:kCustomerManagerStoryboard bundle:nil];
    if ([self.statusCustomerManagerTitle isEqualToString:kCustomerManagerVCTitle]) {
        InfoCustomerManagerViewController *infoCustomerVC = [customerStoryboard
            instantiateViewControllerWithIdentifier:kInfoCustomerManagerViewControllerIdentifier];
        infoCustomerVC.customer = self.arrCustomers[indexPath.row];
        NSLog(@"%@", self.arrCustomers[indexPath.row]);
        [self.navigationController pushViewController:infoCustomerVC animated:true];
    } else {
        [self.navigationController popViewControllerAnimated:true];
    }
    
}

#pragma mark - Button add new customer
- (IBAction)addNewCustomerPress:(id)sender {
    //TODO
    UIStoryboard *st = [UIStoryboard storyboardWithName:kCustomerManagerStoryboard bundle:nil];
    AddNewCustomerViewController *addNewCustomerVC = [st
        instantiateViewControllerWithIdentifier:kAddNewCustomerViewControllerIdentifier];
    addNewCustomerVC.delegate = self;
    [self.navigationController pushViewController:addNewCustomerVC animated:true];
}

#pragma mark - AddNewCustomerViewControllerDelegate
- (void)addNewCustomer:(Customer *)customer {
    if (!self.arrCustomers) {
        self.arrCustomers = [NSMutableArray array];
    }
    [self.arrCustomers addObject:customer];
    [self.collectionView reloadData];
}

@end
