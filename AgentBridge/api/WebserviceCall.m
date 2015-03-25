//
//  WebserviceCall.m
//  Autohaus
//
//  Created by IOS Developer on 3/16/15.
//  Copyright (c) 2015 JoVhengshuApps. All rights reserved.
//

#import "WebserviceCall.h"

@interface WebserviceCall ()
@property (strong, nonatomic) AFHTTPSessionManager *manager;
@end

@implementation WebserviceCall

-(void)stop {
    [[self.manager operationQueue] cancelAllOperations];
}

-(void)initCallMethod:(NSString*)method serviceURL:(NSString*)url withParameters:(NSDictionary *)parameters usingRootURL:(BOOL)rootURL withCompletionHandler:(void(^)(id responseObject))completion{
//    NSLog(@"url:%@, params:%@",url,parameters);
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
    NSURL *baseURL = [NSURL URLWithString:WSA_URL];
    
    self.manager = (rootURL)?[[AFHTTPSessionManager alloc] init]:[[AFHTTPSessionManager alloc] initWithBaseURL:baseURL];
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    manager.requestSerializer = [AFHTTPRequestSerializer serializer];

    
    self.manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    self.manager.requestSerializer = [AFJSONRequestSerializer serializer];
    self.manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json",nil];
    
    if ([method isEqualToString:@"GET"]) {
//        manager.responseSerializer = responseSerializer;
        [self.manager GET:url parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
            completion(responseObject);
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
            [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            NSLog(@"GET Error: %@", error);
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
            [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
        }];
    }
    
    else if ([method isEqualToString:@"POST"]) {
        [self.manager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
            for (NSString *key in [parameters allKeys]) {
                [formData appendPartWithFormData:[[parameters objectForKey:key] dataUsingEncoding:NSUTF8StringEncoding] name:key];
            }
        } success:^(NSURLSessionDataTask *task, id responseObject) {
            completion(responseObject);
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
            [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
            [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
            
        }];
        
    }
    
    
    
    
//    if ([method isEqualToString:@"POST"]) {
//        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
//        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//        
//        [manager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
//            
//            [formData appendPartWithFormData:[parameters[@"email"] dataUsingEncoding:NSUTF8StringEncoding] name:@"email"];
//            [formData appendPartWithFormData:[parameters[@"password"] dataUsingEncoding:NSUTF8StringEncoding] name:@"password"];
//            
//        } success:^(AFHTTPRequestOperation *operation, id responseObject) {
//            completion(responseObject);
//        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//            NSLog(@"POST Error: %@", error);
//        }];
//
//    }
//    else if ([method isEqualToString:@"GET"]){
//        
//        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//        manager.requestSerializer = [AFHTTPRequestSerializer serializer];
//        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//        
//        [manager GET:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
//            completion(responseObject);
//        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//            NSLog(@"GET Error: %@", error);
//        }];
//    }
    
    
        
        
}


@end
