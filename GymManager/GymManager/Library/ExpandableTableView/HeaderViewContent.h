//
//  HeaderViewContent.h
//  GymManager
//
//  Created by Thinh on 8/12/16.
//  Copyright © 2016 vantientu. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HeaderViewDelegate;

@interface HeaderViewContent : UITableViewHeaderFooterView

@property (nonatomic, assign) id<HeaderViewDelegate> delegate;
@property (nonatomic, readonly) NSInteger section;
@property (nonatomic, readonly) NSInteger totalRows;
@property (weak, nonatomic) IBOutlet UILabel *lbCusName;
@property (weak, nonatomic) IBOutlet UILabel *lbTotalCost;
@property (weak, nonatomic) IBOutlet UILabel *lbDate;

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier andFrame:(CGRect)frame;
- (void)drawView;
- (void)updateWithTitle:(NSString *)title isCollapsed:(BOOL)isCollapsed totalRows:(NSInteger)row andSection:(NSInteger)section;
- (void)hideLoadingView:(BOOL)hide;

@end

@protocol HeaderViewDelegate <NSObject>

- (void)didTapHeader:(HeaderViewContent *)view;
- (void)didPickActionSheetAtIndex:(NSUInteger)index withHeaderView:(HeaderViewContent *)headerView;

@end