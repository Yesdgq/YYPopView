//
//  YYPopView.m
//  iFaceTime
//
//  Created by yesdgq on 2019/12/12.
//  Copyright © 2019 yesdgq. All rights reserved.
//

#import "YYPopView.h"
#import "YYPopCell.h"

@interface YYPopView ()<UITableViewDelegate, UITableViewDataSource, UIGestureRecognizerDelegate>

@property (nonatomic, strong) NSMutableArray *data;

@end

@implementation YYPopView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        [self setupViews];
    }
    return self;
}

- (void)setData:(NSMutableArray *)data
{
    _data = data;
    [_tableView reloadData];
}

- (void)showInWindow:(UIWindow *)window
{
    [window addSubview:self];
    __weak typeof(self) ws = self;
    self.alpha = 0;
    [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        ws.alpha = 1;
    } completion:nil];
}

- (void)setupViews
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap:)];
    tap.delegate = self;
    [self addGestureRecognizer:tap];
    self.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.7];
    CGSize arrowSize = YYPopView_Arrow_Size;
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y + arrowSize.height, self.frame.size.width, self.frame.size.height - arrowSize.height)];
    self.frame = [UIScreen mainScreen].bounds;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.tableFooterView = [[UIView alloc] init];
    _tableView.scrollEnabled = NO;
    _tableView.layer.cornerRadius = 5;
    [self addSubview:_tableView];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _data.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [YYPopCell getHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YYPopCell *cell = [tableView dequeueReusableCellWithIdentifier:YYPopCell_ReuseId];
    if(!cell){
        cell = [[YYPopCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:YYPopCell_ReuseId];
    }
    [cell setData:_data[indexPath.row]];
    if (indexPath.row == _data.count - 1) {
        cell.separatorInset = UIEdgeInsetsMake(0, self.bounds.size.width, 0, 0);
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if(_delegate && [_delegate respondsToSelector:@selector(popView:didSelectRowAtIndex:)]){
        [_delegate popView:self didSelectRowAtIndex:indexPath.row];
    }
    [self hide];
}

- (void)drawRect:(CGRect)rect
{
    [[UIColor whiteColor] set];
    CGSize arrowSize = YYPopView_Arrow_Size;
    UIBezierPath *arrowPath = [[UIBezierPath alloc] init];
    [arrowPath moveToPoint:_arrowPoint];
    [arrowPath addLineToPoint:CGPointMake(_arrowPoint.x + arrowSize.width * 0.5, _arrowPoint.y + arrowSize.height)];
    [arrowPath addLineToPoint:CGPointMake(_arrowPoint.x - arrowSize.width * 0.5, _arrowPoint.y + arrowSize.height)];
    [arrowPath closePath];
    [arrowPath fill];
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"]){
        return NO;
     }
    return YES;
}

- (void)onTap:(UIGestureRecognizer *)recognizer
{
    [self hide];
}

- (void)hide
{
    __weak typeof(self) ws = self;
    self.alpha = 1;
    [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        ws.alpha = 0;
    } completion:^(BOOL finished) {
        if([ws superview]){
            [ws removeFromSuperview];
        }
    }];
}

@end
