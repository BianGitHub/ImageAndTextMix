//
//  TopView.m
//  ImageAndTextMixBtn
//
//  Created by 边雷 on 17/4/14.
//  Copyright © 2017年 Mac-b. All rights reserved.
//

#import "TopView.h"
#import "NSAttributedString+Addition.h"
#import "Masonry.h"

@implementation TopView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    self.backgroundColor = [UIColor blackColor];
    
    [self addButtons:@"image1" title:@"彩票" tag:kBtn1];
    [self addButtons:@"image2" title:@"加油" tag:kBtn2];
    [self addButtons:@"image3" title:@"吃饭" tag:kBtn3];
    [self addButtons:@"image4" title:@"货运" tag:kBtn4];
}

- (void)addButtons:(NSString *)imageName title:(NSString *)title tag:(TopViewBtn)tag{
    UIButton *btn = [[UIButton alloc] init];
    
    NSAttributedString *str = [NSAttributedString bl_imageTextWithImage:[UIImage imageNamed:imageName] imageWH:35 title:title fontSize:14 titleColor:[UIColor whiteColor] spacing:7];
    [btn setAttributedTitle:str forState:UIControlStateNormal];
    
    // 自动换行
    btn.titleLabel.numberOfLines = 0;
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [btn sizeToFit];
    
    [self addSubview:btn];
    
    btn.tag = tag;
    [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)clickBtn:(UIButton *)sender {
//    NSLog(@"%zd", sender.tag);
    [self.delegate btnPush:sender];
}

/*
 1.控件创建的时候([alloc init])，不会调用这个方法
 2.布局子控件的时候，它会自动调到这个方法。
 3.子控件的位置或者大小发生变化的时候，也会调用这个方法
 4.父控件的位置或者大小发生变化的时候，也会调用这个方法。
 5.如果应用程序支持多屏幕朝向，当屏幕发生旋转的时候，也会调用这个方法。
 */
- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat margin = (self.frame.size.width - self.subviews[0].frame.size.width * 4) / 5;
    
    // 需要减一, 不然数组越界
    for (NSInteger i = 0; i < self.subviews.count - 1; i++) {
        UIButton *btn = self.subviews[i];
        UIButton *nextBtn = self.subviews[i+1];
        
        if (i == 0) {
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self).offset(margin);
                make.centerY.equalTo(self);
            }];
        }
        
        [nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(btn.mas_right).offset(margin);
            make.centerY.equalTo(self);
        }];
    }
}

@end
