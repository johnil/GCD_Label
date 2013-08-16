//
//  TableViewController.m
//  GCD_Coretext
//
//  Created by Johnil on 13-8-16.
//  Copyright (c) 2013年 Johnil. All rights reserved.
//

#import "TableViewController.h"
#import "GCDLabel.h"
#import "NormalLabel.h"

static NSString *content = @"【电影#《乔布斯》#今日在美上映】艾什顿•库切(Ashton Kutcher)主演的传记片《乔布斯》今天将在美国正式上映。2011年10月，@乔布斯 去世。自称科技极客的库切最近在旧金山的首映式上表示：“无论谁来演，我都希望这个人真正喜欢乔布斯。而我热爱他！” http://t.cn/zOiq01w http://t.cn/zHdMxGj 【电影#《乔布斯》#今日在美上映】艾什顿•库切(Ashton Kutcher)主演的传记片《乔布斯》今天将在美国正式上映。2011年10月，@乔布斯 去世。自称科技极客的库切最近在旧金山的首映式上表示：“无论谁来演，我都希望这个人真正喜欢乔布斯。而我热爱他！” http://t.cn/zOiq01w http://t.cn/zHdMxGj【电影#《乔布斯》#今日在美上映】艾什顿•库切(Ashton Kutcher)主演的传记片《乔布斯》今天将在美国正式上映。2011年10月，@乔布斯 去世。自称科技极客的库切最近在旧金山的首映式上表示：“无论谁来演，我都希望这个人真正喜欢乔布斯。而我热爱他！” http://t.cn/zOiq01w http://t.cn/zHdMxGj 【电影#《乔布斯》#今日在美上映】艾什顿•库切(Ashton Kutcher)主演的传记片《乔布斯》今天将在美国正式上映。2011年10月，@乔布斯 去世。自称科技极客的库切最近在旧金山的首映式上表示：“无论谁来演，我都希望这个人真正喜欢乔布斯。而我热爱他！” http://t.cn/zOiq01w http://t.cn/zHdMxGj【电影#《乔布斯》#今日在美上映】艾什顿•库切(Ashton Kutcher)主演的传记片《乔布斯》今天将在美国正式上映。2011年10月，@乔布斯 去世。自称科技极客的库切最近在旧金山的首映式上表示：“无论谁来演，我都希望这个人真正喜欢乔布斯。而我热爱他！” http://t.cn/zOiq01w http://t.cn/zHdMxGj 【电影#《乔布斯》#今日在美上映】艾什顿•库切(Ashton Kutcher)主演的传记片《乔布斯》今天将在美国正式上映。2011年10月，@乔布斯 去世。自称科技极客的库切最近在旧金山的首映式上表示：“无论谁来演，我都希望这个人真正喜欢乔布斯。而我热爱他！” http://t.cn/zOiq01w http://t.cn/zHdMxGj";

@interface TableViewController ()

@end

@implementation TableViewController {
	float height;
	int count;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	CGSize size = [self sizeWithConstrainedToSize:CGSizeMake(self.view.frame.size.width, CGFLOAT_MAX)
										 fromFont:FONT
										lineSpace:LINE_SPCAE
									   fromString:content];
	height = size.height+30;
	count = 0;
	double delayInSeconds = .5;
	dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
	dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
		count = 1000;
		[self.tableView reloadData];
	});
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGSize)sizeWithConstrainedToSize:(CGSize)size fromFont:(UIFont *)font1 lineSpace:(float)lineSpace fromString:(NSString *)str{
    CGFloat minimumLineHeight = font1.pointSize,maximumLineHeight = minimumLineHeight+10, linespace = lineSpace;
    CTFontRef font = CTFontCreateWithName((__bridge CFStringRef)font1.fontName,font1.pointSize,NULL);
    CTLineBreakMode lineBreakMode = kCTLineBreakByWordWrapping;

    //Apply paragraph settings
    CTParagraphStyleRef style = CTParagraphStyleCreate((CTParagraphStyleSetting[4]){
        {kCTParagraphStyleSpecifierMinimumLineHeight,sizeof(minimumLineHeight),&minimumLineHeight},
        {kCTParagraphStyleSpecifierMaximumLineHeight,sizeof(maximumLineHeight),&maximumLineHeight},
        {kCTParagraphStyleSpecifierLineSpacing, sizeof(linespace), &linespace},
        {kCTParagraphStyleSpecifierLineBreakMode,sizeof(CTLineBreakMode),&lineBreakMode}
    },4);
    NSDictionary* attributes = [NSDictionary dictionaryWithObjectsAndKeys:(__bridge id)font,(NSString*)kCTFontAttributeName,(__bridge id)style,(NSString*)kCTParagraphStyleAttributeName,nil];
    NSAttributedString *string = [[NSAttributedString alloc] initWithString:str attributes:attributes];
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef) string);
    CGSize result = CTFramesetterSuggestFrameSizeWithConstraints(framesetter, CFRangeMake(0,0), NULL, size, NULL);
    CFRelease(framesetter);
    CFRelease(font);
    CFRelease(style);
    string = nil;
    attributes = nil;
    return result;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell==nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
//		GCDLabel *label = [[GCDLabel alloc] initWithFrame:CGRectZero];//use gcd render
		NormalLabel *label = [[NormalLabel alloc] initWithFrame:CGRectZero];//normal label
		label.lineSpace = LINE_SPCAE;
		label.font = FONT;
		label.tag = 1;
		[cell.contentView addSubview:label];
	}
//	GCDLabel *label = (GCDLabel *)[cell viewWithTag:1];
	NormalLabel *label = (NormalLabel *)[cell viewWithTag:1];
	label.frame = CGRectMake(0, 15, cell.frame.size.width, [self tableView:tableView heightForRowAtIndexPath:indexPath]-30);
	label.text = [content stringByAppendingFormat:@"%d", arc4random()];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	return height;
}

@end
