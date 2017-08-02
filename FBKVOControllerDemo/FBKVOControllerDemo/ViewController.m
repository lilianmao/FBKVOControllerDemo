//
//  ViewController.m
//  FBKVOControllerDemo
//
//  Created by 李林 on 2017/5/17.
//  Copyright © 2017年 lee. All rights reserved.
//

#import "ViewController.h"
#import <KVOController/KVOController.h>
#import "Person.h"

@interface ViewController (){
    FBKVOController *_kvoCtrl;
}

@property (weak, nonatomic) IBOutlet UIButton *button;
@property (weak, nonatomic) IBOutlet UIView *colorView;
@property (nonatomic, strong) Person *person;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _person = [[Person alloc] init];
    _person.age = 22;
    [self.button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    
    // FBKVOController
    _kvoCtrl = [FBKVOController controllerWithObserver:self];
    [_kvoCtrl observe:_person keyPath:@"age" options:0 action:@selector(changeColor)];
    
    
    // 系统的KVO
    [_person addObserver:self
              forKeyPath:@"age"
                 options:NSKeyValueObservingOptionNew
                 context:nil];
    _person.age++;
}

- (void)buttonClick {
    _person.age++;
}

- (void)changeColor {
    self.colorView.backgroundColor = [UIColor redColor];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"%@", change);
}

- (void)dealloc {
    [_person removeObserver:self forKeyPath:@"age"];
}


@end
