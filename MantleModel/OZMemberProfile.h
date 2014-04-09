//
//  OZMemberProfile.h
//  MantleModel
//
//  Created by Kiattisak Anoochitarom on 4/9/2557 BE.
//  Copyright (c) 2557 Kiattisak Anoochitarom. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

#import "MTLModel.h"

typedef NS_ENUM(NSInteger, OZRelationshipStatus) {
    OZRelationshipStatusSingle,
    OZRelationshipStatusInRelationship,
    OZRelationshipStatusComplicated
};

@interface OZMemberProfile : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSNumber *profileID;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSDate *birthday;
@property (nonatomic, strong) NSURL *websiteURL;
@property (nonatomic) CLLocationCoordinate2D locationCoordinate;
@property (nonatomic) OZRelationshipStatus status;
@property (nonatomic, getter = isHandsome) BOOL handsome;

@end
