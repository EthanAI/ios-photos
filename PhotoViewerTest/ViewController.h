//
//  ViewController.h
//  PhotoViewerTest
//
//  Created by Ethan Smith on 9/23/14.
//  Copyright (c) 2014 Ethan Smith. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface ViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *urlLabel;

//get list of buttons from the toolbar another way to show and hide them
@property (weak, nonatomic) IBOutlet UIToolbar *toolBar;
//just so we can hide and show the buttons, not functions
@property (weak, nonatomic) IBOutlet UIBarButtonItem *barButtonOne;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *barButtonTwo;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *barButtonThree;

@property UIImagePickerController *imagePickerController;

- (IBAction)photoLibraryButton:(UIBarButtonItem *)sender;
- (IBAction)videoLibraryButton:(UIBarButtonItem *)sender;
@end

