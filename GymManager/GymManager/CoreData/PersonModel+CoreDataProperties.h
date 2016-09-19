//
//  PersonModel+CoreDataProperties.h
//  GymManager
//
//  Created by Thinh on 9/19/16.
//  Copyright © 2016 vantientu. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "PersonModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PersonModel (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *address;
@property (nullable, nonatomic, retain) NSString *avatarUrl;
@property (nullable, nonatomic, retain) NSDate *birthday;
@property (nullable, nonatomic, retain) NSString *email;
@property (nullable, nonatomic, retain) NSString *fullName;
@property (nullable, nonatomic, retain) NSString *telNumber;

@end

NS_ASSUME_NONNULL_END
