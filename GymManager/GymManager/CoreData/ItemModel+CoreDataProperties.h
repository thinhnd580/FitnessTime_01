//
//  ItemModel+CoreDataProperties.h
//  GymManager
//
//  Created by Thinh on 9/19/16.
//  Copyright © 2016 vantientu. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "ItemModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ItemModel (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *name;
@property (nullable, nonatomic, retain) NSNumber *price;
@property (nullable, nonatomic, retain) NSNumber *quantity;
@property (nullable, nonatomic, retain) NSSet<TransactionModel *> *transactions;

@end

@interface ItemModel (CoreDataGeneratedAccessors)

- (void)addTransactionsObject:(TransactionModel *)value;
- (void)removeTransactionsObject:(TransactionModel *)value;
- (void)addTransactions:(NSSet<TransactionModel *> *)values;
- (void)removeTransactions:(NSSet<TransactionModel *> *)values;

@end

NS_ASSUME_NONNULL_END
