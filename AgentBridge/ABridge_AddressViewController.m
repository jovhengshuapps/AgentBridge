//
//  ABridge_AddressViewController.m
//  AgentBridge
//
//  Created by host24_iOS Dev on 11/28/13.
//  Copyright (c) 2013 host24_iOS Dev. All rights reserved.
//

#import "ABridge_AddressViewController.h"
#import "AgentProfile.h"
#import "State.h"
#import "Country.h"

@interface ABridge_AddressViewController ()
@property (weak, nonatomic) IBOutlet UILabel *aboutMeTitle;
@property (weak, nonatomic) IBOutlet UILabel *addressHeader;
@property (weak, nonatomic) IBOutlet UITextField *textFieldAddress1;
@property (weak, nonatomic) IBOutlet UITextField *textFieldAddress2;
@property (weak, nonatomic) IBOutlet UITextField *textFieldZipCode;
@property (weak, nonatomic) IBOutlet UITextField *textFieldCity;
@property (weak, nonatomic) IBOutlet UIButton *buttonCountry;
@property (weak, nonatomic) IBOutlet UIButton *buttonState;
@property (weak, nonatomic) IBOutlet UIButton *buttonSave;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerState;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerCountry;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorState;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorCountry;
@property (weak, nonatomic) IBOutlet UIView *viewPickerCountry;
@property (weak, nonatomic) IBOutlet UIView *viewPickerState;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
- (IBAction)saveAddress:(id)sender;
- (IBAction)backButton:(id)sender;
- (IBAction)selectState:(id)sender;
- (IBAction)selectCountry:(id)sender;

@property (strong, nonatomic) NSString *state_code;
@property (strong, nonatomic) NSString *country_code_3;
@property (strong, nonatomic) NSMutableArray *arrayOfState;
@property (strong, nonatomic) NSMutableArray *arrayOfCountry;
@property (strong, nonatomic) NSMutableArray *arrayOfCountry_ID;
@end

