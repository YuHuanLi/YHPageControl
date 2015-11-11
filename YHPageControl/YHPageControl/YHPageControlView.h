//
//  LYHPageControlView.h
//  LYHPagecontrol
//
//  Created by 厉煜寰 on 15/11/10.
//  Copyright © 2015年 SXT. All rights reserved.
//  未被选中的视图

#import <UIKit/UIKit.h>

@interface YHPageControlView : UIView
@property (nonatomic, strong) UIColor *bgColor;/**< 背景颜色 */
@property (nonatomic, strong) UIImage *pageImage;/**< 用图片给未选中page设颜色 */
+ (instancetype)pageControlView;
@end
