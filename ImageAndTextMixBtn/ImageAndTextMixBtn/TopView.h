//
//  TopView.h
//  ImageAndTextMixBtn
//
//  Created by 边雷 on 17/4/14.
//  Copyright © 2017年 Mac-b. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum  NSUInter {
    kBtn1 = 1,
    kBtn2 = 2,
    kBtn3 = 3,
    kBtn4 = 4,
}TopViewBtn;

@protocol TopViewDelegate <NSObject>
- (void)btnPush:(UIButton *)sender;
@end
@interface TopView : UIView
@property(nonatomic, weak) id<TopViewDelegate> delegate;
@end
