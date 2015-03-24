//
//  CommonWebserviceCall.h
//  AgentBridge
//
//  Created by IOS Developer on 3/17/15.
//  Copyright (c) 2015 host24_iOS Dev. All rights reserved.
//

#ifndef AgentBridge_CommonWebserviceCall_h
#define AgentBridge_CommonWebserviceCall_h

#define WS_URL  @"http://108.163.201.122/~staginga/webservice/"
#define WS_URL_ROOT  @"http://108.163.201.122/~staginga/"

#define WSA_URL  @"https://www.agentbridge.com/webservice-and/"
#define WSA_URL_ROOT  @"https://www.agentbridge.com/"

#define WS_LOGIN  @"login.php"
#define WS_LOGIN_WS  @"index.php/component/nrds/?task=loginWebService&format=raw"
#define WS_CHANGE_PASSWORD_WS  @"index.php/component/nrds/?task=changePasswordWS&format=raw"
#define WS_SEND_INVITE  @"send_invite_b.php"
#define WS_GET_PROFILE  @"getprofile.php"
#define WS_VALIDATE_EMAIL  @"validate_invite_b.php"

#define WS_GETUSER_PROFILE_INFO @"getuser_info.php"
#define WS_REGISTER_DEVICE @"register_device.php"

#define WS_GETUSER_NETWORK_INFO  @"getuser_network_info.php"
#define WS_GET_POPs  @"getpops.php"
#define WS_GET_POPs_ByID  @"getpops_byid.php"
#define WS_GET_BUYERS  @"getbuyers.php"
#define WS_GET_BUYERS_WS  @"index.php/component/propertylisting/?task=buyers_raw&format=raw&webservice1"
#define WS_GET_BUYERS_POPSID  @"getbuyerswpopsid.php"
#define WS_GET_POPS_IMAGES  @"getpops_images.php"
#define WS_GET_BROKER_LIST  @"get_broker_list.php"
#define WS_GET_DESIGNATION_LIST  @"get_designation_list.php"

#define WS_GET_NEW_BUYERS_LIST  @"getbuyers_new.php"
#define WS_GET_ALL_BUYERS_LIST  @"getbuyer_list_pops.php"
#define WS_GET_ALL_BUYERS_LIST_WS  @"index.php/component/propertylisting/?task=individualbuyers_raw&format=raw&webservice1"
#define WS_GET_SAVED_BUYERS_LIST  @"getbuyers_saved.php"

#define WS_GET_DESIGNATION  @"getuser_designations.php"

#define WS_GET_MOBILE_NO  @"get_mobilenumber.php"
#define WS_GET_FAX_NO  @"get_faxnumber.php"
#define WS_GET_WORK_NO  @"get_worknumber.php"
#define WS_GET_INVITES  @"getinvites.php"

#define WS_GET_REFERRAL_IN  @"getreferral_in.php"
#define WS_GET_REFERRAL_OUT  @"getreferral_out.php"

#define WS_GET_BUYERS_NEW  @"getbuyers_new.php"
#define WS_GET_BUYERS_SAVED  @"getbuyers_saved.php"
#define WS_GET_REGISTRATION  @"getuser_registration.php"
#define WS_GET_MEMBERSHIP  @"get_membership_fee.php"
#define WS_GET_REQ_NETWORK  @"get_request_network.php"

#define WS_GET_REQ_ACCESS  @"get_request_access.php"

#define WS_REQUEST_NETWORK  @"request_network.php"

#define WS_REQUEST_ACCESS  @"request_access.php"

#define WS_GET_ACTIVITIES  @"getactivities.php"

//get activities from activity type 25
#define WS_GET_ACTIVITIES_25  @"getactivity-25.php"
//get activities from activity type 8
#define WS_GET_ACTIVITIES_8  @"getactivity-8.php"
//get activities from activity type 30
#define WS_GET_ACTIVITIES_30  @"getactivity-28.php"
//get activities from activity type 11
#define WS_GET_ACTIVITIES_11  @"getactivity-11.php"
//get buyers saved
#define WS_GET_ACTIVITIES_BUYERS_SAVED  @"getbuyers_saved.php"
//check if referral is signed
#define WS_CHECK_SIGNED_REFERRAL  @"check_if_signed_referral.php"
//save buyer
#define WS_SAVE_BUYERS  @"save_buyer.php"
//accept network
#define WS_ACCEPT_NETWORK  @"accept_network.php"
//Search by agents
#define WS_SEARCH_AGENTS  @"search_agents.php"
//Search by POPs
#define WS_SEARCH_POPS  @"search_pops.php"

#define WS_SEARCH_POPS_WS  @"index.php/component/customsearch/?task=searchlisting_raw&webservice1&format=raw"

//Add Mobile Number
#define WS_ADD_MOBILE_NUMBER  @"add_mobilenumber.php"
//Update Mobile Number
#define WS_UPDATE_MOBILE_NUMBER  @"change_mobilenumber.php"
//Delete Mobile Number
#define WS_DELETE_MOBILE_NUMBER  @"delete_mobilenumber.php"

//Add Fax Number
#define WS_ADD_FAX_NUMBER  @"add_faxnumber.php"
//Update Fax Number
#define WS_UPDATE_FAX_NUMBER  @"change_faxnumber.php"
//Delete Fax Number
#define WS_DELETE_FAX_NUMBER  @"delete_faxnumber.php"

//Add Work Number
#define WS_ADD_WORK_NUMBER  @"add_worknumber.php"
//Update Work Number
#define WS_UPDATE_WORK_NUMBER  @"change_worknumber.php"
//Delete Work Number
#define WS_DELETE_WORK_NUMBER  @"delete_worknumber.php"

//Change Referral Status
#define WS_CHANGE_REF_STATUS  @"change_status.php"

//Get Referral Fee
#define WS_GET_REF_FEE  @"get_referral_fee.php"

//Decrypt license
#define WS_DECRYPT_LICENSE  @"decrypt_license.php"

//get countries
#define WS_GET_COUNTRIES  @"get_countries.php"

//Check first payment
#define WS_CHECK_FIRST_PAYMENT  @"check_first_payment.php"

//Send Transaction to Authorize.net
#define WS_SEND_TRANSACTION  @"send_transaction.php"

//Get User Notification Settings
#define WS_GET_NOTIFSETTINGS  @"getuser_notifSettings.php"

//Save User Notification Settings
#define WS_SAVE_NOTIFSETTINGS  @"saveuser_notifSettings.php"

#define WS_USER_ID  @"user_id"

#define WS_ACCEPT_REFERRAL  @"index.php/component/propertylisting/?task=acceptreferral&format=raw"

#endif
