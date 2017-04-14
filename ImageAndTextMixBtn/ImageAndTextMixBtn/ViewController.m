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

@interface ViewController ()<TopViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"图文混排";
    
    [self setupUI];
}

- (void)setupUI {
    TopView *top = [[TopView alloc] init];
    top.delegate = self;
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

#pragma mark - delegate
- (void)btnPush:(UIButton *)sender {
    switch (sender.tag) {
        case kBtn1:
        {
            NSLog(@"彩票");
            UIViewController *VC = [[UIViewController alloc] init];
            VC.view.backgroundColor = [UIColor whiteColor];
            VC.navigationItem.title = @"push";
            [self.navigationController pushViewController:VC animated:YES];
            break;
        }
        case kBtn2:
            NSLog(@"加油");
            break;
        case kBtn3:
            NSLog(@"吃饭");
            break;
        case kBtn4:
            NSLog(@"货运");
            break;
            
        default:
            break;
    }
}

@end
