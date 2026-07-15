//
//  EMBAPIClient.h
//  EmbExpenseViewer
//
//  Created by Sadiq on 15/07/26.
//

#ifndef EMBApiClient_h
#define EMBApiClient_h

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface EMBAPIClient : NSObject

-(instancetype)initWithSession: (NSURLSession *)session;
-(void)fetchDataFromURL:(NSURL *)url
                        completionHandler:(void(^) (NSData * _Nullable data,
                                                    NSError * _Nullable error))completionHandler;

@end

NS_ASSUME_NONNULL_END

#endif /* EMBApiClient_h */
