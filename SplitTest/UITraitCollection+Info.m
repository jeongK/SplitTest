//
//  UITraitCollection+Info.m
//  SplitTest
//
//  Created by jeongkyu kim on 2015. 7. 19..
//  Copyright (c) 2015년 jeongkyu kim. All rights reserved.
//

#import "UITraitCollection+Info.h"

#define TRAIT(trait) trait==UIUserInterfaceSizeClassCompact?@"C":@"R"

@implementation UITraitCollection (Info)

- (NSString *)keyInfo {
    return [NSString stringWithFormat:@"%@|%@", TRAIT(self.verticalSizeClass), TRAIT(self.horizontalSizeClass)];
}

@end
