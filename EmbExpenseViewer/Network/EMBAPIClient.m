//
//  EMBAPIClient.m
//  EmbExpenseViewer
//
//  Created by Sadiq on 15/07/26.
//

#import <Foundation/Foundation.h>
#import "EMBAPIClient.h"

NS_ASSUME_NONNULL_BEGIN
@interface EMBAPIClient()
@property (readonly) NSURLSession * session;
@end

@implementation EMBAPIClient

-(instancetype)initWithSession: (NSURLSession *)session {
    self = [super init];
    if (self) {
        _session = session;
    }
    return self;
}

-(void)fetchDataFromURL:(NSURL *)url
                        completionHandler:(void(^) (NSData * _Nullable data,
                                                    NSError * _Nullable error))completionHandler {
    NSURLSessionDataTask * task = [self.session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error != nil) {
            completionHandler(nil, error);
            return;
        }
        if (data == nil) {
            completionHandler(nil, [NSError errorWithDomain:@"EXPAPIClient"
                                                       code:1
                                                   userInfo:@{NSLocalizedDescriptionKey: @"Empty response"}]);
            return;
        }
        completionHandler(data, nil);
    }];
    
    [task resume];
}

@end
NS_ASSUME_NONNULL_END
