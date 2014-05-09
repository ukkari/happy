//
//  SuViewController.m
//  happykomosama
//
//  Created by ohta tomotaka on 2014/05/08.
//  Copyright (c) 2014年 ohta tomotaka. All rights reserved.
//
#import "UIImageView+WebCache.h"
#import "SuViewController.h"
#include <AVFoundation/AVFoundation.h>
#import "SVProgressHUD.h"
@interface SuViewController ()
@end

@implementation SuViewController{
    NSString *imagepath;
    NSString *snamelabel;
    NSString *sgrouplabel;
    NSString *voicepath;
    NSMutableData * receivedData;
    AVAudioPlayer* audioPlayer;
}
@synthesize imagepath;
@synthesize snamelabel;
@synthesize sgrouplabel;
@synthesize voicepath;


- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"%@%@%@",snamelabel,sgrouplabel,voicepath);
    namelabel.text=snamelabel;
    grouplabel.text=sgrouplabel;
    NSURL *imageURL = [NSURL URLWithString:imagepath];
    UIImage *placeholderImage = [UIImage imageNamed:@"画像読み込み完了までに表示するリソース画像"];
    [topimage setImageWithURL:imageURL
              placeholderImage:placeholderImage];
    
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;

    NSURL *theURL = [NSURL URLWithString:voicepath];
    //http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4
    NSURLRequest *theRequest=[NSURLRequest requestWithURL:theURL];
    NSURLConnection *theConnection=[[NSURLConnection alloc]
                                    initWithRequest:theRequest delegate:self];
    if (theConnection) {
        NSLog(@"start loading");
        receivedData = [NSMutableData data];
    }
    [SVProgressHUD show];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    [self.navigationController setNavigationBarHidden:FALSE];
}

-(void)willMoveToParentViewController:(UIViewController *)parent{
    [audioPlayer stop];
    audioPlayer = nil;
    [self.navigationController setNavigationBarHidden:TRUE];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)select{
    [audioPlayer play];
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    [receivedData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *fileName = [NSString stringWithFormat:@"voice.mp3"];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:fileName];
    
    [receivedData writeToFile:filePath atomically:YES];
    //[connection release];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    NSLog(@"Succeeded! Received %d bytes of data",[receivedData length]);
    NSURL *url = [NSURL fileURLWithPath:filePath];
    audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:nil];
    [SVProgressHUD dismiss];
}

@end
