//
//  GestureImageView.m
//  BJNurse
//
//  Created by boocca on 16/12/7.
//  Copyright © 2016年 李爽. All rights reserved.
//

#import "GestureImageView.h"

@implementation GestureImageView

- (void)addTapOfImageView:(void(^)())completion{
      self.action = completion;
    self.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
    [self addGestureRecognizer:tap];
    
}

- (void)tap:(UITapGestureRecognizer *)tap {
    
    self.action();
    
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
