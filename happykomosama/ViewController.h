//
//  ViewController.h
//  happykomosama
//
//  Created by ohta tomotaka on 2014/05/05.
//  Copyright (c) 2014年 ohta tomotaka. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Komori.h"
@interface ViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate>{
IBOutlet UICollectionView *collectionView;
}
- (IBAction)presentTapped:(id)sender;

@end
