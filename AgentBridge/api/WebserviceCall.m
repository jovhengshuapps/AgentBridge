//
//  WebserviceCall.m
//  Autohaus
//
//  Created by IOS Developer on 3/16/15.
//  Copyright (c) 2015 JoVhengshuApps. All rights reserved.
//

#import "WebserviceCall.h"

@implementation WebserviceCall
@synthesize reachabilityManager;

-(void)initCallWithServiceURL:(NSString*)url withParameters:(NSDictionary *)parameters withCompletionHandler:(void(^)(id responseObject))completion{
    
        self.reachabilityManager = [Reachability reachabilityWithHostName:url];
        
        NSLog(@"reachability:%@",[self.reachabilityManager currentReachabilityString]);
        
        NSURL *urlURL = [NSURL URLWithString:url];
        NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:urlURL];
    request.HTTPMethod = @"POST";
//    request.HTTPBody = [@"email=rebekahroque@ymail.com&password=Umberto3" dataUsingEncoding:NSUTF8StringEncoding];
    
        AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
        operation.responseSerializer = [AFHTTPResponseSerializer serializer];
        
        [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            completion(responseObject);
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Error Retrieving Weather"
                                                                message:[error localizedDescription]
                                                               delegate:nil
                                                      cancelButtonTitle:@"Ok"
                                                      otherButtonTitles:nil];
            [alertView show];
        }];
        
        [operation start];
    
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    
//    [manager POST:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        NSLog(@"JSON: %@", responseObject);
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        NSLog(@"Error: %@", error);
//    }];
    
    
    
        
        
}


@end
