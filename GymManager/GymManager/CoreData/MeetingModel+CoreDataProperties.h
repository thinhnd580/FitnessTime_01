//
//  MeetingModel+CoreDataProperties.h
//  GymManager
//
//  Created by Thinh on 9/19/16.
//  Copyright © 2016 vantientu. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "MeetingModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MeetingModel (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *fromDate;
@property (nullable, nonatomic, retain) NSString *toDate;
@property (nullable, nonatomic, retain) CustomerModel *customer;
@property (nullable, nonatomic, retain) TrainerModel *trainer;

@end

NS_ASSUME_NONNULL_END
