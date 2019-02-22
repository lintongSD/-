//
//  SonPerson.m
//  TestFunc
//
//  Created by EBIZM2 on 2019/2/18.
//  Copyright © 2019年 EBIZM2. All rights reserved.
//

#import "SonPerson.h"
#import <objc/runtime.h>
#import "ForwardPerson.h"
@implementation SonPerson
void dynamicAdditionMethodIMP(id self,SEL _cmd){
    NSLog(@"dynamicAdditionMethodIMP");
}
- (void)eat{
    NSLog(@"------    eat");
}
//---------添加方法-----------
+ (BOOL)resolveClassMethod:(SEL)sel{
    NSLog(@"resolveInstanceMethod: %@", NSStringFromSelector(sel));
    if(sel == @selector(appendString:)) {
        class_addMethod([self class], sel, (IMP)dynamicAdditionMethodIMP,"v@:");
        return YES;
    }
    return [super resolveClassMethod:sel];
}

+(BOOL)resolveInstanceMethod:(SEL)sel{
    
//    NSLog(@"resolveInstanceMethod: %@", NSStringFromSelector(sel));
//    if(sel == @selector(appendString:)) {
//        class_addMethod([self class], sel, (IMP)dynamicAdditionMethodIMP,"v@:");
//        return YES;
//    }
    return [super resolveInstanceMethod:sel];
}

//---------消息转发-----------
//- (id)forwardingTargetForSelector:(SEL)aSelector{
//    NSLog(@"forwardingTargetForSelector   %@", NSStringFromSelector(aSelector));
//    return [ForwardPerson new];
//}

//---------生成方法签名转发消息-----------
//- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
//    NSString *sel = NSStringFromSelector(aSelector);
//    if ([sel isEqualToString:@"appendString"]) {
//        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
//    } else {
//        return [super methodSignatureForSelector:aSelector];
//    }
//}

@end
