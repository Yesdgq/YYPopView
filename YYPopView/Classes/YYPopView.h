//
//  YYPopView.h
//  iFaceTime
//
//  Created by yesdgq on 2019/12/12.
//  Copyright © 2019 yesdgq. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class YYPopView;

@protocol YYPopViewDelegate <NSObject>
- (void)popView:(YYPopView *)popView didSelectRowAtIndex:(NSInteger)index;

@end


@interface YYPopView : UIView

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) CGPoint arrowPoint;
@property (nonatomic, weak) id<YYPopViewDelegate> delegate;

- (void)setData:(NSMutableArray *)data;
- (void)showInWindow:(UIWindow *)window;

@end

NS_ASSUME_NONNULL_END
