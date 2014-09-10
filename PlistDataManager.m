//
//  PlistDataManager.m
//  TrackYourSadhana
//
//  Created by Olga on 6/17/14.
//  Copyright (c) 2014 Olga Jerebtsova. All rights reserved.
//

#import "PlistDataManager.h"

@implementation PlistDataManager

-(NSArray *)loadData {
    NSArray *dataArray = [[NSArray alloc] init];
    NSString *filePath = [self getDirPath];
    
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        dataArray = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
        NSLog(@"DATA MANAGER: loaded data from %@", filePath);
    }
    else{
        //create dummy test data
    }
    return dataArray;
}

-(void)saveDataFromArray:(NSMutableArray *)dataArray {
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:dataArray];
    NSString *fileDir = [self getDirPath];
    if (![[NSFileManager defaultManager] fileExistsAtPath:[self getDirPath]]) {
        NSError *error;
        
        BOOL success = [[NSFileManager defaultManager] createFileAtPath:fileDir contents:data attributes:nil];
       
        if (!success) {
            NSLog(@"DATA MANAGER: Error creating data path: %@", [error localizedDescription]);
        }else{
            NSLog(@"DATA MANAGER: Created plist: %@", fileDir);
        }
    }
    
    if (![data writeToFile:fileDir atomically:YES]) {
        NSLog(@"DATA MANAGER: 2 Could not persist data!");
    }else{
        NSLog(@"DATA MANAGER: 2 Saved!");
    }
}

-(NSString *)getDirPath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    documentsDirectory = [documentsDirectory stringByAppendingPathComponent:SadhanasPlist];
    return documentsDirectory;
}

@end