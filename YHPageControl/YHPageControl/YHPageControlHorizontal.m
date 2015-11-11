//
//  LYHPageControlHorizontal.m
//  LYHPagecontrol
//
//  Created by 厉煜寰 on 15/11/10.
//  Copyright © 2015年 SXT. All rights reserved.
//

#import "YHPageControlHorizontal.h"
#import "YHPageControlView.h"/**< 未选中的视图 */
#import "YHPageControlCurrentView.h"/**< 选中的视图 */
@interface YHPageControlHorizontal ()
@property (nonatomic, strong) YHPageControlView *pageView;/**< 未选中视图 */
@property (nonatomic, strong) YHPageControlCurrentView *currentPageView;/**< 选中视图 */
@property (nonatomic, strong) NSMutableArray *pageViewArray;/**< 存放未选中的视图 */
@end
@implementation YHPageControlHorizontal

+(instancetype)pageControlHorizontal
{
    return [[self alloc] init];
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        _styel = LYHPageControlHorizontalTpyeDefault;
        
    }
    return self;
}
- (instancetype)initWithStyel:(LYHPageControlHorizontalTpye)styel
{
    if (self = [super init]) {
        _styel = styel;
        self.currentPage = 0;
        self.numberOfPages = 0;
        [self addObserver:self forKeyPath:@"currentPage" options:0 context:nil];
    }
    return self;
}
- (instancetype)init
{
    if (self = [super init]) {
        _styel = LYHPageControlHorizontalTpyeDefault;
        // 用KVO监听currentPage的属性变化
        [self addObserver:self forKeyPath:@"currentPage" options:0 context:nil];
    }
    return self;
}
#pragma mark - 懒加载
- (NSMutableArray *)pageViewArray
{
    if (_pageViewArray == nil) {
        _pageViewArray = [NSMutableArray array];
    }
    return _pageViewArray;
}
#pragma mark - overwrite父类setter方法
- (void)setPageIndicatorTintColor:(UIColor *)pageIndicatorTintColor
{
    [super setPageIndicatorTintColor:pageIndicatorTintColor];
    for (int index = 0; index < self.pageViewArray.count; index ++) {
        self.pageView = self.pageViewArray[index];
        self.pageView.bgColor = pageIndicatorTintColor;
    }
}
- (void)setCurrentPageIndicatorTintColor:(UIColor *)currentPageIndicatorTintColor
{
    [super setCurrentPageIndicatorTintColor:currentPageIndicatorTintColor];
    self.currentPageView.bgColor = currentPageIndicatorTintColor;
}
- (void)setPageImage:(UIImage *)pageImage
{
    [super setPageImage:pageImage];
    for (int index = 0; index < self.pageViewArray.count; index ++) {
        self.pageView = self.pageViewArray[index];
        self.pageView.pageImage = pageImage;
    }
}
- (void)setCurrentPageImage:(UIImage *)currentPageImage
{
    [super setCurrentPageImage:currentPageImage];
    self.currentPageView.currentPageImage = currentPageImage;
}

#pragma mark - 核心算法部分
/**
 *  总page数。默认为0
 */
