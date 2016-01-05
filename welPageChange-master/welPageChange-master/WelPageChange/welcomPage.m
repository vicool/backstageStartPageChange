//
//  welcomPage.m
//  welPageChange-master
//
//  Created by 刘家男 on 16/1/4.
//  Copyright © 2016年 刘家男. All rights reserved.
//

#import "welcomPage.h"
@interface welcomPage ()
@property (strong, nonatomic) UIView * view;
@end
@implementation welcomPage

-(UIView*)view{
    if (!_view) {
        _view=[[NSBundle mainBundle ]loadNibNamed:@"LaunchScreen" owner:nil options:nil][0];
        _view.frame = CGRectMake(0, 0, self.window.screen.bounds.size.width, self.window.screen.bounds.size.height);
    }
    return _view;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
