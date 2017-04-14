//
//  ViewController.m
//  ImageAndTextMixBtn
//
//  Created by 边雷 on 17/4/14.
//  Copyright © 2017年 Mac-b. All rights reserved.
//

#import "ViewController.h"
#import "TopView.h"
#import "BottomView.h"
#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"图文混排";
    
    [self setupUI];
}

- (void)setupUI {
    TopView *top = [[TopView alloc] init];
    [self.view addSubview:top];
    
    BottomView *bottom = [[BottomView alloc] init];
    [self.view addSubview:bottom];
    
    [top mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.view);
        make.top.equalTo(self.view).offset(64);
        make.height.mas_equalTo(120);
    }];
    
    [bottom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.view);
        make.top.equalTo(top.mas_bottom);
    }];
}

@end
