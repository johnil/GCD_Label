//
//  GCDLabel.h
//  GCD_Coretext
//
//  Created by Johnil on 13-8-16.
//  Copyright (c) 2013年 Johnil. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GCDLabel : UIView

@property (nonatomic, strong) NSString *text;
@property (nonatomic) NSTextAlignment textAlignment;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIFont *font;
@property (nonatomic) int lineSpace;

@end