@implementation ABridge_AddressViewController
@synthesize state_code;
@synthesize country_code_3;
@synthesize arrayOfState;
@synthesize arrayOfCountry;
@synthesize arrayOfCountry_ID;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.slidingViewController.underRightViewController = nil;
    
    self.aboutMeTitle.font = FONT_OPENSANS_REGULAR(FONT_SIZE_TITLE);
    self.addressHeader.font = FONT_OPENSANS_REGULAR(FONT_SIZE_REGULAR);
    self.textFieldAddress1.font = FONT_OPENSANS_REGULAR(FONT_SIZE_REGULAR);
    self.textFieldAddress2.font = FONT_OPENSANS_REGULAR(FONT_SIZE_REGULAR);
    self.textFieldZipCode.font = FONT_OPENSANS_REGULAR(FONT_SIZE_REGULAR);
    self.textFieldCity.font = FONT_OPENSANS_REGULAR(FONT_SIZE_REGULAR);
    self.buttonSave.titleLabel.font = FONT_OPENSANS_BOLD(FONT_SIZE_SMALL);
    self.buttonState.titleLabel.font = FONT_OPENSANS_REGULAR(FONT_SIZE_REGULAR);
    self.buttonCountry.titleLabel.font = FONT_OPENSANS_REGULAR(FONT_SIZE_REGULAR);
    
    self.activityIndicator.hidden = YES;
    
    [self addPaddingAndBorder:self.textFieldAddress1 color:[UIColor colorWithRed:178.0f/255.0f green:178.0f/255.0f blue:178.0f/255.0f alpha:1.0f]];
    
    [self addPaddingAndBorder:self.textFieldAddress2 color:[UIColor colorWithRed:178.0f/255.0f green:178.0f/255.0f blue:178.0f/255.0f alpha:1.0f]];
    
    [self addPaddingAndBorder:self.textFieldZipCode color:[UIColor colorWithRed:178.0f/255.0f green:178.0f/255.0f blue:178.0f/255.0f alpha:1.0f]];
    
    [self addPaddingAndBorder:self.textFieldCity color:[UIColor colorWithRed:178.0f/255.0f green:178.0f/255.0f blue:178.0f/255.0f alpha:1.0f]];
    
    self.buttonState.layer.borderColor = [UIColor colorWithRed:178.0f/255.0f green:178.0f/255.0f blue:178.0f/255.0f alpha:1.0f].CGColor;
    self.buttonState.layer.borderWidth = 1.0f;
    
    self.buttonCountry.layer.borderColor = [UIColor colorWithRed:178.0f/255.0f green:178.0f/255.0f blue:178.0f/255.0f alpha:1.0f].CGColor;
    self.buttonCountry.layer.borderWidth = 1.0f;
    
    NSManagedObjectContext *context = ((ABridge_AppDelegate *)[[UIApplication sharedApplication] delegate]).managedObjectContext;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"LoginDetails"
                                              inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSError *error = nil;
    LoginDetails *loginDetails = (LoginDetails*)[[context executeFetchRequest:fetchRequest error:&error] firstObject];
    
    NSFetchRequest *fetchRequestProfile = [[NSFetchRequest alloc] init];
    NSEntityDescription *entityProfile = [NSEntityDescription entityForName:@"AgentProfile"
                                                     inManagedObjectContext:context];
    [fetchRequestProfile setEntity:entityProfile];
    
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"user_id == %@", loginDetails.user_id];
    [fetchRequestProfile setPredicate:predicate];
    
    NSError *errorProfile = nil;
    AgentProfile *profile = (AgentProfile*)[[context executeFetchRequest:fetchRequestProfile error:&errorProfile] firstObject];
    
    self.textFieldAddress1.text = @"";
    self.textFieldAddress1.text = profile.street_address;
    
    self.textFieldAddress2.text = @"";
    self.textFieldAddress2.text = profile.suburb;
    
    self.textFieldCity.text = @"";
    self.textFieldCity.text = profile.city;
    
    self.textFieldZipCode.text = @"";
    self.textFieldZipCode.text = profile.zip;
    
    [self.buttonState setTitle:profile.state_name forState:UIControlStateNormal];
    [self.buttonCountry setTitle:profile.countries_name forState:UIControlStateNormal];
    
    //get Countries
    self.buttonCountry.enabled = NO;
    self.buttonCountry.backgroundColor = [UIColor lightGrayColor];
    self.activityIndicatorCountry.hidden = NO;
    NSString *urlString = @"http://agentbridge.com/webservice/getdb_country.php";
    
    __block NSError *errorData = nil;
    __weak ASIHTTPRequest *requestCountry = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:urlString]];
    [requestCountry setCompletionBlock:^{
        // Use when fetching text data
        //                        NSString *responseString = [request responseString];
        // Use when fetching binary data
        NSData *responseData = [requestCountry responseData];
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingAllowFragments error:&errorData];
        
        if (self.arrayOfCountry == nil) {
            self.arrayOfCountry = [[NSMutableArray alloc] init];
        }
        
        for (NSDictionary *entry in [json objectForKey:@"data"]) {
            [self.self.arrayOfCountry addObject:[entry objectForKey:@"countries_name"]];
        }
        
        
        if (self.arrayOfCountry_ID == nil) {
            self.arrayOfCountry_ID = [[NSMutableArray alloc] init];
        }
        
        for (NSDictionary *entry in [json objectForKey:@"data"]) {
            [self.self.arrayOfCountry_ID addObject:[entry objectForKey:@"countries_id"]];
        }
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.buttonCountry.enabled = YES;
            self.buttonCountry.backgroundColor = [UIColor whiteColor];
            self.activityIndicatorCountry.hidden = YES;
            
            [self.pickerCountry reloadAllComponents];
            
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
            [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
            
        });
        
    }];
    [requestCountry setFailedBlock:^{
        NSError *error = [requestCountry error];
        NSLog(@" error:%@",error);
        
    }];
    [requestCountry startAsynchronous];
    
    //get States
    self.buttonState.enabled = NO;
    self.buttonState.backgroundColor = [UIColor lightGrayColor];
    self.activityIndicatorState.hidden = NO;
    urlString = @"http://agentbridge.com/webservice/getdb_state.php";
    
    __weak ASIHTTPRequest *requestState = [ASIHTTPRequest requestWithURL:[NSURL URLWithString:urlString]];
    [requestState setCompletionBlock:^{
        // Use when fetching text data
        //                        NSString *responseString = [request responseString];
        // Use when fetching binary data
        NSData *responseData = [requestState responseData];
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingAllowFragments error:&errorData];
        
        if (self.arrayOfState == nil) {
            self.arrayOfState = [[NSMutableArray alloc] init];
        }
        
        for (NSDictionary *entry in [json objectForKey:@"data"]) {
            [self.self.arrayOfState addObject:[entry objectForKey:@"zone_name"]];
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            self.buttonState.enabled = YES;
            self.buttonState.backgroundColor = [UIColor whiteColor];
            self.activityIndicatorState.hidden = YES;
            
            [self.pickerState reloadAllComponents];
            
            [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
            [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
        });
        
    }];
    [requestState setFailedBlock:^{
        NSError *error = [requestState error];
        NSLog(@" error:%@",error);
        
    }];
    [requestState startAsynchronous];
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveAddress:(id)sender {
}

