//
//  LYHPageControlView.m
//  LYHPagecontrol
//
//  Created by 厉煜寰 on 15/11/10.
//  Copyright © 2015年 SXT. All rights reserved.
//  

#import "YHPageControlView.h"
#import "YHPageControlConst.h"


@interface YHPageControlView ()
@property (nonatomic, strong) UIImageView *pageImageView;/**< 被选中的page视图 */
@end

@implementation YHPageControlView
+ (instancetype)pageControlView
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
    
    self.pageImageView = [[UIImageView alloc] init];
    self.pageImageView.hidden = YES;
    self.pageImageView.contentMode = UIViewContentModeCenter;
    [self addSubview:self.pageImageView];
}
- (void)layoutSubviews
{
    [super layoutSubviews];
    self.layer.cornerRadius = self.bounds.size.height/2;
    self.pageImageView.frame = self.bounds;
}
- (void)setBgColor:(UIColor *)bgColor
{
    _bgColor = bgColor;
    self.backgroundColor = bgColor;
    if (!self.pageImageView.hidden) {// 当设置背景颜色的时候不允许出现背景图片
        self.pageImageView.hidden = YES;
    }
}
- (void)setPageImage:(UIImage *)pageImage
{
    _pageImage = pageImage;
    self.pageImageView.image = pageImage;
    if (self.pageImageView.hidden) {// 当设置背景图片的时候不允许出现背景颜色
        self.backgroundColor = [UIColor clearColor];
        self.pageImageView.hidden = NO;
    }
}

@end
