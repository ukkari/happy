//
//  PresentViewController.m
//  happykomosama
//
//  Created by Ukai Yu on 2014/05/10.
//  Copyright (c) 2014年 ohta tomotaka. All rights reserved.
//

#import "PresentViewController.h"

@interface PresentViewController ()

@end

@implementation PresentViewController{
    
    __weak IBOutlet UIImageView *imageView;
    __weak IBOutlet UIScrollView *scrollView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [scrollView setMinimumZoomScale: 1.0];
    [scrollView setMaximumZoomScale: 5.0];
    [scrollView setDelegate: self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    [self.navigationController setNavigationBarHidden:FALSE];
}

-(void)willMoveToParentViewController:(UIViewController *)parent{
    [self.navigationController setNavigationBarHidden:TRUE];
}

- (UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView {
    return imageView;
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
