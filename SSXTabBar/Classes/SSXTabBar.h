//
//  SSXTabBarController.h
//  Expecta
//
//  Created by sishengxiu on 2018/5/23.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    SSXTabBarStyleNone,
    SSXTabBarStyleScroll,       //数量大于5的可滑动TabBar
} SSXTabBarStyle;

@interface SSXTabBar : UITabBarController

@property (nonatomic ,assign , readonly) SSXTabBarStyle ssxTabBarStyle;

/**
 设置tabbar上的角标未读
 当tabBar的Item数量大于5时，index >= 4的地方 对应的位置的nav是tabBar的moreNavigationController所以设置     self.navigationController.tabBarItem.badgeValue设置未读的方法失效，因此要通过下列方法设置
 @param badgeValue 未读内容
 @param tabBarIndex 对应的tabr的index
 
 */
- (void)setSSXTabBarItemBadgeValue:(NSString *)badgeValue ForTabBarIndex:(NSInteger)tabBarIndex;
@end
