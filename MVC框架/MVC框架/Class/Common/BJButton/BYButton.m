//
//  BYButton.m
//  JKFuwuRenYuan
//
//  Created by boocca on 16/11/1.
//  Copyright © 2016年 Bujiaxinxi. All rights reserved.
//

#import "BYButton.h"

@implementation BYButton
- (void)addActionOfButton:(void(^)(UIButton *button))completion{
    self.action = completion;
    [self addTarget:self action:@selector(didClickBU:) forControlEvents:UIControlEventTouchUpInside];
    
}
-(void)didClickBU:(UIButton *)button{
    
    if(self.action)
    {
        self.action(button);
    }
}
@end
