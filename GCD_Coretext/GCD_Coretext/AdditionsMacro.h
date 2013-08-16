//
//  AdditionsMacro.h
//  GCD_Coretext
//
//  Created by Johnil on 13-8-16.
//  Copyright (c) 2013年 Johnil. All rights reserved.
//

#define kRegexHighlightViewTypeURL @"url"
#define kRegexHighlightViewTypeAccount @"account"
#define kRegexHighlightViewTypeTopic @"topic"

#define URLRegular @"(http|https)://(t.cn/|weibo.com/)+(([a-zA-Z0-9/])*)"
#define AccountRegular @"@[\u4e00-\u9fa5a-zA-Z0-9_-]{2,24}"
#define TopicRegular @"#[^#]+#"

#define COLOR_URL [UIColor colorWithRed:44/255.0 green:142/255.0 blue:224/255.0 alpha:1]
#define COLOR_URL_CLICK [UIColor colorWithRed:224/255.0 green:44/255.0 blue:86/255.0 alpha:1]

#define FONT [UIFont fontWithName:@"STHeitiSC-Light" size:16]
#define LINE_SPCAE 5
