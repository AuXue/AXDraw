//
//  ViewController.m
//  绘图
//
//  Created by yangqijia on 2016/12/15.
//  Copyright © 2016年 yangqijia. All rights reserved.
//

#import "ViewController.h"
#import "ChartViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    for (int i = 0; i < 3; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.tag = 100 + i;
        button.frame = CGRectMake(30, 40 * (i + 1) + 40, self.view.frame.size.width - 60, 35);
        if (i == 0) {
            [button setTitle:@"折线图" forState:UIControlStateNormal];
        }else if (i == 1){
            [button setTitle:@"柱状图" forState:UIControlStateNormal];
        }else if (i == 2){
            [button setTitle:@"饼形图" forState:UIControlStateNormal];
        }
        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(selectAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
}




-(void)selectAction:(UIButton *)sender
{
    if (sender.tag == 100) {
        ChartViewController *chartVC = [[ChartViewController alloc]initWithType:0 title:@"折线图"];
        [self.navigationController pushViewController:chartVC animated:YES];
    }else if (sender.tag == 101){
        ChartViewController *chartVC = [[ChartViewController alloc]initWithType:1 title:@"柱状图"];
        [self.navigationController pushViewController:chartVC animated:YES];
    }else{
        ChartViewController *chartVC = [[ChartViewController alloc]initWithType:2 title:@"饼形图"];
        [self.navigationController pushViewController:chartVC animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
