//
//  HLStatusCellTableViewCell.m
//  nvshen
//
//  Created by hoolang on 15/5/28.
//  Copyright (c) 2015年 Hoolang. All rights reserved.
//


#import "HLStatusCell.h"
#import "HLStatus.h"
#import "HLPosts.h"
#import "HLUser.h"
#import "HLStatusFrame.h"
#import "HLPhoto.h"
#import "UIImageView+WebCache.h"
#import "HLStatusToolbar.h"
#import "HLStatusPhotosView.h"
#import "HLIconView.h"
#import "HLPhoto.h"

@interface HLStatusCell()
/* 原创微博 */
/** 原创微博整体 */
@property (nonatomic, weak) UIView *originalView;
/** 头像 */
@property (nonatomic, weak) HLIconView *iconView;
/** 会员图标 */
@property (nonatomic, weak) UIImageView *vipView;
/** 配图 */
@property (nonatomic, weak) HLStatusPhotosView *photosView;
/** 昵称 */
@property (nonatomic, weak) UILabel *nameLabel;
/** 时间 */
@property (nonatomic, weak) UILabel *timeLabel;
/** 来源 */
@property (nonatomic, weak) UILabel *sourceLabel;
/** 正文 */
@property (nonatomic, weak) UILabel *contentLabel;

/* 转发微博 */
/** 转发微博整体 */
@property (nonatomic, weak) UIView *retweetView;
/** 转发微博正文 + 昵称 */
@property (nonatomic, weak) UILabel *retweetContentLabel;


/** 工具条 */
@property (nonatomic, weak) HLStatusToolbar *toolbar;

@end

@implementation HLStatusCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"status";
    HLStatusCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[HLStatusCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    return cell;
}

/**
 *  cell的初始化方法，一个cell只会调用一次
 *  一般在这里添加所有可能显示的子控件，以及子控件的一次性设置
 */
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        // 点击cell的时候不要变色
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        // 设置选中时的背景为蓝色
        //        UIView *bg = [[UIView alloc] init];
        //        bg.backgroundColor = [UIColor blueColor];
        //        self.selectedBackgroundView = bg;
        
        // 这个做法不行
        //        self.selectedBackgroundView.backgroundColor = [UIColor blueColor];
        
        // 初始化原创微博
        [self setupOriginal];
        
        // 初始化转发微博
        //[self setupRetweet];
        
        // 初始化工具条
        [self setupToolbar];
    }
    return self;
}

//- (void)setFrame:(CGRect)frame
//{
//    frame.origin.y += HWStatusCellMargin;
//    [super setFrame:frame];
//}

/**
 * 初始化工具条
 */
- (void)setupToolbar
{
    HLStatusToolbar *toolbar = [HLStatusToolbar toolbar];
    [self.contentView addSubview:toolbar];
    self.toolbar = toolbar;
}



/**
 * 初始化原创微博
 */
- (void)setupOriginal
{
    /** 原创微博整体 */
    UIView *originalView = [[UIView alloc] init];
    originalView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:originalView];
    self.originalView = originalView;
    
    /** 头像 */
    HLIconView *iconView = [[HLIconView alloc] init];
    [originalView addSubview:iconView];
    self.iconView = iconView;
    
    /** 会员图标 */
    UIImageView *vipView = [[UIImageView alloc] init];
    vipView.contentMode = UIViewContentModeCenter;
    [originalView addSubview:vipView];
    self.vipView = vipView;
    
    /** 配图 */
    HLStatusPhotosView *photosView = [[HLStatusPhotosView alloc] init];
    [originalView addSubview:photosView];
    self.photosView = photosView;
    
    /** 昵称 */
    UILabel *nameLabel = [[UILabel alloc] init];
    nameLabel.font = HLStatusCellNameFont;
    [originalView addSubview:nameLabel];
    self.nameLabel = nameLabel;
    
    /** 时间 */
    UILabel *timeLabel = [[UILabel alloc] init];
    timeLabel.font = HLStatusCellTimeFont;
    timeLabel.textColor = [UIColor orangeColor];
    [originalView addSubview:timeLabel];
    self.timeLabel = timeLabel;
    
    /** 来源 */
    UILabel *sourceLabel = [[UILabel alloc] init];
    sourceLabel.font = HLStatusCellSourceFont;
    [originalView addSubview:sourceLabel];
    self.sourceLabel = sourceLabel;
    
    /** 正文 */
    UILabel *contentLabel = [[UILabel alloc] init];
    contentLabel.font = HLStatusCellContentFont;
    contentLabel.numberOfLines = 0;
    [originalView addSubview:contentLabel];
    self.contentLabel = contentLabel;
    HLLog(@"%@", self.contentLabel.text);
}

- (void)setStatusFrame:(HLStatusFrame *)statusFrame
{
    _statusFrame = statusFrame;
    
    HLStatus *status = statusFrame.status;
    HLPosts *posts = status.posts;
    HLUser *user = posts.user;
    
    HLLog(@"USER: %@", user);
    
    /** 原创微博整体 */
    self.originalView.frame = statusFrame.originalViewF;
    
    /** 头像 */
    self.iconView.frame = statusFrame.iconViewF;
    self.iconView.user = user;
    
    /** 会员图标 */
//    if (user.isVip) {
//        self.vipView.hidden = NO;
//        
//        self.vipView.frame = statusFrame.vipViewF;
//        NSString *vipName = [NSString stringWithFormat:@"common_icon_membership_level%d", user.mbrank];
//        self.vipView.image = [UIImage imageNamed:vipName];
//        
//        self.nameLabel.textColor = [UIColor orangeColor];
//    } else {
//        self.nameLabel.textColor = [UIColor blackColor];
//        self.vipView.hidden = YES;
//    }
    
    /** 配图 */
    self.photosView.frame = statusFrame.photosViewF;
   
    
    HLPhoto *poto = [[HLPhoto alloc] init];
    poto.thumbnail_pic = posts.photo;
    NSArray *arr = [[NSArray alloc]initWithObjects:poto, nil];
    
    self.photosView.photos = arr;

    self.photosView.hidden = NO;
//    if (status.pic_urls.count) {
//        self.photosView.frame = statusFrame.photosViewF;
//        self.photosView.photos = status.pic_urls;
//        self.photosView.hidden = NO;
//    } else {
//        self.photosView.hidden = YES;
//    }
    
    /** 昵称 */
    self.nameLabel.text = user.name;
    HLLog(@"self.nameLabel.text %@",self.nameLabel.text);
    self.nameLabel.frame = statusFrame.nameLabelF;
    
    /** 时间 */
    NSString *time = posts.created_at;
    HLLog(@"status.created_at %@", posts.created_at);
    CGFloat timeX = statusFrame.nameLabelF.origin.x;
    CGFloat timeY = CGRectGetMaxY(statusFrame.nameLabelF) + HLStatusCellBorderW;
    CGSize timeSize = [time sizeWithFont:HLStatusCellTimeFont];
    self.timeLabel.frame = (CGRect){{timeX, timeY}, timeSize};
    self.timeLabel.text = time;
    
    
    /** 正文 */
    self.contentLabel.text = posts.content;
    self.contentLabel.frame = statusFrame.contentLabelF;
    HLLog(@"self.contentLabel.text %@", posts.content);
    
    /** 工具条 */
    self.toolbar.frame = statusFrame.toolbarF;
    self.toolbar.status = status;
}

@end