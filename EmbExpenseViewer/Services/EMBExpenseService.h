//
//  EMBExpenseService.h
//  EmbExpenseViewer
//
//  Created by Sadiq on 15/07/26.
//

#ifndef EMBExpenseService_h
#define EMBExpenseService_h
#import <Foundation/Foundation.h>

@class EMBExpense;
@class EMBAPIClient;

NS_ASSUME_NONNULL_BEGIN

@interface EMBExpenseService : NSObject

-(instancetype)initWithEndpointURL:(nullable NSURL *) endpointURL;
-(instancetype)initWithEndPointURL:(NSURL *)endPointURL
                           client:(EMBAPIClient *)client;
-(void)fetchExpensesWithCompletionHandler:(void(^)( NSArray <EMBExpense *> * _Nullable expenses,
                                                   NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END


#endif /* EMBExpenseService_h */
