//
//  TransactionModel+CoreDataProperties.h
//  GymManager
//
//  Created by Thinh on 9/19/16.
//  Copyright © 2016 vantientu. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "TransactionModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TransactionModel (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *createAt;
@property (nullable, nonatomic, retain) NSNumber *totalPrice;
@property (nullable, nonatomic, retain) CustomerModel *customer;
@property (nullable, nonatomic, retain) NSSet<ItemModel *> *items;

@end

@interface TransactionModel (CoreDataGeneratedAccessors)

- (void)addItemsObject:(ItemModel *)value;
- (void)removeItemsObject:(ItemModel *)value;
- (void)addItems:(NSSet<ItemModel *> *)values;
- (void)removeItems:(NSSet<ItemModel *> *)values;

@end

NS_ASSUME_NONNULL_END
