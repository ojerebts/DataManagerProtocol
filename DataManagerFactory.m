//
//  DataManagerFactory.m
//  TrackYourSadhana
//
//  Created by Olga on 9/9/14.
//  Copyright (c) 2014 Olga Jerebtsova. All rights reserved.
//

#import "DataManagerFactory.h"
#import "PlistDataManager.h"
#import "UserDefaultsDataManager.h"

#define type Plist

@implementation DataManagerFactory

+(id<DataManagerProtocol>)getDataManager{
    switch (type) {
        case Plist:
            return [[PlistDataManager alloc] init];
            break;
        case UserDefaults:
            return [[UserDefaultsDataManager alloc] init];
            break;
        case iCloud:
            //TODO iCloud implementation
            break;
        default:
            break;
    }    
}

@end
