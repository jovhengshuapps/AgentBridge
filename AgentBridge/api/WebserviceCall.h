//
//  WebserviceCall.h
//  Autohaus
//
//  Created by IOS Developer on 3/16/15.
//  Copyright (c) 2015 JoVhengshuApps. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"
#import "Reachability.h"
#import "AFNetworking.h"
//#import "WebserviceCallURL.h"


typedef NS_ENUM(NSInteger, WebserviceCallResponse) {
    WebserviceCallResponseNotFound,
    WebserviceCallResponseSuccessful,
    WebserviceCallResponseDuplicateEntry,
    WebserviceCallResponseSavingError,
    WebserviceCallResponseEmailFailed,
    WebserviceCallResponseWrongCredentials
};


@interface WebserviceCall : NSObject <NSURLConnectionDelegate>{
    NSMutableData *_responseData;
}

@property (strong, nonatomic) Reachability *reachabilityManager;

-(void)initCallWithServiceURL:(NSString*)url withParameters:(NSDictionary *)parameters withCompletionHandler:(void(^)(id responseObject))completion;

@end
