//
//  ABridge_AddBuyerViewController.h
//  AgentBridge
//
//  Created by Joshua Jose Pecson on 3/22/15.
//  Copyright (c) 2015 host24_iOS Dev. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ABridge_AddBuyerViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *textFieldPropertyName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldZipcode;
@property (weak, nonatomic) IBOutlet UILabel *labelCityState;
@property (weak, nonatomic) IBOutlet UIButton *btnPropertyType;
@property (weak, nonatomic) IBOutlet UIButton *btnSubPropertyType;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPrice;
@property (weak, nonatomic) IBOutlet UIButton *btnPropertyFeatures;
- (IBAction)propertyTypePressed:(id)sender;
- (IBAction)subPropertyTypePressed:(id)sender;
- (IBAction)propertyFeaturesPressed:(id)sender;


@end
