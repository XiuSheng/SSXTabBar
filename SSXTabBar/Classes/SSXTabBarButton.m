//
//  SSXTabBarButton.m
//  Expecta
//
//  Created by sishengxiu on 2018/5/23.
//

#import "SSXTabBarButton.h"
@interface SSXTabBarButton()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UILabel *badgeValueLabel;
@property (nonatomic, copy) NSString *title;


@end
@implementation SSXTabBarButton

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake((frame.size.width - 27.5)/2, 4, 27.5, 27.5)];
        _imageView.contentMode = UIViewContentModeScaleAspectFit;
        _label = [[UILabel alloc] initWithFrame:CGRectMake(0, self.imageView.frame.origin.y+self.imageView.frame.size.height+3.5, self.frame.size.width, 12)];
        _label.textColor = [UIColor colorWithRed:128/255.0 green:128/255.0 blue:128/255.0 alpha:1];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.font = [UIFont systemFontOfSize:10];
        _badgeValueLabel = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width/2+8.5, 2, 18, 18)];
        _badgeValueLabel.textAlignment = NSTextAlignmentCenter;
        _badgeValueLabel.font = [UIFont systemFontOfSize:15];
        _badgeValueLabel.textColor = [UIColor whiteColor];
        _badgeValueLabel.layer.masksToBounds = YES;
        _badgeValueLabel.layer.cornerRadius = 9;
        _badgeValueLabel.backgroundColor = [UIColor redColor];
        [self addSubview:_imageView];
        [self addSubview:_label];
        [self addSubview:_badgeValueLabel];
    }
    return self;
}

- (void)setTabBarItem:(UITabBarItem *)tabBarItem{
    _tabBarItem = tabBarItem;
    _label.text = tabBarItem.title;
    _imageView.image = [tabBarItem valueForKey:@"templateImage"];
    self.badgeValue = tabBarItem.badgeValue.integerValue;
}

- (void)setIsSelected:(BOOL)isSelected{
    _isSelected = isSelected;
    if (isSelected) {
        _label.textColor = [UIColor colorWithRed:0/255.0f green:122/255.0f blue:255/255.0f alpha:1.0f];
        _imageView.image = [_tabBarItem selectedImage];
    }else{
        _label.textColor = [UIColor colorWithRed:128/255.0f green:128/255.0f blue:128/255.0f alpha:1.0f];
        _imageView.image = [_tabBarItem valueForKey:@"templateImage"];
    }
}

- (void)setBadgeValue:(NSInteger)badgeValue{
    _badgeValue = badgeValue;
    CGRect badgeFrame = _badgeValueLabel.frame;
    if (badgeValue<=0) {
        self.badgeValueLabel.hidden = YES;
    }else{
        self.badgeValueLabel.hidden = NO;
        if (badgeValue<=9) {
            badgeFrame.size.width = 18;
        }else {
            badgeFrame.size.width = 26.5;
        }
    }
    if (badgeValue>99) {
        badgeFrame.size.width = 35;
        self.badgeValueLabel.text = @"99+";
    }else{
        self.badgeValueLabel.text = @(badgeValue).stringValue;
    }
    _badgeValueLabel.frame = badgeFrame;
}


@end
