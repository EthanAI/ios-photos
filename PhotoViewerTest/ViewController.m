//
//  ViewController.m
//  PhotoViewerTest
//
//  Created by Ethan Smith on 9/23/14.
//  Copyright (c) 2014 Ethan Smith. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // neat code to remove a toolbar button that cant be used.
    // Case: when no camera exists or allowed remove camera button
//    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
//    {
//        // There is not a camera on this device, so don't show the camera button.
//        NSMutableArray *toolbarItems = [self.toolBar.items mutableCopy];
//        [toolbarItems removeObjectAtIndex:2];
//        [self.toolBar setItems:toolbarItems animated:NO];
//    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showImagePickerForSourceType:(UIImagePickerControllerSourceType)sourceType mediaType:(NSString *)mediaType
{
    if (sourceType == UIImagePickerControllerSourceTypeCamera) {
        NSLog(@"Camera not supported");
    }
    
    if (self.imageView.isAnimating)
    {
        [self.imageView stopAnimating];
    }
    
    UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
    imagePickerController.modalPresentationStyle = UIModalPresentationCurrentContext;
    imagePickerController.sourceType = sourceType;
    imagePickerController.delegate = self;
    
    // Select movies
    imagePickerController.mediaTypes = [[NSArray alloc] initWithObjects:mediaType, nil];

    self.imagePickerController = imagePickerController;
    
    [self presentViewController:self.imagePickerController animated:YES completion:nil];
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *pickedImage = [info valueForKey:UIImagePickerControllerOriginalImage];

    NSURL *mediaURL = (NSURL*) [info objectForKey:UIImagePickerControllerMediaURL];
    NSLog(@"Picture Picked %@", pickedImage.description);
    NSLog(@"%@", [mediaURL path]);
    
    self.imageView.image = pickedImage;
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [self dismissViewControllerAnimated:YES completion:NULL];
}

#pragma mark - Button Actions
- (IBAction)photoLibraryButton:(UIBarButtonItem *)sender {
    //[self showImagePickerForSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    //This one gets all photos less clicks
    [self showImagePickerForSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum mediaType:(NSString *)kUTTypeImage];
}

- (IBAction)videoLibraryButton:(UIBarButtonItem *)sender {
    [self showImagePickerForSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum mediaType:(NSString *)kUTTypeMovie];
}

- (IBAction)twoButton:(UIBarButtonItem *)sender {
    NSLog(@"two");
}
@end
