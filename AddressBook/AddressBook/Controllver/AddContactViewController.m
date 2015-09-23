//
//  AddContactViewController.m
//  AddressBook
//
//  Created by huchunyuan on 15/8/28.
//  Copyright (c) 2015年 Lafree. All rights reserved.
//

#import "AddContactViewController.h"
#import "AddContactView.h"
#import "Contact.h"
#import "DataHandle.h"

@interface AddContactViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (nonatomic,retain)AddContactView *addView;
@property (nonatomic,retain)Contact *contact;// 记录将要添加的联系人
@end

@implementation AddContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 自定义navigationItem
    [self customizeNavigationItem];
    // 布局添加视图
    [self layoutAddView];
}
// 自定义navigationItem
- (void)customizeNavigationItem{
    // title
    self.navigationItem.title = @"添加联系人";
    // rightBarButtonItem
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"保存" style:(UIBarButtonItemStyleDone) target:self action:@selector(saveAction:)];
  
}
// 选择图片
- (void)tapAction:(UITapGestureRecognizer *)tap{
    // 相册
    UIImagePickerController *piker = [[UIImagePickerController alloc] init];
    piker.delegate = self;
    // 模态
    [self presentViewController:piker animated:YES completion:nil];
}
// 图片
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    // 获取图片
    UIImage *image = [info valueForKey:@"UIImagePickerControllerOriginalImage"];
    // 控件赋值
    _addView.picView.image = image;
    if (self.contact == nil) {
        self.contact = [[Contact alloc] init];
    }
    _contact.image = image;
    [self dismissViewControllerAnimated:YES completion:nil];
}
// 保存
- (void)saveAction:(UIBarButtonItem *)item{
    // 给联系人对象赋值
    if (self.contact == nil) {
        self.contact = [[Contact alloc] init];
    }
    _contact.name = _addView.nameTf.text;
    _contact.sex = _addView.sexTf.text;
    _contact.phoneNumber = _addView.phoneNumberTf.text;
    _contact.introduce = _addView.introduceTv.text;
    if (_contact.name.length == 0 || _contact.phoneNumber == 0) {
        return;
    }
    // 将联系人 添加到数据字典中
    [[DataHandle shareDateHandle] addContact:_contact];
    // 跳回
    [self dismissViewControllerAnimated:YES completion:nil];
}
// 布局添加视图
- (void)layoutAddView{
    self.addView = [[AddContactView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_addView];
    [_addView release];
    
    // 头像添加手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    // 添加
    [_addView.picView addGestureRecognizer:tap];
    [tap release];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
