//
//  FirstTabeleVC.m
//  LYHPagecontrol
//
//  Created by 厉煜寰 on 15/11/7.
//  Copyright © 2015年 SXT. All rights reserved.
//

#import "YHFirstTabeleVC.h"
#import "YHNewFeatureVC.h"

@interface YHFirstTabeleVC ()
@property (nonatomic, strong) NSArray *array;
@end

@implementation YHFirstTabeleVC
- (void)viewDidLoad
{
    self.view.backgroundColor = [UIColor orangeColor];
    self.title = @"pageControl的样式";
}
- (NSArray *)array
{
    if (_array == nil) {
        _array = [NSArray arrayWithObjects:@"样式一:小圆点",@"样式二:小长条",@"样式三:圆点+长条", nil];
    }
    return _array;
}
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = self.array[indexPath.row];
    return cell;
}
- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    YHNewFeatureVC *newVC = [[YHNewFeatureVC alloc] initWithRow:indexPath.row];
    [self.navigationController pushViewController:newVC animated:YES];
}
- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 20;
}
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 64;
}
@end
