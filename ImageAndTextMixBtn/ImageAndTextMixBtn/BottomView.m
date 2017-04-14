//
//  BottomView.m
//  ImageAndTextMixBtn
//
//  Created by 边雷 on 17/4/14.
//  Copyright © 2017年 Mac-b. All rights reserved.
//

#import "BottomView.h"

@implementation BottomView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.backgroundColor = [UIColor redColor];
}

@end
