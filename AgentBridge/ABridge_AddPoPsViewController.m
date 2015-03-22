//
//  ABridge_AddPoPsViewController.m
//  AgentBridge
//
//  Created by Joshua Jose Pecson on 3/22/15.
//  Copyright (c) 2015 host24_iOS Dev. All rights reserved.
//

#import "ABridge_AddPoPsViewController.h"

@interface ABridge_AddPoPsViewController ()
@property (assign, nonatomic) NSInteger imageCounter;
@end

@implementation ABridge_AddPoPsViewController
@synthesize imageCounter;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    imageCounter = 0;
    [self.btnAddImage setBackgroundColor:[UIColor colorWithWhite:1.0f alpha:0.4f]];
    
}


- (IBAction)addImagePressed:(id)sender {
    
    UIImagePickerController * picker = [[UIImagePickerController alloc] init];
    
    // Don't forget to add UIImagePickerControllerDelegate in your .h
    picker.delegate = self;
    
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    [self presentViewController:picker animated:YES completion:^{
        
    }];
    
}

- (IBAction)propertyTypePressed:(id)sender {
}

- (IBAction)subPropertyTypePressed:(id)sender {
}

- (IBAction)propertyFeaturesPressed:(id)sender {
}


#pragma mark UIImagePickerController Delegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    //add image to scrollview
    
    NSString *mediaType = [info objectForKey: UIImagePickerControllerMediaType];
    UIImage *originalImage, *editedImage, *imageToUse;
    
    // Handle a still image picked from a photo album
    if (CFStringCompare ((CFStringRef) mediaType, kUTTypeImage, 0)
        == kCFCompareEqualTo) {
        
        editedImage = (UIImage *) [info objectForKey:
                                   UIImagePickerControllerEditedImage];
        originalImage = (UIImage *) [info objectForKey:
                                     UIImagePickerControllerOriginalImage];
        
        if (editedImage) {
            imageToUse = editedImage;
        } else {
            imageToUse = originalImage;
        }
        // Do something with imageToUse
        
        UIImageView *imageView = [[UIImageView alloc] initWithImage:originalImage];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.frame = CGRectMake(0.0f, 0.0f, self.scrollViewImages.bounds.size.width, self.scrollViewImages.bounds.size.height);
        
        [self.scrollViewImages addSubview:imageView];
        
        //set correct offset and frame
        CGRect frame = imageView.frame;
        frame.origin.x = imageView.frame.size.width * ((CGFloat)imageCounter);
        imageView.frame = frame;
        
        [self.scrollViewImages setContentSize:CGSizeMake(self.scrollViewImages.bounds.size.width * ((CGFloat)imageCounter), 0.0f)];
        
        
        imageCounter += 1;
    }
    
    // Handle a movied picked from a photo album
    if (CFStringCompare ((CFStringRef) mediaType, kUTTypeMovie, 0)
        == kCFCompareEqualTo) {
        
//        NSString *moviePath = [[info objectForKey:
//                                UIImagePickerControllerMediaURL] path];
        
        // Do something with the picked movie available at moviePath
        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"Add Image Error" message:@"You selected a video, only photos are supported" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [av show];
    }
    [picker dismissViewControllerAnimated:YES completion:^{
        
    }];
}

@end
