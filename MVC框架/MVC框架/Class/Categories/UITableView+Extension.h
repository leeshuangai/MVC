//
//  UITableView+Extension.h
//  布医医护
//
//  Created by 康帅 on 16/3/2.
//  Copyright © 2016年 Bujiaxinxi. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kBOUNCE_DISTANCE  2

typedef NS_ENUM(NSInteger,WaveAnimation) {
    LeftToRightWaveAnimation = -1,
    RightToLeftWaveAnimation = 1
};


@interface UITableView (Extension)
- (void)reloadDataAnimateWithWave:(WaveAnimation)animation;
- (void)reloadDatainsection:(NSIndexSet *)sections AnimateWithWave:(WaveAnimation)animation;
@end
