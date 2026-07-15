//
//  EMBExpenseService.m
//  EmbExpenseViewer
//
//  Created by Sadiq on 15/07/26.
//

#import <Foundation/Foundation.h>
#import "EMBExpenseService.h"
#import "EMBExpense.h"
#import "EMBExpenseParser.h"
#import "EMBAPIClient.h"

@interface EMBExpenseService()

@property (strong, readonly) NSURL *endPointURL;
@property (strong, readonly) EMBAPIClient *apiClient;

@end

@implementation EMBExpenseService

- (instancetype)initWithEndpointURL:(NSURL *)endpointURL {
    EMBAPIClient *client = [[EMBAPIClient alloc] initWithSession:[NSURLSession sharedSession]];
    return [self initWithEndPointURL:endpointURL client:client];
}

-(instancetype)initWithEndPointURL:(NSURL *)endPointURL
                           client:(EMBAPIClient *)client {
    self = [super init];
    if (self) {
        _endPointURL = endPointURL;
        _apiClient = client;
    }
    return self;
}

-(void)fetchExpensesWithCompletionHandler:(void(^)( NSArray <EMBExpense *> * _Nullable expenses,
                                                   NSError * _Nullable error))completionHandler {
    [self.apiClient fetchDataFromURL:self.endPointURL
                completionHandler:^(NSData * _Nullable data, NSError * _Nullable error) {
        if (data == nil) {
            completionHandler(nil, error);
            return;
        }

        NSError *parseError = nil;
        NSArray<EMBExpense *> *expenses = [EMBExpenseParser expensesFromData:data error:&parseError];
        completionHandler(expenses, parseError);
    }];
}

@end
