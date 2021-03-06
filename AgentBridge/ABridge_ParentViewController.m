//
//  ABridge_ParentViewController.m
//  AgentBridge
//
//  Created by host24_iOS Dev on 11/13/13.
//  Copyright (c) 2013 host24_iOS Dev. All rights reserved.
//

#import "ABridge_ParentViewController.h"

@interface ABridge_ParentViewController ()
@property (strong, nonatomic) UIView *viewOverlay;
@property (strong, nonatomic) WebserviceCall *call;
@end

@implementation ABridge_ParentViewController
@synthesize arrayOfURLConnection;
@synthesize imageViewTopBar;
@synthesize scrollViewReload;
@synthesize labelPull;

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
    
    self.view.layer.shadowOpacity = 0.75f;
    self.view.layer.shadowRadius = 10.0f;
    self.view.layer.shadowColor = [UIColor blackColor].CGColor;
    
    self.scrollViewReload.contentSize = CGSizeMake(320.0f, self.scrollViewReload.frame.size.height - 45.0f);
    self.labelPull.font = FONT_OPENSANS_REGULAR(FONT_SIZE_REGULAR);
    self.labelPull.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"head_strip"]];
    
    if (![self.slidingViewController.underLeftViewController isKindOfClass:[ABridge_MenuViewController class]]) {
        self.slidingViewController.underLeftViewController  = [self.storyboard instantiateViewControllerWithIdentifier:@"Menu"];
    }
    
    if (![self.slidingViewController.underRightViewController isKindOfClass:[ABridge_SearchViewController class]]) {
        self.slidingViewController.underRightViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"Search"];
    }
    
    
//    [self.view addGestureRecognizer:self.slidingViewController.panGesture];
    [self.imageViewTopBar addGestureRecognizer:self.slidingViewController.panGesture];
}


- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    for (NSURLConnection *urlConnection in self.arrayOfURLConnection) {
        [urlConnection cancel];
    }
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)revealMenu:(id)sender
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
    [self.slidingViewController anchorTopViewTo:ECRight];
    [self.call stop]; //notworking
}

- (IBAction)revealSearch:(id)sender
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
    [self.slidingViewController anchorTopViewTo:ECLeft];
}
- (void) performWebserviceCall:(NSString*)method url:(NSString*)url parameters:(NSDictionary*)parameters usingRootURL:(BOOL)rootURL completion:(void(^)(id responseObject))completion {
    if (!self.call) {
        self.call = [[WebserviceCall alloc] init];
    }
    [self.call initCallMethod:method serviceURL:url withParameters:parameters usingRootURL:rootURL withCompletionHandler:^(id responseObject) {
        completion(responseObject);
    }];
}
- (NSURLConnection *)urlConnectionWithURLString:(NSString *)urlString andParameters:(NSString *)parameters {
    NSMutableString *urlString_ = [NSMutableString stringWithString:urlString];
    [urlString_ appendString:parameters];
    NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:urlString_]];
    
    return [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self startImmediately:YES];
}

- (void)addURLConnection:(NSURLConnection*)urlConnection {
    if (self.arrayOfURLConnection == nil) {
        self.arrayOfURLConnection = [[NSMutableArray alloc] init];
    }
    
    [self.arrayOfURLConnection addObject:urlConnection];
}

- (NSArray *)fetchObjectsWithEntityName:(NSString *)entity andPredicate:(NSPredicate *)predicate {
    NSManagedObjectContext *context = ((ABridge_AppDelegate *)[[UIApplication sharedApplication] delegate]).managedObjectContext;
    NSFetchRequest * fetchRequest = [[NSFetchRequest alloc] init];
    [fetchRequest setPredicate:predicate];
    [fetchRequest setEntity:[NSEntityDescription entityForName:entity inManagedObjectContext:context]];
    NSError * error = nil;
    NSArray * results = [context executeFetchRequest:fetchRequest error:&error];
    return results;
}
    
-(IBAction)goBackToRoot:(id)sender {
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationFade];
    
    [self.slidingViewController anchorTopViewOffScreenTo:ECLeft animations:nil onComplete:^{
        [((ABridge_AppDelegate *)[[UIApplication sharedApplication] delegate]) resetWindowToInitialView];
    }];
}

- (void) showOverlayWithMessage:(NSString*) message withIndicator:(BOOL) with_indicator{
    [self dismissOverlay];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50.0f, (with_indicator)?30.0f:20.0f, 200.0f, 30.0f)];
    label.text = message;
    label.textColor = [UIColor darkGrayColor];
    label.backgroundColor = [UIColor clearColor];
    label.font = FONT_OPENSANS_REGULAR(20.0f);
    label.textAlignment = NSTextAlignmentCenter;
    label.numberOfLines = 0;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    
    [label sizeToFit];
    
    CGRect frame = label.frame;
    frame.size.width = 200.0f;
    label.frame = frame;
    
    self.viewOverlay = [[UIView alloc] initWithFrame:CGRectMake(10.0f, 10.0f, 300.0f, (label.frame.origin.y + label.frame.size.height + 20.0f))];
//    self.viewOverlay.backgroundColor = [UIColor colorWithWhite:0.0f alpha:0.6f];
    self.viewOverlay.layer.cornerRadius = 10.0f;
    self.viewOverlay.layer.masksToBounds = YES;
    
    [self.viewOverlay addSubview:label];
    
    self.viewOverlay.center = self.view.center;
    
    if (with_indicator) {
        UIActivityIndicatorView *activityIndicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        activityIndicator.center = self.viewOverlay.center;
        activityIndicator.frame = CGRectMake(activityIndicator.frame.origin.x, 5.0f, 20.0f, 20.0f);
        [activityIndicator startAnimating];
        
        [self.viewOverlay addSubview:activityIndicator];
    }
    
//    UITapGestureRecognizer *tapToClose = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissOverlay)];
//    tapToClose.numberOfTapsRequired = 1;
//    tapToClose.numberOfTouchesRequired = 1;
//    
//    [self.viewOverlay addGestureRecognizer:tapToClose];
    
    [self.view addSubview:self.viewOverlay];
}

- (void) dismissOverlay {
    self.viewOverlay.hidden = YES;
    [self.viewOverlay removeFromSuperview];
    self.viewOverlay = nil;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    if (scrollView.contentOffset.y < -25.0f) {
        //NSLog(@"Release to Refresh");
        [self reloadData];
    }
    else {
        //NSLog(@"Pull down to Refresh");
    }
//    [scrollView setContentOffset:CGPointMake(0.0f, 0.0f) animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    //NSLog(@"y:%f",(100.0f - (ABS(scrollView.contentOffset.y) * 5.0f))/100.0f);
    if (scrollView.contentOffset.y < 0.0f) {
        
//        self.viewOverlay.alpha = (100.0f - (scrollView.contentOffset.y * 5.0f))/100.0f;
        CGRect frame = self.labelPull.frame;
        frame.origin.y = 32.0f + ABS(scrollView.contentOffset.y * 1.0f);
        self.labelPull.frame = frame;
        if (scrollView.contentOffset.y < -25.0f) {
            self.labelPull.text = @"Release to Refresh";
        }
        else {
            self.labelPull.text = @"Pull down to Refresh";
        }
    }
}

- (void) reloadData {
    
}
@end