- (void)setNumberOfPages:(NSInteger)numberOfPages
{
    [super setNumberOfPages:numberOfPages];
    self.currentPageView = [YHPageControlCurrentView pageControlCurrentView];
    for (int index = 0; index<numberOfPages; index++) {
        self.pageView = [YHPageControlView pageControlView];
        switch (_styel) {
            case LYHPageControlHorizontalTpyeDefault:{// 默认情况下的frame
                self.pageView.frame = CGRectMake(index *(LYHPagePadding+LYHPageWight) , 0, LYHPageWight, LYHPageWight);
                self.pageView.layer.cornerRadius = LYHPageWight/2;
                self.currentPageView.layer.cornerRadius = LYHPageWight/2;
                break;
            }
            case LYHPageControlHorizontalTpyeRectangle:{// 长方形风格
                self.pageView.frame = CGRectMake(index *(LYHRectangleW+LYHPagePadding), 0, LYHRectangleW, LYHRectangleH);
                self.pageView.layer.cornerRadius = LYHRectangleH/2;
                self.currentPageView.layer.cornerRadius = LYHRectangleH/2;
                break;
            }
            case LYHPageControlHorizontalTpyeMixRectanglePoint:{// 混搭风格
                if (index == self.currentPage) {
                    self.pageView.frame = CGRectMake(index *(LYHRectangleH+LYHRectangle2PagePadding), 0, LYHRectangleW, LYHRectangleH);
                }else if (index < self.currentPage){
                    self.pageView.frame = CGRectMake((LYHRectangleH+LYHRectangle2PagePadding)*index, 0, LYHRectangleH, LYHRectangleH);
                }else if (index > self.currentPage){
                    self.pageView.frame = CGRectMake((LYHRectangleW+LYHRectangle2PagePadding)+(index-1)*(LYHRectangle2PagePadding+LYHRectangleH), 0, LYHRectangleH, LYHRectangleH);
                }
                self.pageView.layer.cornerRadius = LYHRectangleH/2;
                break;
            }
            default:
                break;
        }
        [self addSubview:self.pageView];
        [self.pageViewArray addObject:self.pageView];
        
        if (_styel != LYHPageControlHorizontalTpyeMixRectanglePoint) {
            [self setDetailsForView:index];
        }else{
            self.pageView.backgroundColor = self.pageIndicatorTintColor;
        }
        
    }
}
- (void)setDetailsForMix:(int)index
{
    self.pageView.backgroundColor = self.pageIndicatorTintColor;
}
- (void)setDetailsForView:(int)index
{
    // 设置未被点击的视图的样式
    self.pageView.backgroundColor = self.pageIndicatorTintColor;
    
    if (index == 0) {
        self.currentPageView.frame = CGRectMake(0, 0, self.pageView.bounds.size.width, self.pageView.bounds.size.height);
        self.currentPageView.backgroundColor = self.currentPageIndicatorTintColor;
        [self.pageView addSubview:self.currentPageView];
    }
    
    // 设置透明的按钮，触发点击方法
    UIButton *pageButton = [UIButton buttonWithType:UIButtonTypeCustom];
    pageButton.backgroundColor = [UIColor clearColor];
    pageButton.tag = index;
    pageButton.frame = CGRectMake(0, 0, self.pageView.bounds.size.width, self.pageView.bounds.size.height);
    [pageButton addTarget:self action:@selector(clickPageButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.pageView addSubview:pageButton];
}
- (void)clickPageButton:(UIButton *)pageButton
{
    // 首先判断currentPage是+1还是-1
    if (pageButton.tag>self.currentPage) {
        self.currentPage += 1;
    }else if(pageButton.tag<self.currentPage){
        self.currentPage -= 1;
    }
    if ([self.delegate respondsToSelector:@selector(pageControl:changgeCurrentPage:)]) {
        [self.delegate pageControl:self changgeCurrentPage:self.currentPage];
    }
    [self moveScreen];
}
/**
 *  移动屏幕或者点击圈圈的时候调用
 */
- (void)moveScreen
{
    if (_styel == LYHPageControlHorizontalTpyeMixRectanglePoint) {
        for (int index = 0; index < self.numberOfPages; index++) {
            self.pageView = self.pageViewArray[index];
            [self.pageView removeFromSuperview];
            if (index == self.currentPage) {
                self.pageView.frame = CGRectMake(index *(LYHRectangleH+LYHRectangle2PagePadding), 0, LYHRectangleW, LYHRectangleH);
            }else if (index < self.currentPage){
                self.pageView.frame = CGRectMake((LYHRectangleH+LYHRectangle2PagePadding)*index, 0, LYHRectangleH, LYHRectangleH);
            }else if (index > self.currentPage){
                self.pageView.frame = CGRectMake((LYHRectangleW+LYHRectangle2PagePadding)+(index-1)*(LYHRectangle2PagePadding+LYHRectangleH), 0, LYHRectangleH, LYHRectangleH);
            }
            self.pageView.layer.cornerRadius = LYHRectangleH/2;
            [self addSubview:self.pageView];
            [self setDetailsForMix:index];
            //            [self.pagesList addObject:self.pageBackgroundView];
            //            [self setDetailsForView:index];
        }
    }else{
        self.pageView = self.pageViewArray[self.currentPage];
        
        [self.currentPageView removeFromSuperview];
        self.currentPageView.bounds = CGRectMake(0, 0, self.pageView.bounds.size.width, self.pageView.bounds.size.height);
        self.currentPageView.backgroundColor = self.currentPageIndicatorTintColor;
        [self.pageView addSubview:self.currentPageView];
    }
}
#pragma mark - KVO相关
- (void)dealloc
{
    [self removeObserver:self forKeyPath:@"currentPage"];
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    [self moveScreen];
}
- (void)layoutSubviews
{
    if (_styel == LYHPageControlHorizontalTpyeDefault) {
        self.bounds = CGRectMake(0, 0, LYHPageWight*self.numberOfPages+LYHPagePadding*(self.numberOfPages-1), LYHPageWight);
    }else if (_styel == LYHPageControlHorizontalTpyeRectangle ){
        self.bounds = CGRectMake(0, 0, LYHRectangleW*self.numberOfPages+LYHPagePadding*(self.numberOfPages-1), LYHRectangleH);
    }else if (_styel == LYHPageControlHorizontalTpyeMixRectanglePoint) {
        self.bounds = CGRectMake(0, 0, LYHRectangleW+(LYHRectangle2PagePadding+LYHRectangleH)*(self.numberOfPages-1), LYHRectangleH);
    }
    [super layoutSubviews];
}

@end
