//
//  Receipt+CoreDataProperties.h
//  Receipts++
//
//  Created by Rosalyn Kingsmill on 2016-05-26.
//  Copyright © 2016 Rosalyn Kingsmill. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Receipt.h"

NS_ASSUME_NONNULL_BEGIN

@interface Receipt (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *event;
@property (nullable, nonatomic, retain) NSDate *date;
@property (nullable, nonatomic, retain) NSDecimalNumber *amount;
@property (nullable, nonatomic, retain) NSSet<NSManagedObject *> *tags;

@end

@interface Receipt (CoreDataGeneratedAccessors)

- (void)addTagsObject:(NSManagedObject *)value;
- (void)removeTagsObject:(NSManagedObject *)value;
- (void)addTags:(NSSet<NSManagedObject *> *)values;
- (void)removeTags:(NSSet<NSManagedObject *> *)values;

@end

NS_ASSUME_NONNULL_END
