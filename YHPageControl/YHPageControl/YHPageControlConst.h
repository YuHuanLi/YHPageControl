//
//  LYHPageControlConst.h
//  LYHPagecontrol
//
//  Created by 厉煜寰 on 15/11/10.
//  Copyright © 2015年 SXT. All rights reserved.
//

#import <Foundation/Foundation.h>

#define LYHPagePadding 12
#define LYHPageWight 6

#define LYHRectangleW 14
#define LYHRectangleH 4
#define LYHRectangle2PagePadding 4

/**
 *  水平方向pageControl的样式，默认为Default类型
 */
typedef NS_ENUM(NSInteger,LYHPageControlHorizontalTpye) {
    /**
     *  默认的样式,与系统的小圆点一样
     */
    LYHPageControlHorizontalTpyeDefault = 1 << 0,
    /**
     *  长方形样式
     */
    LYHPageControlHorizontalTpyeRectangle = 1 << 1,
    /**
     *  默认和长方形混搭,这种类型只能通过pageIndicatorTintColor改变pageControl的颜色
     */
    LYHPageControlHorizontalTpyeMixRectanglePoint = 1 << 2,
};
