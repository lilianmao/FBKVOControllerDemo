//
//  ViewController.m
//  FBKVOControllerDemo
//
//  Created by 李林 on 2017/5/17.
//  Copyright © 2017年 lee. All rights reserved.
//

#import "ViewController.h"
#import <KVOController/KVOController.h>

@interface ViewController (){
    FBKVOController *_kvoCtrl;
}

@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UIView *colorView;
@property (nonatomic, assign) NSInteger index;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.index = 0;
    [self.button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    
    // FBKVOController
    _kvoCtrl = [FBKVOController controllerWithObserver:self];
    [_kvoCtrl observe:self keyPath:@"index" options:0 action:@selector(changeColor)];
}

- (void)buttonClick {
    self.index++;
}

- (void)changeColor {
    self.colorView.backgroundColor = [UIColor redColor];
}


@end
