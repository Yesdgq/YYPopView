//
//  YYViewController.m
//  YYPopView
//
//  Created by yesdgq@yahoo.com on 01/21/2021.
//  Copyright (c) 2021 yesdgq@yahoo.com. All rights reserved.
//

#import "YYViewController.h"
#import <YYPopViewHeader.h>

@interface YYViewController ()

@end

@implementation YYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    
    NSMutableArray *menus = [NSMutableArray array];
    YYPopCellData *AddContact= [[YYPopCellData alloc] init];
    AddContact.image = @"AddContact";
    AddContact.title = @"添加联系人";
    [menus addObject:AddContact];
    
    YYPopCellData *deleteRecords = [[YYPopCellData alloc] init];
    deleteRecords.image = @"DeleteRecords";
    deleteRecords.title = @"清空记录";
    [menus addObject:deleteRecords];
    
    CGFloat height = [YYPopCell getHeight] * menus.count + YYPopView_Arrow_Size.height;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
