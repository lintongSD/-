//
//  ViewController.m
//  TestMethod
//
//  Created by EBIZM2 on 2019/2/18.
//  Copyright © 2019年 EBIZM2. All rights reserved.
//

#import "ViewController.h"
#import "SonPerson.h"
#import <objc/message.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    id son = [[SonPerson alloc] init];
//    [son appendString:@""];
    
    objc_msgSend(son, sel_registerName("eat"));
}


@end
