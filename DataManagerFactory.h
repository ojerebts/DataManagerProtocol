//
//  DataManagerFactory.h
//  TrackYourSadhana
//
//  Created by Olga on 9/9/14.
//  Copyright (c) 2014 Olga Jerebtsova. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum types {
    UserDefaults,
    Plist,
    iCloud
} DataManagerType;

@protocol DataManagerProtocol <NSObject>

-(NSArray *)loadData;
-(void)saveDataFromArray:(NSMutableArray *)dataArray;

@end

@interface DataManagerFactory : NSObject

+(id<DataManagerProtocol>)getDataManager;

@end
