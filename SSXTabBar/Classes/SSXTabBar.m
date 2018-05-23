//
//  SSXTabBarController.m
//  Expecta
//
//  Created by sishengxiu on 2018/5/23.
//
#define SSX_SCREEN_WIDTH        ([[UIScreen mainScreen] bounds].size.width)
#define SSX_SCREEN_HEIGHT       ([[UIScreen mainScreen] bounds].size.height)
#define isIPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125,2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define SSX_TabBarHeight (isIPhoneX?83:49)


#import "SSXTabBar.h"
#import "SSXTabBarButton.h"

@interface SSXTabBar ()
{
    CGRect tabBarButtonFrame;
    SSXTabBarButton *selectedTabBtn;
}
@property (nonatomic, strong) NSMutableArray *tabBarArr;
@property (nonatomic, strong) UIScrollView *contentView;
@end

@implementation SSXTabBar


- (instancetype)init{
    self = [super init];
    if (self = [super init]) {
        _ssxTabBarStyle = SSXTabBarStyleNone;
    }
    return self;
}

/**
 重写setViewControllers
 当viewControllers大于5时走自定义方法啊，让其TabrBar可以滑动

 @param viewControllers tabbar的viewControllers
 */
- (void)setViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers{
    [super setViewControllers:viewControllers];
    if (viewControllers.count>5) {
        _ssxTabBarStyle = SSXTabBarStyleScroll;
        [self setscrollTabBar];
    }
}

- (void)setscrollTabBar{
    
    if (!_contentView) {
        _contentView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SSX_SCREEN_WIDTH, SSX_TabBarHeight)];
        _contentView.showsHorizontalScrollIndicator = NO;
        _contentView.backgroundColor = [UIColor colorWithRed:249/255.0f green:249/255.0f blue:249/255.0f alpha:1.0f];
        [_contentView setContentSize:CGSizeMake(SSX_SCREEN_WIDTH/5*self.viewControllers.count, SSX_TabBarHeight)];
        int i = 0;
        BOOL isGetFrame = NO;
        for (UIView *subview in self.tabBar.subviews) {
            if ([[NSString stringWithUTF8String:object_getClassName(subview)] isEqualToString:@"UITabBarButton"]) {
                subview.hidden = YES;
                if (!isGetFrame) {
                    tabBarButtonFrame = subview.frame;
                }
                isGetFrame = YES;
            }
        }
        if (tabBarButtonFrame.size.width<=0) {
            tabBarButtonFrame = CGRectMake(2, 1, (SSX_SCREEN_WIDTH -2*6)/5, self.tabBar.frame.size.height);
        }
        _tabBarArr = [[NSMutableArray alloc] initWithCapacity:self.viewControllers.count];
        for (i=0; i<self.viewControllers.count; i++) {
            UINavigationController *nav = self.viewControllers[i];
            if (i>=4) {//如果不设置左边的tabbarButton会出现more的返回按钮
                [nav.viewControllers firstObject].navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] init];
            }
            SSXTabBarButton *tabBarButton = [[SSXTabBarButton alloc] initWithFrame:CGRectMake(SSX_SCREEN_WIDTH/5*i, tabBarButtonFrame.origin.y, (SSX_SCREEN_WIDTH -2*6)/5, tabBarButtonFrame.size.height)];
            tabBarButton.tabBarItem = nav.tabBarItem;
            [_contentView addSubview:tabBarButton];
            tabBarButton.index = i;
            [nav.tabBarItem addObserver:self forKeyPath:@"badgeValue" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTabBarSelectItem:)];
            [tabBarButton addGestureRecognizer:tap];
            [_tabBarArr addObject:tabBarButton];
        }
        [self.tabBar addSubview:_contentView];
        self.selectedIndex = 0;
    }
}

- (void)setSelectedIndex:(NSUInteger)selectedIndex{
    if (_ssxTabBarStyle == SSXTabBarStyleScroll) {
        UIViewController *didSelectViewController = (UIViewController *)self.viewControllers[selectedIndex];
        if ([self.delegate respondsToSelector:@selector(tabBarController:shouldSelectViewController:)]) {
            [self.delegate tabBarController:self shouldSelectViewController:didSelectViewController];
        }
        [super setSelectedIndex:selectedIndex];
        if ([self.delegate respondsToSelector:@selector(tabBarController:didSelectViewController:)]) {
            [self.delegate tabBarController:self didSelectViewController:didSelectViewController];
        }
        SSXTabBarButton *tabBarBtn = _tabBarArr[selectedIndex];
        tabBarBtn.isSelected = YES;
        if (tabBarBtn==selectedTabBtn) {
            return;
        }else{
            selectedTabBtn.isSelected = NO;
            selectedTabBtn = tabBarBtn;
        }
    }else{
        [super setSelectedIndex:selectedIndex];
    }
    
}

- (void)didTabBarSelectItem:(UITapGestureRecognizer *)tap{
    SSXTabBarButton *tabBarBtn = (SSXTabBarButton*)tap.view;
    self.selectedIndex = tabBarBtn.index;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"badgeValue"]) {
        SSXTabBarButton *tabBar;
        for (int i = 0; i<_tabBarArr.count; i++) {
            SSXTabBarButton *tempTabBar = _tabBarArr[i];
            if (tempTabBar.tabBarItem == object) {
                tabBar = tempTabBar;
                break;
            }
        }
        if (tabBar) {
            if ([[change valueForKey:NSKeyValueChangeNewKey] isKindOfClass:[NSNull class]]) {
                tabBar.badgeValue = 0;
            }else{
                tabBar.badgeValue = [[change valueForKey:NSKeyValueChangeNewKey]?:@"0" integerValue];
            }
        }
    }
}

- (void)setSSXTabBarItemBadgeValue:(NSString *)badgeValue ForTabBarIndex:(NSInteger)tabBarIndex{
    if (_tabBarArr.count>tabBarIndex) {
        SSXTabBarButton *tabBarBtn = _tabBarArr[tabBarIndex];
        tabBarBtn.badgeValue = [badgeValue integerValue];
    }
}



@end
