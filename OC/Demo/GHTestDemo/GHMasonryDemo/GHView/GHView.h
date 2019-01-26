//
//  GHView.h
//  GHMasonryDemo
//
//  Created by zhaozhiwei on 2019/1/26.
//  Copyright © 2019年 GHome. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^GHViewFrameBlock)(void);
@interface GHView : UIView

@property (nonatomic , copy) GHViewFrameBlock changeFrameBlock;
@end

NS_ASSUME_NONNULL_END
