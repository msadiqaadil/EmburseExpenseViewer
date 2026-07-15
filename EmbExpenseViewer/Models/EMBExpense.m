//
//  EMBExpense.m
//  EmbExpenseViewer
//
//  Created by Sadiq on 15/07/26.
//

#import "EMBExpense.h"


@implementation EMBExpense

- (nullable instancetype)initWithDictionary:(NSDictionary *)dictionary {
    NSString *identifier = dictionary[@"id"];
    NSString *title = dictionary[@"title"];
    NSNumber *amount = dictionary[@"amount"];
    NSString *dateString = dictionary[@"date"];


    if (![identifier isKindOfClass:[NSString class]] ||
        ![title isKindOfClass:[NSString class]] ||
        ![amount isKindOfClass:[NSNumber class]] ||
        ![dateString isKindOfClass:[NSString class]]) {
        return nil;
    }

    NSISO8601DateFormatter *dateFormatter = [[NSISO8601DateFormatter alloc] init];
    NSDate *date = [dateFormatter dateFromString:dateString];
    if (date == nil) {
        return nil;
    }

    return [self initWithExpenseID:identifier title:title amount:amount.doubleValue date:date];
}

-(instancetype) initWithExpenseID: (NSString * )expenseID
                            title: (NSString *) title
                           amount: (double)amount
                             date: (NSDate *)date  {
    self = [super init];
    if (self) {
        _expenseID = expenseID;
        _title = title;
        _amount = amount;
        _date = date;
    }
    return self;
}

@end
