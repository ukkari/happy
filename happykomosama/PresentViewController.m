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

@implementation PresentViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
