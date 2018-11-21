//
//  SelfAdaptionView.h
//  SelfAdaptionView
//
//  Created by 李少锋 on 2018/11/21.
//  Copyright © 2018年 李少锋. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ChoseItemBlock)(NSString *itemName);

@interface SelfAdaptionView : UIView

@property(nonatomic,copy)ChoseItemBlock block;

- (void)createView:(NSArray *)dataArray andBlock:(ChoseItemBlock)block;

+(CGFloat)getViewHeight;

@end

NS_ASSUME_NONNULL_END
