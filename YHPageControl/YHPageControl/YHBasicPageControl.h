//
//  LYHPageControl.h
//  WeiBo
//
//  Created by 厉煜寰 on 15/10/25.
//  Copyright © 2015年 SXT. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YHBasicPageControl;

@protocol LYHPageControlDelegate <NSObject>
- (void)pageControl:(YHBasicPageControl *)pageControl changgeCurrentPage:(NSInteger)currentPage;
@end

@interface YHBasicPageControl : UIView
@property (nonatomic, assign) id<LYHPageControlDelegate> delegate;
/**
 *  当前page。默认为0，范围从0~page个数-1
 */
@property(nonatomic) NSInteger currentPage;
/**
 *  如果pageNum只有一个，那么关闭下面的图标，默认为NO
 */
@property(nonatomic) BOOL hidesForSinglePage;
/**
 *  如果设置了，关闭用户交互，直到-updateCurrentPageDisplay方法被唤醒的时候才开启用户交互，默认是NO
 */
@property(nonatomic) BOOL defersCurrentPageDisplay;
/**
 *  更新页面的当前page，如果defersCurrentPageDisplay为NO可以忽略这个方法
 */
- (void)updateCurrentPageDisplay;
/**
 *  总page数。默认为0
 */
@property(nonatomic) NSInteger numberOfPages;
/**
 *  未选中小圈圈的颜色
 */
@property(nonatomic,strong) UIColor *pageIndicatorTintColor;
/**
 *  当前小圈圈的颜色
 */
@property(nonatomic,strong) UIColor *currentPageIndicatorTintColor;
/**
 *  用图片给未选中page设颜色
 */
@property (nonatomic, strong) UIImage *pageImage;
/**
 *  用图片给选中的page设颜色
 */
@property (nonatomic, strong) UIImage *currentPageImage;

#pragma mark - 交给子类去实现的setter方法
- (void)setNumberOfPages:(NSInteger)numberOfPages;
- (void)setPageIndicatorTintColor:(UIColor *)pageIndicatorTintColor;
- (void)setCurrentPageIndicatorTintColor:(UIColor *)currentPageIndicatorTintColor;
- (void)setPageImage:(UIImage *)pageImage;
- (void)setCurrentPageImage:(UIImage *)currentPageImage; 

@end
