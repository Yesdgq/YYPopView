//
//  YYPopCell.h
//  iFaceTime
//
//  Created by yesdgq on 2019/12/12.
//  Copyright © 2019 yesdgq. All rights reserved.
//

#import <UIKit/UIKit.h>

#define YYPopCell_ReuseId @"YYPopCell"
#define YYPopView_Arrow_Size CGSizeMake(10, 5)

NS_ASSUME_NONNULL_BEGIN

@interface YYPopCellData : NSObject

@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSString *title;

@end

@interface YYPopCell : UITableViewCell

@property (nonatomic, strong) UIImageView *image;
@property (nonatomic, strong) UILabel *title;

+ (CGFloat)getHeight;
- (void)setData:(YYPopCellData *)data;

@end

NS_ASSUME_NONNULL_END
