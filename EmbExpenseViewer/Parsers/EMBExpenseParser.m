//
//  EMBExpenseParser.m
//  EmbExpenseViewer
//
//  Created by Sadiq on 15/07/26.
//

#import <Foundation/Foundation.h>

#import "EMBExpenseParser.h"
#import "EMBExpense.h"


@implementation EMBExpenseParser

+(nullable NSArray<EMBExpense *> *) expensesFromData: (NSData *)data
                                               error: (NSError **)error {
    id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:error];
    if (json == nil) {
        return nil;
    }
    
    if (![json isKindOfClass:[NSArray class]]) {
        if (error) {
            *error = [self parsingErrorWithMessage:@"Expected a json array of expneses"];
        }
        return nil;
    }
    
    NSMutableArray<EMBExpense *> *expenseList = [[NSMutableArray alloc] init];
    
    for (id item in (NSArray *) json) {
        EMBExpense *expense = nil;
        if ([item isKindOfClass:[NSDictionary class]]) {
            expense = [[EMBExpense alloc] initWithDictionary:item];
        }
        
        if (expense == nil) {
            NSLog(@"Error while parsing expense %@",item);
            continue;
        }
        
        [expenseList addObject:expense];
        
    }
    return  expenseList;
}

+(NSError *)parsingErrorWithMessage:(NSString *)mesage {
    return [NSError errorWithDomain:@"EMBExpneseParser" code:1 userInfo:@{NSLocalizedDescriptionKey: mesage}];
}

@end
