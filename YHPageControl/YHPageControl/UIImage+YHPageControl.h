//
//  UIImage+LYHPageControl.h
//  LYHPagecontrol
//
//  Created by 厉煜寰 on 15/11/10.
//  Copyright © 2015年 SXT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (YHPageControl)
/**
 *  返回一张自由拉伸的图片
 *
 *  @param name 图片名字
 *
 *  @return 自由拉伸的图片
 */
+ (UIImage *) resizeImageWithName:(NSString *)name;
/**
 *  返回一张自由拉伸的图片
 *
 *  @param name 图片名字
 *  @param left 左边多少需要保护（百分比）
 *  @param top  顶部多少需要保护（百分比）
 *
 *  @return 自由拉伸的图片
 */
+ (UIImage *) resizeImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top;
@end