- (IBAction)backButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)selectState:(id)sender {
//    [self.actionSheetState showFromRect:CGRectMake(0.0f, 200.0f, 320.0f, 150.0f) inView:self.view animated:YES];
    self.viewPickerState.hidden = NO;
}

- (IBAction)selectCountry:(id)sender {
//    [self.actionSheetCountry showFromRect:CGRectMake(0.0f, 200.0f, 320.0f, 150.0f) inView:self.view animated:YES];
    self.viewPickerCountry.hidden = NO;
}

- (void) addPaddingAndBorder:(UITextField*)textField color:(UIColor*)color {
    UIView *paddingView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 15, 20)];
    textField.leftView = paddingView;
    textField.leftViewMode = UITextFieldViewModeAlways;
    
    textField.layer.borderColor = color.CGColor;
    textField.layer.borderWidth = 1.0f;
}


//- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
//    
//}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (pickerView == self.pickerCountry) {
        return [self.arrayOfCountry count];
    }
    else if (pickerView == self.pickerState) {
        return [self.arrayOfState count];
    }
    return 0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (pickerView == self.pickerCountry) {
        return [self.arrayOfCountry objectAtIndex:row];
    }
    else if (pickerView == self.pickerState) {
        return [self.arrayOfState objectAtIndex:row];
    }
    return @"";
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (pickerView == self.pickerCountry) {
        [self.buttonCountry setTitle:[self.arrayOfCountry objectAtIndex:row] forState:UIControlStateNormal];
//        [self reloadStateValues:[self.arrayOfCountry_ID objectAtIndex:row]];
        self.viewPickerCountry.hidden = YES;
    }
    else if (pickerView == self.pickerState) {
        [self.buttonState setTitle:[self.arrayOfState objectAtIndex:row] forState:UIControlStateNormal];
        self.viewPickerState.hidden = YES;
    }
}

- (void)reloadStateValues:(NSString*)country_id {
    
    self.activityIndicatorState.hidden = NO;
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"zone_country_id == %@", country_id];
    NSArray *result = [self fetchObjectsWithEntityName:@"State" andPredicate:predicate];
    
    [self.arrayOfState removeAllObjects];
    
    for (State *state in result) {
        [self.arrayOfState addObject:state.zone_name];
    }
    
    [self.buttonState setTitle:[self.arrayOfState firstObject] forState:UIControlStateNormal];
    
    if ([self.arrayOfState count] == 0) {
        self.buttonState.enabled = NO;
        self.buttonState.backgroundColor = [UIColor lightGrayColor];
    }
    else {
        self.buttonState.enabled = YES;
        self.buttonState.backgroundColor = [UIColor whiteColor];
    }
    
    [self.pickerState reloadAllComponents];
    self.activityIndicatorState.hidden = YES;
}


@end
