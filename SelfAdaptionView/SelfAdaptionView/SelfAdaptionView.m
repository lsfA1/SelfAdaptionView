//
//  SelfAdaptionView.m
//  SelfAdaptionView
//
//  Created by 李少锋 on 2018/11/21.
//  Copyright © 2018年 李少锋. All rights reserved.
//

#import "SelfAdaptionView.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height

static CGFloat BackGroundHeight;

@implementation SelfAdaptionView

- (void)createView:(NSArray *)dataArray andBlock:(ChoseItemBlock)block{
    _block=block;
    
    UIView *backGroundView = [[UIView alloc]init];
    backGroundView.backgroundColor = [UIColor colorWithWhite:0.7 alpha:1];
    [self addSubview:backGroundView];
    
    float spaceWitdh = 0;
    NSInteger index = 0;
    for (int i=0; i<dataArray.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.layer.cornerRadius = 5;
        button.layer.masksToBounds = YES;
        button.backgroundColor = [UIColor whiteColor];
        [button setTitle:dataArray[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:12];
        
        NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:12]};
        CGSize size = [dataArray[i] boundingRectWithSize:CGSizeMake(SCREEN_WIDTH, 15) options: NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attribute context:nil].size;
        
        float sizeWidth = size.width + 10 + spaceWitdh + 10;
        if (sizeWidth > SCREEN_WIDTH) {
            index ++;
            spaceWitdh = 0;
            button.frame = CGRectMake(7 + spaceWitdh, 10+40*index, size.width + 10, 30);
            spaceWitdh = button.frame.size.width + 10;
        }else{
            button.frame = CGRectMake(7 + spaceWitdh, 10+40*index, size.width + 10, 30);
            spaceWitdh = sizeWidth;
        }
        
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [backGroundView addSubview:button];
    }
    BackGroundHeight = 40*(index + 1) + 10;
    backGroundView.frame = CGRectMake(0, 0, SCREEN_WIDTH, BackGroundHeight);
    CGRect selfFrame=self.frame;
    selfFrame.size.height=BackGroundHeight;
    self.frame = selfFrame;
}

+(CGFloat)getViewHeight{
    return BackGroundHeight;
}

-(void)buttonClick:(UIButton *)btn{
    if(_block){
        _block(btn.currentTitle);
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
