//
//  ModalViewController.m
//  
//
//  Created by huchunyuan on 15/8/28.
//
//

#import "ModalViewController.h"

@interface ModalViewController ()

@end

@implementation ModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"dismiss" style:(UIBarButtonItemStyleDone) target:self action:@selector(cancelAction:)];
    self.view.backgroundColor = [UIColor yellowColor];
}
- (void)cancelAction:(UIBarButtonItem *)item{
    [self.navigationController dismissViewControllerAnimated:YES completion:^{
        NSLog(@"回收");
    }];
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
