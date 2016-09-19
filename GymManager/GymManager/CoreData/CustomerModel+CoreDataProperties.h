//
//  CustomerModel+CoreDataProperties.h
//  GymManager
//
//  Created by Thinh on 9/19/16.
//  Copyright © 2016 vantientu. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "CustomerModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CustomerModel (CoreDataProperties)

@property (nullable, nonatomic, retain) NSDate *expiryDate;
@property (nullable, nonatomic, retain) NSDate *registryDate;
@property (nullable, nonatomic, retain) NSSet<MeetingModel *> *meetings;
@property (nullable, nonatomic, retain) NSSet<TransactionModel *> *transactions;

@end

@interface CustomerModel (CoreDataGeneratedAccessors)

- (void)addMeetingsObject:(MeetingModel *)value;
- (void)removeMeetingsObject:(MeetingModel *)value;
- (void)addMeetings:(NSSet<MeetingModel *> *)values;
- (void)removeMeetings:(NSSet<MeetingModel *> *)values;

- (void)addTransactionsObject:(TransactionModel *)value;
- (void)removeTransactionsObject:(TransactionModel *)value;
- (void)addTransactions:(NSSet<TransactionModel *> *)values;
- (void)removeTransactions:(NSSet<TransactionModel *> *)values;

@end

NS_ASSUME_NONNULL_END
