//
//  SqliteSampleViewController.m
//  SqliteSample
//
//  Created by Amatsu on 11/09/05.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "SqliteSampleViewController.h"
#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"

@implementation SqliteSampleViewController

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)sayHello:(id)sender {
    
    [lblState setText:@"Test"];
    
    // ファイルがなければプロジェクトフォルダからiPhone Documentフォルダにコピー
    BOOL success;
    NSError *error;	
    NSFileManager *fm = [NSFileManager defaultManager];
    NSArray  *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *writableDBPath = [documentsDirectory stringByAppendingPathComponent:@"sample.db"];
    success = [fm fileExistsAtPath:writableDBPath];
    if(!success){
        NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"sample.db"];
        success = [fm copyItemAtPath:defaultDBPath toPath:writableDBPath error:&error];
        if(!success){
            NSLog([error localizedDescription]);
        }
    }
    
    NSLog(writableDBPath);
    
    // DBに接続
    FMDatabase* db = [FMDatabase databaseWithPath:writableDBPath];
    
    if ([db open]) {
        [db setShouldCacheStatements:YES];
		
        // INSERT
//        [db beginTransaction];
//        int i = 0;
//        while (i++ < 20) {
//            [db executeUpdate:@"INSERT INTO TEST (name) values (?)" , [NSString stringWithFormat:@"number %d", i]];			
//            if ([db hadError]) {
//                NSLog(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
//            }
//        }
//        [db commit];
		
        // SELECT
        FMResultSet *rs = [db executeQuery:@"SELECT * FROM TEST"];
        while ([rs next]) {
            NSLog(@"%d %@", [rs intForColumn:@"id"], [rs stringForColumn:@"name"]);
        }
        [rs close];  
        [db close];
    }else{
        NSLog(@"Could not open db.");
    }
    
    
}

@end
