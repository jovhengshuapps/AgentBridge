//
//  WebserviceCall.m
//  Autohaus
//
//  Created by IOS Developer on 3/16/15.
//  Copyright (c) 2015 JoVhengshuApps. All rights reserved.
//

#import "WebserviceCall.h"

@implementation WebserviceCall

-(void)initCallMethod:(NSString*)method serviceURL:(NSString*)url withParameters:(NSDictionary *)parameters withCompletionHandler:(void(^)(id responseObject))completion{
    NSLog(@"url:%@, params:%@",url,parameters);
    if ([method isEqualToString:@"POST"]) {
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        
        [manager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
            
            [formData appendPartWithFormData:[parameters[@"email"] dataUsingEncoding:NSUTF8StringEncoding] name:@"email"];
            [formData appendPartWithFormData:[parameters[@"password"] dataUsingEncoding:NSUTF8StringEncoding] name:@"password"];
            
        } success:^(AFHTTPRequestOperation *operation, id responseObject) {
            completion(responseObject);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"POST Error: %@", error);
        }];

    }
    else if ([method isEqualToString:@"GET"]){
        
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        
        [manager GET:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
            completion(responseObject);
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"GET Error: %@", error);
        }];
    }
    
    
        
        
}


@end
