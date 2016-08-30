//
//  ExpandableTableView.h
//  ExpandableTableView
//
//  Created by Warif Akhand Rishi on 4/13/16.
//  Copyright © 2016 Warif Akhand Rishi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Transaction.h"

@protocol ExpandableTableViewDelegate <NSObject>

- (void)didEndAnimationWithNumberOffCellChange:(NSInteger)numberOfCell;
- (void)didEditSection:(NSUInteger)section;
- (void)didDeleteSection:(NSUInteger)section;

@end

@interface ExpandableTableView : UITableView

@property (nonatomic, assign) BOOL allHeadersInitiallyCollapsed;
@property (nonatomic, assign) int initiallyExpandedSection;
@property (nonatomic, strong) id<ExpandableTableViewDelegate> expandableDelegate;

- (NSInteger)totalNumberOfRows:(NSInteger)total inSection:(NSInteger)section;
- (UIView *)headerWithTransaction:(Transaction *)transaction totalRows:(NSInteger)row inSection:(NSInteger)section;

@end
