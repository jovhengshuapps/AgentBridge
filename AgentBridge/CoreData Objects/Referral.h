//
//  Referral.h
//  AgentBridge
//
//  Created by host24_iOS Dev on 11/20/13.
//  Copyright (c) 2013 host24_iOS Dev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Referral : NSManagedObject

@property (nonatomic, retain) NSString * agent_a;
@property (nonatomic, retain) NSString * agent_b;
@property (nonatomic, retain) NSString * agent_name;
@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) NSString * client_id;
@property (nonatomic, retain) NSString * client_intention;
@property (nonatomic, retain) NSString * client_name;
@property (nonatomic, retain) NSString * counter;
@property (nonatomic, retain) NSString * countered;
@property (nonatomic, retain) NSString * countries_iso_code_3;
@property (nonatomic, retain) NSString * countries_name;
@property (nonatomic, retain) NSString * date;
@property (nonatomic, retain) NSString * docusign_envelope;
@property (nonatomic, retain) NSString * price_1;
@property (nonatomic, retain) NSString * price_2;
@property (nonatomic, retain) NSString * property_id;
@property (nonatomic, retain) NSString * reason;
@property (nonatomic, retain) NSString * referral_fee;
@property (nonatomic, retain) NSString * referral_id;
@property (nonatomic, retain) NSString * state_code;
@property (nonatomic, retain) NSString * status;
@property (nonatomic, retain) NSString * state_name;
@property (nonatomic, retain) NSString * image;
@property (nonatomic, retain) NSData * image_data;
@property (nonatomic, retain) NSString * client_email;
@property (nonatomic, retain) NSString * client_number;
@property (nonatomic, retain) NSString * client_address_1;
@property (nonatomic, retain) NSString * client_address_2;
@property (nonatomic, retain) NSString * client_city;
@property (nonatomic, retain) NSString * client_zip;
@property (nonatomic, retain) NSString * client_country_name;
@property (nonatomic, retain) NSString * client_country_code;
@property (nonatomic, retain) NSString * client_state_code;
@property (nonatomic, retain) NSString * client_state_name;

@end
