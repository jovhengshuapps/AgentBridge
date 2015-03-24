//
//  Activity.h
//  AgentBridge
//
//  Created by Joshua Jose Pecson on 3/24/15.
//  Copyright (c) 2015 host24_iOS Dev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Activity : NSManagedObject

@property (nonatomic, retain) NSString * access_id;
@property (nonatomic, retain) NSString * activities_id;
@property (nonatomic, retain) NSString * activity_id;
@property (nonatomic, retain) NSString * activity_type;
@property (nonatomic, retain) NSString * buyer_id;
@property (nonatomic, retain) NSString * buyer_name;
@property (nonatomic, retain) NSString * client_id;
@property (nonatomic, retain) NSString * date;
@property (nonatomic, retain) NSString * image;
@property (nonatomic, retain) NSData * image_data;
@property (nonatomic, retain) NSString * listing_id;
@property (nonatomic, retain) NSString * network_id;
@property (nonatomic, retain) NSString * network_status;
@property (nonatomic, retain) NSString * other_user_id;
@property (nonatomic, retain) NSString * other_user_name;
@property (nonatomic, retain) NSString * permission;
@property (nonatomic, retain) NSString * pops_user_id;
@property (nonatomic, retain) NSString * pops_user_name;
@property (nonatomic, retain) NSString * property_name;
@property (nonatomic, retain) NSString * referral_buyer_name;
@property (nonatomic, retain) NSString * referral_date;
@property (nonatomic, retain) NSString * referral_fee;
@property (nonatomic, retain) NSString * referral_id;
@property (nonatomic, retain) NSString * referral_response;
@property (nonatomic, retain) NSNumber * referral_status;
@property (nonatomic, retain) NSString * referral_update_id;
@property (nonatomic, retain) NSString * setting;
@property (nonatomic, retain) NSString * user_id;
@property (nonatomic, retain) NSString * user_name;
@property (nonatomic, retain) NSString * selected_permission;
@property (nonatomic, retain) NSString * docusign_envelope;
@property (nonatomic, retain) NSString * edited_by;
@property (nonatomic, retain) NSString * has_multiples;
@property (nonatomic, retain) NSString * client_name;
@property (nonatomic, retain) NSString * label;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * other_image;
@property (nonatomic, retain) NSString * pkId;
@property (nonatomic, retain) NSString * pocket_closed;
@property (nonatomic, retain) NSString * pocket_id;
@property (nonatomic, retain) NSString * pocket_name;
@property (nonatomic, retain) NSString * pocket_userId;
@property (nonatomic, retain) NSString * pops_setting;
@property (nonatomic, retain) NSString * ref_status;
@property (nonatomic, retain) NSString * req_access_per;
@property (nonatomic, retain) NSString * req_net_status;

@end
