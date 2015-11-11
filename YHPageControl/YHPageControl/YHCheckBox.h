//
//  WBCheckBox.h
//  WeiBo
//
//  Created by 厉煜寰 on 15/10/25.
//  Copyright © 2015年 SXT. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface YHCheckBox : UIView
/**
 *  提供checkbox后面的提示文字
 */
@property (nonatomic, strong) NSString *title;
/**
 *  修改checkbox文字的颜色
 */
@property (nonatomic, strong) UIColor *titleColor;
/**
 *  修改checkbox文字的字体
 */
@property (nonatomic, strong) UIFont *titleFont;
/**
 *  是否勾选了
 */
@property (nonatomic, assign, getter=isSelecte, readonly) BOOL selecte;
/**
 *  快速创建一个checkBox
 */
+ (instancetype)checkBox;
@end
