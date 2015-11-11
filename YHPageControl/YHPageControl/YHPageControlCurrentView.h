//
//  LYHPageControlCurrentView.h
//  LYHPagecontrol
//
//  Created by 厉煜寰 on 15/11/10.
//  Copyright © 2015年 SXT. All rights reserved.
//  被选中的视图

#import <UIKit/UIKit.h>
#import "YHPageControlConst.h"


@interface YHPageControlCurrentView : UIView
@property (nonatomic, strong) UIColor *bgColor;/**< 背景颜色 */
@property (nonatomic, strong) UIImage *currentPageImage;/**< 用图片给未选中page设颜色 */
+ (instancetype)pageControlCurrentView;
@end
