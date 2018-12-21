//
//  TabItemElement.m
//  GICTemplate
//
//  Created by 龚海伟 on 2018/12/21.
//  Copyright © 2018年 龚海伟. All rights reserved.
//

#import "TabItemElement.h"
#import <GICXMLLayout/GICStringConverter.h>

@implementation TabItemElement
+(NSString *)gic_elementName{
    return @"tab";
}

+(NSDictionary<NSString *,GICValueConverter *> *)gic_elementAttributs{
    return  @{
              @"icon":[[GICStringConverter alloc] initWithPropertySetter:^(NSObject *target, id value) {
                  [(TabItemElement *)target setIcon:value];
              }],
              @"selected-icon":[[GICStringConverter alloc] initWithPropertySetter:^(NSObject *target, id value) {
                  [(TabItemElement *)target setSelectedIcon:value];
              }],
              @"title":[[GICStringConverter alloc] initWithPropertySetter:^(NSObject *target, id value) {
                  [(TabItemElement *)target setTitle:value];
              }],
              @"root":[[GICStringConverter alloc] initWithPropertySetter:^(NSObject *target, id value) {
                  [(TabItemElement *)target setRootPath:value];
              }],
              };;
}
@end
