//
//  DetailViewController.m
//  LessonUI-15-StoryBoard
//
//  Created by huchunyuan on 15/9/4.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_nameLabel release];
    [_sexLabel release];
    [_phoneLabel release];
    [_picView release];
    [super dealloc];
}
@end
