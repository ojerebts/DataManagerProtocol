//
//  ArchiveDataManager.m
//  TrackYourSadhana
//
//  Created by Olga on 6/17/14.
//  Copyright (c) 2014 Olga Jerebtsova. All rights reserved.
//

#import "UserDefaultsDataManager.h"

#define SadhanasArrayKey @"TYS_sadhanasArray"

@implementation UserDefaultsDataManager

-(NSArray *)loadData {
    NSArray *array = [NSArray new];
    if ([[NSUserDefaults standardUserDefaults] objectForKey:SadhanasArrayKey]) {
        array = [NSKeyedUnarchiver unarchiveObjectWithData:[[NSUserDefaults standardUserDefaults] objectForKey:SadhanasArrayKey]];
    }
    return array;
}

-(void)saveDataFromArray:(NSMutableArray *)dataArray{
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:dataArray];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:SadhanasArrayKey];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
