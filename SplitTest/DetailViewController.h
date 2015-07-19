//
//  DetailViewController.h
//  SplitTest
//
//  Created by jeongkyu kim on 2015. 7. 19..
//  Copyright (c) 2015년 jeongkyu kim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

