//
//  YYPopCell.m
//  iFaceTime
//
//  Created by yesdgq on 2019/12/12.
//  Copyright © 2019 yesdgq. All rights reserved.
//

#import "YYPopCell.h"

#define YYPopCell_Height 45
#define YYPopCell_Margin 18
#define YYPopCell_Padding 12

@implementation YYPopCellData

@end


@implementation YYPopCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self setupViews];
    }
    return self;
}

- (void)setupViews
{
    self.backgroundColor = [UIColor clearColor];

    CGFloat headHeight = YYPopCell_Height - 2 * YYPopCell_Padding;
    _image = [[UIImageView alloc] initWithFrame:CGRectMake(YYPopCell_Padding, YYPopCell_Padding, headHeight, headHeight)];
    _image.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:_image];

    CGFloat titleWidth = self.frame.size.width - 2 * YYPopCell_Padding - YYPopCell_Margin - _image.frame.size.width;
    _title = [[UILabel alloc] initWithFrame:CGRectMake(_image.frame.origin.x + _image.frame.size.width + YYPopCell_Margin, YYPopCell_Padding, titleWidth, headHeight)];
    _title.font = [UIFont systemFontOfSize:15];
    _title.textColor = [UIColor blackColor];
    [self addSubview:_title];

    [self setSeparatorInset:UIEdgeInsetsMake(0, YYPopCell_Padding, 0, 0)];
}

- (void)setData:(YYPopCellData *)data
{
    _image.image = [UIImage imageNamed:data.image];
    _title.text = data.title;
}

+ (CGFloat)getHeight
{
    return YYPopCell_Height;
}

@end
