//
//  EMBExpense.h
//  EmbExpenseViewer
//
//  Created by Sadiq on 15/07/26.
//

#import <Foundation/Foundation.h>

#ifndef EMBExpense_h
#define EMBExpense_h

@interface EMBExpense : NSObject
NS_ASSUME_NONNULL_BEGIN
@property (readonly) NSString *expenseID NS_SWIFT_NAME(id);
@property (readonly) NSString *title;
@property (readonly) double amount;
@property (readonly) NSDate *date;

- (nullable instancetype)initWithDictionary:(NSDictionary *)dictionary;

NS_ASSUME_NONNULL_END
@end

#endif /* EMBExpense_h */
