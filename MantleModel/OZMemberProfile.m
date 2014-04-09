//
//  OZMemberProfile.m
//  MantleModel
//
//  Created by Kiattisak Anoochitarom on 4/9/2557 BE.
//  Copyright (c) 2557 Kiattisak Anoochitarom. All rights reserved.
//

#import <Mantle/Mantle.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

#import "OZMemberProfile.h"

@implementation OZMemberProfile

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{ @"profileID": @"id",
              @"websiteURL": @"website",
              @"status": @"relationship_status",
              @"locationCoordinate": @"location"};
}

+ (NSValueTransformer *)birthdayJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSString *str) {
        return [self.dateFormatter dateFromString:str];
    } reverseBlock:^(NSDate *date) {
        return [self.dateFormatter stringFromDate:date];
    }];
}

+ (NSDateFormatter *)dateFormatter {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.timeStyle = NSDateFormatterNoStyle;
    dateFormatter.dateFormat = @"dd-MM-yyyy";
    
    return dateFormatter;
}

+ (NSValueTransformer *)websiteURLJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLURLValueTransformerName];
}

+ (NSValueTransformer *)locationCoordinateJSONTransformer {
    return [MTLValueTransformer reversibleTransformerWithForwardBlock:^(NSDictionary *coordinateDict) {
        CLLocationDegrees latitude = [coordinateDict[@"lat"] doubleValue];
        CLLocationDegrees longitude = [coordinateDict[@"lon"] doubleValue];
        
        return [NSValue valueWithMKCoordinate:CLLocationCoordinate2DMake(latitude, longitude)];
    } reverseBlock:^(NSValue *coordinateValue) {
        CLLocationCoordinate2D coordinate = [coordinateValue MKCoordinateValue];
        return @{ @"lat": @(coordinate.latitude), @"lon": @(coordinate.longitude) };
    }];
}

+ (NSValueTransformer *)statusJSONTransformer {
    return [NSValueTransformer mtl_valueMappingTransformerWithDictionary:@{
        @"single": @(OZRelationshipStatusSingle),
        @"in_relationship": @(OZRelationshipStatusInRelationship),
        @"complicated": @(OZRelationshipStatusComplicated)
    }];
}

+ (NSValueTransformer *)handsomeJSONTransformer {
    return [NSValueTransformer valueTransformerForName:MTLBooleanValueTransformerName];
}

@end
