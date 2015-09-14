//
//  YKSDrugShuoMingViewController.m
//  YueKangSong
//
//  Created by 范 on 15/9/9.
//  Copyright (c) 2015年 YKS. All rights reserved.
//

#import "YKSDrugShuoMingViewController.h"

@interface YKSDrugShuoMingViewController ()
@property (weak, nonatomic) IBOutlet UITextView *shuoMingText;

@end

@implementation YKSDrugShuoMingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.shuoMingText.text = _shuoMingDic[@"gmanual"];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
