//
//  JYBMultiImageView.m
//  JinYuanBao
//
//  Created by 易达正丰 on 14/11/11.
//  Copyright (c) 2014年 newstep. All rights reserved.
//

#import "MultiImageView.h"
#import "UIImageButton.h"
#import "UIView+Ext.h"

@interface MultiImageView ()

@property (nonatomic, strong) NSMutableArray *imageBtns_MARR;
@property (nonatomic, strong) UIImageView    *choosed_IV;
@property (nonatomic, assign) NSInteger      from;
@property (nonatomic, assign) NSInteger      to;

@end

@implementation MultiImageView


- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self shareInit];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self shareInit];
    }
    return self;
}

- (void)awakeFromNib
{
    [self shareInit];
}

- (void)shareInit
{
    self.backgroundColor = [UIColor redColor];
    if (self.lineCount == 0) self.lineCount = 4;
    if (self.itemWidth == 0) self.itemWidth = 75*RATIOH;
    if (self.maxItem == 0) self.maxItem = 9;
    
    self.images_MARR    = [NSMutableArray array];
    self.imageBtns_MARR = [NSMutableArray array];
    

}

- (void)setImages_MARR:(NSMutableArray *)images_MARR
{
    _images_MARR = images_MARR;

    [self loadingImageView];
}


- (void)loadingImageView
{
    // 每个item间隔
    CGFloat gap = fmodf(self.width-40, self.itemWidth)/(self.lineCount-1);
    
    [self.imageBtns_MARR removeAllObjects];
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }

    // 显示的图片，用来排序的
    [self.images_MARR enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        UIImageButton *image_BTN  = [[UIImageButton alloc] initWithFrame:CGRectMake(20, 10, self.itemWidth, self.itemWidth)];
        image_BTN.tag             = idx;
        image_BTN.backgroundColor = [UIColor lightGrayColor];
        image_BTN.contentMode     = UIViewContentModeScaleAspectFill;
        
        
        
        // 判断传入的数组数据类型
        UIImage *jybImage = obj;
        if (jybImage)
            [image_BTN setImage:jybImage];
        
        [self addSubview:image_BTN];
        [self.imageBtns_MARR addObject:image_BTN];
        

        if (_hideCancleBtn == NO) {
            //添加删除的按钮
            UIButton *delectBt = [UIButton buttonWithType:UIButtonTypeCustom];
            delectBt.frame = CGRectMake(20+idx%self.lineCount * (self.itemWidth+gap)- 8 + self.itemWidth, 10+idx/self.lineCount * (self.itemWidth+gap)-8, 15, 15);
            
            
            [self addSubview:delectBt];
            //delectBt.backgroundColor = [UIColor yellowColor];
            [delectBt addTarget:self action:@selector(imageBtnAction:) forControlEvents:UIControlEventTouchUpInside];
            delectBt.tag = 100+idx;
        }
        
        
        
    }];
    
    // 继续添加按钮
    if (self.images_MARR.count < self.maxItem) {
        
        
        UIButton *plus_BTN = [UIButton buttonWithType:UIButtonTypeCustom];
        //plus_BTN.backgroundColor = [UIColor redColor];
        [plus_BTN setBackgroundImage:[UIImage imageNamed:@"icon_addpic"] forState:UIControlStateNormal];
        plus_BTN.frame = CGRectMake(20+self.images_MARR.count%self.lineCount * (self.itemWidth+gap), 10+self.images_MARR.count/self.lineCount * (self.itemWidth+gap), self.itemWidth, self.itemWidth);
        [plus_BTN addTarget:self action:@selector(addBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:plus_BTN];
        
        self.height = plus_BTN.bottom+10;
        
        if (self.images_MARR.count == 0) {
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(plus_BTN.frame.size.width+plus_BTN.frame.origin.x +15, plus_BTN.frame.origin.y, 150, plus_BTN.frame.size.height)];
            label.text = @"上传报告图片";
            label.font = FONT(16);
            label.textColor = gray;
            [self addSubview:label];
        }
       
  
    }
    
    [self updateUIWithAnimated:NO];
}

/**
 *  更新图片显示顺序
 */
- (void)updateUIWithAnimated:(BOOL)animated
{
    // 每个item间隔
    CGFloat gap = fmodf(self.width-40, self.itemWidth)/(self.lineCount-1);

    // 显示的图片，用来排序的
    [self.imageBtns_MARR enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UIImageButton *image_BTN = obj;
        image_BTN.tag = idx;
        
        UIButton *delectBtn = [self viewWithTag:100+idx];
        [delectBtn setImage:[UIImage imageNamed:@"icon_deletepic"] forState:UIControlStateNormal];
        [UIView animateWithDuration:animated ? 0.3 : 0 animations:^{
            
            
            image_BTN.frame = CGRectMake(20+idx%self.lineCount * (self.itemWidth+gap), 10+idx/self.lineCount * (self.itemWidth+gap), self.itemWidth, self.itemWidth);
            if (!_hideCancleBtn) {
                delectBtn.frame =  CGRectMake(20+idx%self.lineCount * (self.itemWidth+gap)-8+ self.itemWidth, 10+idx/self.lineCount * (self.itemWidth+gap)-8, 15, 15);
            }
          
        }];
        
       
        
        
        if (idx >= self.maxItem-1) self.height = image_BTN.bottom+10;
    }];
}



#pragma mark - Control Action

- (void)addBtnAction:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(addButtonDidTap)]) {
        [self.delegate addButtonDidTap];
    }
}

- (void)imageBtnAction:(UIImageButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(multiImageBtn:withImage:)]) {
        [self.delegate multiImageBtn:sender.tag withImage:sender.image];
    }
}



#pragma mark -
#pragma mark - Logic




@end

