//
//  EMBExpenseParser.h
//  EmbExpenseViewer
//
//  Created by Sadiq on 15/07/26.
//

#ifndef EMBExpenseParser_h
#define EMBExpenseParser_h

#import <Foundation/Foundation.h>

@class EMBExpense;

NS_ASSUME_NONNULL_BEGIN
@interface EMBExpenseParser : NSObject

+(nullable NSArray<EMBExpense *> *) expensesFromData: (NSData *)data
                                            error: (NSError **)error;

@end
NS_ASSUME_NONNULL_END
#endif /* EMBExpenseParser_h */
