//
//  SSXTabBarButton.h
//  Expecta
//
//  Created by sishengxiu on 2018/5/23.
//

#import <UIKit/UIKit.h>

@interface SSXTabBarButton : UIView
@property (nonatomic, strong) UITabBarItem *tabBarItem;
@property (nonatomic, strong) UIImage *norImage;
@property (nonatomic, strong) UIImage *selectedImage;
@property (nonatomic, assign) NSInteger badgeValue;
@property (nonatomic, assign) BOOL isSelected;
@property (nonatomic, assign) NSInteger index;
@end
