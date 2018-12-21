#import "TabControllerElements.h"
#import <GICXMLLayout/GICXMLLayout.h>

#import "TabItemElement.h"

@implementation TabControllerElements
+(NSString *)gic_elementName{
    return @"tabs";
}

-(id)gic_parseSubElementNotExist:(GDataXMLElement *)element{
    if([element.name isEqualToString:[TabItemElement gic_elementName]]){
        return [TabItemElement new];
    }
    return [super gic_parseSubElementNotExist:element];
}

-(void)gic_parseElementCompelete{
    [super gic_parseElementCompelete];
    NSMutableArray *mutArray=[NSMutableArray array];
    
    NSMutableArray *viewControllers=[NSMutableArray array];
    for(id node in [self gic_subElements]){
        if([node isKindOfClass:[TabItemElement class]]){
            TabItemElement *tab = node;
            NSDictionary *dict = @{
                                   CYLTabBarItemTitle : tab.title,
                                   CYLTabBarItemImage : tab.icon,
                                   CYLTabBarItemSelectedImage :tab.selectedIcon,
                                   };
            [mutArray addObject:dict];
            UIViewController *vc;
            if(tab.rootPath){
                vc = [GICXMLLayout parseElementFromPath:tab.rootPath withParentElement:self];
            }else{
                vc= [UIViewController new];
            }
            [viewControllers addObject:vc];
        }
    }
    self.tabBarItemsAttributes = mutArray;
    [self setViewControllers:viewControllers];
}
@end

