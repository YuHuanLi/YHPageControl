//
//  NewFeatureVC.m
//  LYHPagecontrol
//
//  Created by 厉煜寰 on 15/11/7.
//  Copyright © 2015年 SXT. All rights reserved.
//

#import "YHNewFeatureVC.h"
#import "YHPageControl.h"
#import "YHCheckBox.h"


#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height
// 6.四舍五入函数
#define WBDounble2Int(doubleNumber) (int)(doubleNumber+0.5)

@interface YHNewFeatureVC ()<UIScrollViewDelegate,LYHPageControlDelegate>
@property (nonatomic, weak) YHBasicPageControl *page;
@property (nonatomic, strong) UIScrollView *scrolleView;
@property (nonatomic, assign) NSInteger row;
@end

@implementation YHNewFeatureVC

- (instancetype)initWithRow:(NSInteger)row
{
    if (self = [super init]) {
        self.row = row;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationController.navigationBarHidden = YES;
    // 添加scrollView
    [self setupScrollView];
    // 添加pageControl
    [self setupPageControl];

}
- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    self.navigationController.navigationBarHidden = NO;
}
/**
 *  添加scrollView
 */
- (void)setupScrollView
{
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight)];
    [self.view addSubview:view];
    view.backgroundColor = [UIColor orangeColor];
    
    UIScrollView *scrolleView = [[UIScrollView alloc]init];
    scrolleView.frame = CGRectMake(0, 0, kWidth, kHeight);
    scrolleView.delegate = self;
    scrolleView.contentSize = CGSizeMake(3*kWidth, kHeight-64);
    scrolleView.pagingEnabled = YES;
    scrolleView.showsHorizontalScrollIndicator = NO;
    scrolleView.showsVerticalScrollIndicator = NO;
    scrolleView.bounces = NO;
    [view addSubview:scrolleView];
    self.scrolleView = scrolleView;
    // 添加图片
    for (int index=1; index<4; index++) {
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"new_feature_%d-568h@2x",index]];
        CGFloat imageX = (index-1) * kWidth;
        CGFloat imageY = 0;
        CGFloat imageH = kHeight;
        CGFloat imageW = kWidth;
        imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
        [scrolleView addSubview:imageView];
        if (index == 3) {
            [self setupLastImageView:imageView];
        }
    }
}
/**
 *  添加pageControl
 */
- (void)setupPageControl
{
    CGFloat centerX = kWidth * 0.5;
    CGFloat centerY = kHeight - 30 ;
    YHBasicPageControl *page;
    switch (self.row) {
        case 0:{
            page = [[YHPageControlHorizontal alloc] initWithStyel:LYHPageControlHorizontalTpyeDefault];
            break;
        }
        case 1:{
            page = [[YHPageControlHorizontal alloc] initWithStyel:LYHPageControlHorizontalTpyeRectangle];
            break;
        }
        case 2:{
            page = [[YHPageControlHorizontal alloc] initWithStyel:LYHPageControlHorizontalTpyeMixRectanglePoint];
            break;
        }
        default:
            break;
    }
    page.center = CGPointMake(centerX, centerY);
    page.numberOfPages = 3;
    page.delegate = self;
    
    [self.view addSubview:page];
    self.page = page;
}
/**
 *  添加内容到最后一张图片上
 */
- (void)setupLastImageView:(UIImageView *) imageView
{
    imageView.userInteractionEnabled = YES;
    // 添加开始按钮
    UIButton *startButton = [[UIButton alloc]init];
    [startButton setBackgroundImage:[UIImage resizeImageWithName:@"new_feature_finish_button"] forState:UIControlStateNormal];
    [startButton setBackgroundImage:[UIImage resizeImageWithName:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
    [imageView addSubview:startButton];
    CGFloat centerX = kWidth *0.5;
    CGFloat centerY = kHeight *0.6;
    startButton.center = CGPointMake(centerX, centerY);
    startButton.bounds = (CGRect){CGPointZero, startButton.currentBackgroundImage.size};
    [startButton setTitle:@"立即体验" forState:UIControlStateNormal];
    [startButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    [startButton addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
    // 添加checkBox
    YHCheckBox *checkbox = [YHCheckBox checkBox];
    checkbox.title = @"点击进入";
    CGFloat centerCheckY = kHeight * 0.5;
    checkbox.center = CGPointMake(centerX, centerCheckY);
    checkbox.bounds = CGRectMake(0, 0, 200, 30);
    [imageView addSubview:checkbox];
}

/**
 *  滑动UIScrollerView就滚动
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat contentOffX = scrollView.contentOffset.x;
    double currentPageDouble = contentOffX/kWidth;
    int currentPageInt = WBDounble2Int(currentPageDouble);
    self.page.currentPage = currentPageInt;
}
- (void)pageControl:(YHBasicPageControl *)pageControl changgeCurrentPage:(NSInteger)currentPage
{
    [UIView animateWithDuration:0.5f animations:^{
        self.scrolleView.contentOffset = CGPointMake(self.page.currentPage*kWidth, 0);
    }];
}

@end
