//
//  CommonWebserviceCall.h
//  AgentBridge
//
//  Created by IOS Developer on 3/17/15.
//  Copyright (c) 2015 host24_iOS Dev. All rights reserved.
//

#ifndef AgentBridge_CommonWebserviceCall_h
#define AgentBridge_CommonWebserviceCall_h

static NSString * const WS_URL = @"http://108.163.201.122/~staginga/webservice/";
static NSString * const WS_URL_ROOT = @"http://108.163.201.122/~staginga/";

// static NSString * const WS_URL = @"https://www.agentbridge.com/webservice-and/";
// static NSString * const WS_URL_ROOT = @"https://www.agentbridge.com/";

static NSString * const WS_LOGIN = @"login.php";
static NSString * const WS_LOGIN_WS = @"index.php/component/nrds/?task=loginWebService&format=raw";
static NSString * const WS_CHANGE_PASSWORD_WS = @"index.php/component/nrds/?task=changePasswordWS&format=raw";
static NSString * const WS_SEND_INVITE = @"send_invite_b.php";
static NSString * const WS_GET_PROFILE = @"getprofile.php";
static NSString * const WS_VALIDATE_EMAIL = @"validate_invite_b.php";

static NSString * const WS_GETUSER_NETWORK_INFO = @"getuser_network_info.php";
static NSString * const WS_GET_POPs = @"getpops.php";
static NSString * const WS_GET_POPs_ByID = @"getpops_byid.php";
static NSString * const WS_GET_BUYERS = @"getbuyers.php";
static NSString * const WS_GET_BUYERS_WS = @"index.php/component/propertylisting/?task=buyers_raw&format=raw&webservice=1";
static NSString * const WS_GET_BUYERS_POPSID = @"getbuyerswpopsid.php";
static NSString * const WS_GET_POPS_IMAGES = @"getpops_images.php";
static NSString * const WS_GET_BROKER_LIST = @"get_broker_list.php";
static NSString * const WS_GET_DESIGNATION_LIST = @"get_designation_list.php";

static NSString * const WS_GET_NEW_BUYERS_LIST = @"getbuyers_new.php";
static NSString * const WS_GET_ALL_BUYERS_LIST = @"getbuyer_list_pops.php";
static NSString * const WS_GET_ALL_BUYERS_LIST_WS = @"index.php/component/propertylisting/?task=individualbuyers_raw&format=raw&webservice=1";
static NSString * const WS_GET_SAVED_BUYERS_LIST = @"getbuyers_saved.php";

static NSString * const WS_GET_DESIGNATION = @"getuser_designations.php";

static NSString * const WS_GET_MOBILE_NO = @"get_mobilenumber.php";
static NSString * const WS_GET_FAX_NO = @"get_faxnumber.php";
static NSString * const WS_GET_WORK_NO = @"get_worknumber.php";
static NSString * const WS_GET_INVITES = @"getinvites.php";

static NSString * const WS_GET_REFERRAL_IN = @"getreferral_in.php";
static NSString * const WS_GET_REFERRAL_OUT = @"getreferral_out.php";

static NSString * const WS_GET_BUYERS_NEW = @"getbuyers_new.php";
static NSString * const WS_GET_BUYERS_SAVED = @"getbuyers_saved.php";
static NSString * const WS_GET_REGISTRATION = @"getuser_registration.php";
static NSString * const WS_GET_MEMBERSHIP = @"get_membership_fee.php";
static NSString * const WS_GET_REQ_NETWORK = @"get_request_network.php";

static NSString * const WS_GET_REQ_ACCESS = @"get_request_access.php";

static NSString * const WS_REQUEST_NETWORK = @"request_network.php";

static NSString * const WS_REQUEST_ACCESS = @"request_access.php";

static NSString * const WS_GET_ACTIVITIES = @"getactivities.php";

//get activities from activity type 25
static NSString * const WS_GET_ACTIVITIES_25 = @"getactivity-25.php";
//get activities from activity type 8
static NSString * const WS_GET_ACTIVITIES_8 = @"getactivity-8.php";
//get activities from activity type 30
static NSString * const WS_GET_ACTIVITIES_30 = @"getactivity-28.php";
//get activities from activity type 11
static NSString * const WS_GET_ACTIVITIES_11 = @"getactivity-11.php";
//get buyers saved
static NSString * const WS_GET_ACTIVITIES_BUYERS_SAVED = @"getbuyers_saved.php";
//check if referral is signed
static NSString * const WS_CHECK_SIGNED_REFERRAL = @"check_if_signed_referral.php";
//save buyer
static NSString * const WS_SAVE_BUYERS = @"save_buyer.php";
//accept network
static NSString * const WS_ACCEPT_NETWORK = @"accept_network.php";
//Search by agents
static NSString * const WS_SEARCH_AGENTS = @"search_agents.php";
//Search by POPs
static NSString * const WS_SEARCH_POPS = @"search_pops.php";

static NSString * const WS_SEARCH_POPS_WS = @"index.php/component/customsearch/?task=searchlisting_raw&webservice=1&format=raw";

//Add Mobile Number
static NSString * const WS_ADD_MOBILE_NUMBER = @"add_mobilenumber.php";
//Update Mobile Number
static NSString * const WS_UPDATE_MOBILE_NUMBER = @"change_mobilenumber.php";
//Delete Mobile Number
static NSString * const WS_DELETE_MOBILE_NUMBER = @"delete_mobilenumber.php";

//Add Fax Number
static NSString * const WS_ADD_FAX_NUMBER = @"add_faxnumber.php";
//Update Fax Number
static NSString * const WS_UPDATE_FAX_NUMBER = @"change_faxnumber.php";
//Delete Fax Number
static NSString * const WS_DELETE_FAX_NUMBER = @"delete_faxnumber.php";

//Add Work Number
static NSString * const WS_ADD_WORK_NUMBER = @"add_worknumber.php";
//Update Work Number
static NSString * const WS_UPDATE_WORK_NUMBER = @"change_worknumber.php";
//Delete Work Number
static NSString * const WS_DELETE_WORK_NUMBER = @"delete_worknumber.php";

//Change Referral Status
static NSString * const WS_CHANGE_REF_STATUS = @"change_status.php";

//Get Referral Fee
static NSString * const WS_GET_REF_FEE = @"get_referral_fee.php";

//Decrypt license
static NSString * const WS_DECRYPT_LICENSE = @"decrypt_license.php";

//get countries
static NSString * const WS_GET_COUNTRIES = @"get_countries.php";

//Check first payment
static NSString * const WS_CHECK_FIRST_PAYMENT = @"check_first_payment.php";

//Send Transaction to Authorize.net
static NSString * const WS_SEND_TRANSACTION = @"send_transaction.php";

//Get User Notification Settings
static NSString * const WS_GET_NOTIFSETTINGS = @"getuser_notifSettings.php";

//Save User Notification Settings
static NSString * const WS_SAVE_NOTIFSETTINGS = @"saveuser_notifSettings.php";

static NSString * const WS_USER_ID = @"user_id";

static NSString * const WS_ACCEPT_REFERRAL = @"index.php/component/propertylisting/?task=acceptreferral&format=raw";

#endif
