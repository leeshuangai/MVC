//
//  GradientView.h
//  BJNurse
//
//  Created by boocca on 16/12/8.
//  Copyright © 2016年 李爽. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, GradientViewType){
    kGradientViewTypeHorizontal = 0,
    kGradientViewTypeVertical = 1,
    kGradientViewTypeInclinedLeft = 2,
    kGradientViewTypeInclinedRight = 3
};
@interface GradientView : UIView
@property (nonatomic, strong) UIColor *startColor;
@property (nonatomic, strong) UIColor *endColor;
@property (nonatomic, assign) GradientViewType gradientViewType;

- (id)initWithFrame:(CGRect)frame startColor:(UIColor *)startColor endColor:(UIColor *)endColor;
@end
