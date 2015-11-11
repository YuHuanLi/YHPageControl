//
//  LYHPageControlCurrentView.m
//  LYHPagecontrol
//
//  Created by 厉煜寰 on 15/11/10.
//  Copyright © 2015年 SXT. All rights reserved.
//  

#import "YHPageControlCurrentView.h"


@interface YHPageControlCurrentView ()
@property (nonatomic, strong) UIImageView *currentPageImageView;/**< 被选中的page视图 */
@end
@implementation YHPageControlCurrentView
+ (instancetype)pageControlCurrentView
{
    return [[self alloc] init];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupView];
    }
    return self;
}
- (void)setupView
{
    // self 的设置
    self.layer.masksToBounds = YES;
    self.backgroundColor = [UIColor grayColor];
    
    self.currentPageImageView = [[UIImageView alloc] init];
    self.currentPageImageView.hidden = YES;
    self.currentPageImageView.contentMode = UIViewContentModeCenter;
    [self addSubview:self.currentPageImageView];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.layer.cornerRadius = self.bounds.size.height/2;
    self.currentPageImageView.frame = self.bounds;
}
- (void)setBgColor:(UIColor *)bgColor
{
    _bgColor = bgColor;
    self.backgroundColor = bgColor;
    if (!self.currentPageImageView.hidden) {// 当设置背景颜色的时候不允许出现背景图片
        self.currentPageImageView.hidden = YES;
    }
}
- (void)setCurrentPageImage:(UIImage *)currentPageImage
{
    _currentPageImage = currentPageImage;
    self.currentPageImageView.image = currentPageImage;
    if (self.currentPageImageView.hidden) {// 当设置背景图片的时候不允许出现背景颜色
        self.backgroundColor = [UIColor clearColor];
        self.currentPageImageView.hidden = NO;
    }
}
@end
