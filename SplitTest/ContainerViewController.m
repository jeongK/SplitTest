//
//  ContainerViewController.m
//  SplitTest
//
//  Created by jeongkyu kim on 2015. 7. 19..
//  Copyright (c) 2015년 jeongkyu kim. All rights reserved.
//

#import "ContainerViewController.h"

#define TRAITLOG(trait) trait==UIUserInterfaceSizeClassCompact?@"C":@"R"

@interface ContainerViewController ()

@property (nonatomic, strong) UITraitCollection *customTrait;

@end

@implementation ContainerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
    
    [self performTraitCollectionOverride];
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
    [self performTraitCollectionOverride];
    
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
}

- (BOOL)isSplited {
    
    return YES;
}

- (void)performTraitCollectionOverride
{
    self.customTrait = nil;
    
    NSLog(@"<--- 1 : H : %@ | V : %@", TRAITLOG(self.traitCollection.horizontalSizeClass), TRAITLOG(self.traitCollection.verticalSizeClass));
    
    if (self.isSplited) {
        self.customTrait = [UITraitCollection traitCollectionWithHorizontalSizeClass:UIUserInterfaceSizeClassRegular];
    }
    
    [self setOverrideTraitCollection:self.customTrait forChildViewController:self];
    
    for (UIViewController * view in self.childViewControllers) {
        [self setOverrideTraitCollection:self.customTrait forChildViewController:view];
    }
}

- (void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection {
    
    [super traitCollectionDidChange:previousTraitCollection];
    
    NSLog(@"<--- 2 : H : %@ | V : %@", TRAITLOG(self.traitCollection.horizontalSizeClass), TRAITLOG(self.traitCollection.verticalSizeClass));
}

@end
