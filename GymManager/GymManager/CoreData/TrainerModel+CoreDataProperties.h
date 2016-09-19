//
//  TrainerModel+CoreDataProperties.h
//  GymManager
//
//  Created by Thinh on 9/19/16.
//  Copyright © 2016 vantientu. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "TrainerModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TrainerModel (CoreDataProperties)

@property (nullable, nonatomic, retain) NSNumber *meetingMoney;
@property (nullable, nonatomic, retain) NSDate *startWorkDate;
@property (nullable, nonatomic, retain) NSSet<MeetingModel *> *meetings;

@end

@interface TrainerModel (CoreDataGeneratedAccessors)

- (void)addMeetingsObject:(MeetingModel *)value;
- (void)removeMeetingsObject:(MeetingModel *)value;
- (void)addMeetings:(NSSet<MeetingModel *> *)values;
- (void)removeMeetings:(NSSet<MeetingModel *> *)values;

@end

NS_ASSUME_NONNULL_END
