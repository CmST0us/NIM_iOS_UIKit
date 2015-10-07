//
//  NTESCardDataSourceProtocol.h
//  NIM
//
//  Created by chris on 15/3/5.
//  Copyright (c) 2015年 Netease. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, NIMKitCardHeaderOpeator){
    CardHeaderOpeatorNone,
    CardHeaderOpeatorAdd,
    CardHeaderOpeatorRemove,
};

typedef NS_ENUM(NSInteger, NIMKitTeamCardRowItemType) {
    TeamCardRowItemTypeCommon,
    TeamCardRowItemTypeTeamMember,
    TeamCardRowItemTypeRedButton,
    TeamCardRowItemTypeBlueButton,
    TeamCardRowItemTypeSwitch,
};


@protocol NIMKitCardHeaderData <NSObject>

- (UIImage*)imageNormal;

- (NSString*)title;

@optional
- (NSString*)imageUrl;

- (NSString*)memberId;

- (NIMKitCardHeaderOpeator)opera;

@end



@protocol NTESCardBodyData <NSObject>

- (NSString*)title;

- (NIMKitTeamCardRowItemType)type;

- (CGFloat)rowHeight;

@optional
- (NSString*)subTitle;

- (SEL)action;

- (BOOL)actionDisabled;

- (BOOL)switchOn;

@end