//
//  UIImage+LYHPageControl.m
//  LYHPagecontrol
//
//  Created by 厉煜寰 on 15/11/10.
//  Copyright © 2015年 SXT. All rights reserved.
//

#import "UIImage+YHPageControl.h"

@implementation UIImage (YHPageControl)
+ (UIImage *)resizeImageWithName:(NSString *)name
{
    return [UIImage resizeImageWithName:name left:0.5 top:0.5];
}
+ (UIImage *)resizeImageWithName:(NSString *)name left:(CGFloat)left top:(CGFloat)top
{
    /** 将图片拉伸 */
    UIImage *image = [UIImage imageNamed:name];
    // 拉伸图片的方法
    UIImage *resizeImage = [image stretchableImageWithLeftCapWidth:image.size.width * left topCapHeight:image.size.height * top];
    return resizeImage;
}
@end
