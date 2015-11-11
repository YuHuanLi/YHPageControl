//
//  LYHPageControl.m
//  WeiBo
//
//  Created by 厉煜寰 on 15/10/25.
//  Copyright © 2015年 SXT. All rights reserved.
//

#import "YHBasicPageControl.h"
#import "YHPageControlConst.h"

static UIImage *currentPageImageView;


@implementation YHBasicPageControl
#pragma mark - 类方法+构造方法

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initWithMustData];
    }
    return self;
}
- (instancetype)init
{
    if (self = [super init]) {
        [self initWithMustData];
        
    }
    return self;
}


#pragma mark - 重写setter方法
/**
 *  如果pageNum只有一个，那么关闭下面的图标，默认为NO
 */
- (void)setHidesForSinglePage:(BOOL)hidesForSinglePage
{
    _hidesForSinglePage = hidesForSinglePage;
    if (_hidesForSinglePage == YES) {
        if (self.numberOfPages == 1) {
            self.hidden = YES;
        }
    }
}
- (void)setPageIndicatorTintColor:(UIColor *)pageIndicatorTintColor
{
    _pageIndicatorTintColor = pageIndicatorTintColor;
}
- (void)setCurrentPageIndicatorTintColor:(UIColor *)currentPageIndicatorTintColor
{
    _currentPageIndicatorTintColor = currentPageIndicatorTintColor;
}
- (void)setPageImage:(UIImage *)pageImage
{
    _pageImage = pageImage;
}
- (void)setCurrentPageImage:(UIImage *)currentPageImage
{
    _currentPageImage = currentPageImage;
    
}
/**
 *  如果设置了，关闭用户交互，直到-updateCurrentPageDisplay方法被唤醒的时候才开启用户交互,默认是NO
 */
- (void)setDefersCurrentPageDisplay:(BOOL)defersCurrentPageDisplay
{
    _defersCurrentPageDisplay = defersCurrentPageDisplay;
    if (_defersCurrentPageDisplay == YES) {
        self.userInteractionEnabled = NO;
    }else{
        self.userInteractionEnabled = YES;
    }
}

/**
 *  当前page。默认为0，范围从0~page个数-1
 */
- (void)setCurrentPage:(NSInteger)currentPage
{
    _currentPage = currentPage;
}

#pragma mark - 抽出来的方法
/**
 *  加载必要的数据
 */
- (void)initWithMustData
{
    self.currentPage = 0;
    self.numberOfPages = 0;
    self.pageIndicatorTintColor = [UIColor grayColor];
    self.currentPageIndicatorTintColor = [UIColor greenColor];
    self.userInteractionEnabled = YES;
    self.hidesForSinglePage = NO;
    self.defersCurrentPageDisplay = NO;
}
/**
 *  更新页面的当前page，如果defersCurrentPageDisplay为NO可以忽略这个方法
 */
- (void)updateCurrentPageDisplay
{
    if (self.defersCurrentPageDisplay==YES) {
        self.userInteractionEnabled = YES;
    }
}
@end
