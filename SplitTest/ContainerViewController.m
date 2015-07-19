//
//  ContainerViewController.m
//  SplitTest
//
//  Created by jeongkyu kim on 2015. 7. 19..
//  Copyright (c) 2015년 jeongkyu kim. All rights reserved.
//

#import "ContainerViewController.h"
#import "UITraitCollection+Info.h"

@interface ContainerViewController ()

@property (nonatomic, strong) UITraitCollection *customTrait;
@property (nonatomic, strong) NSDictionary *traitInfo;

@end

@implementation ContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.traitInfo = @{@"C|C" : @(YES) // 4,5,6 landscape
                       , @"C|R" : @(YES) // 6+ landscape
                       , @"R|C" : @(NO) // 4,5,6,6+ portrait
                       , @"R|R" : @(YES)}; // pad
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
}

- (void)viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
    
    [self performTraitCollectionOverride:self.traitCollection];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
}

- (void)performTraitCollectionOverride:(UITraitCollection *)newCollection
{
    self.customTrait = nil;
    
    BOOL splited = [self.traitInfo[newCollection.keyInfo] boolValue];
    
    if (splited) {
        self.customTrait = [UITraitCollection traitCollectionWithHorizontalSizeClass:UIUserInterfaceSizeClassRegular];
    }
    
    [self setOverrideTraitCollection:self.customTrait forChildViewController:self];
    
    for (UIViewController * view in self.childViewControllers) {
        [self setOverrideTraitCollection:self.customTrait forChildViewController:view];
    }
}

- (void)willTransitionToTraitCollection:(UITraitCollection *)newCollection withTransitionCoordinator:(id <UIViewControllerTransitionCoordinator>)coordinator {
 
    [self performTraitCollectionOverride:newCollection];
    
    [super willTransitionToTraitCollection:newCollection withTransitionCoordinator:coordinator];
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    
    [super traitCollectionDidChange:previousTraitCollection];
}

@end
