//
//  OZViewController.m
//  MantleModel
//
//  Created by Kiattisak Anoochitarom on 4/9/2557 BE.
//  Copyright (c) 2557 Kiattisak Anoochitarom. All rights reserved.
//

#import <Mantle/Mantle.h>

#import "OZViewController.h"
#import "OZMemberProfile.h"

@interface OZViewController ()


@end

@implementation OZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSDictionary *profileJSON = [self jsonData];
    
    NSError *error = nil;
    OZMemberProfile *profile = [MTLJSONAdapter modelOfClass:[OZMemberProfile class]
                                         fromJSONDictionary:profileJSON
                                                      error:&error];
    
    if (!error) {
        NSLog(@"Create %@ Object Successful: %@", [OZMemberProfile class], profile);
    } else {
        NSLog(@"Create %@ Object Unsuccessful: %@", [OZMemberProfile class], error);
    }
}

- (NSDictionary *)jsonData {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"data"
                                                         ofType:@"json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:jsonData
                                                         options:0
                                                           error:nil];
    
    return json;
}

@end
