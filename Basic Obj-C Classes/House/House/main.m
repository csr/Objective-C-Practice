//
//  main.m
//  House
//
//  Created by Cesare de Cal on 3/2/19.
//  Copyright © 2019 Cesare Gianfilippo Astianatte de Cal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "House.h"
#import "Book.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableString *addressString = [[NSMutableString alloc] initWithString: @"555 Park Ave."];
        
        House *myHouse = [[House alloc] initWithAddress:addressString];
        NSLog(@"%@", myHouse.address);
        
        NSDate *myBirthday = [[NSDate alloc] initWithTimeIntervalSinceNow:300];
        
        Person *myself = [[Person alloc] initWithName:@"Cesare" birthday: myBirthday];
        
        Book *myBook = [[Book alloc] initWithTitle:@"La pietra filosofale" withAuthor:myself yearOfPublication:2002];
        NSLog(@"Book name: %@", myBook.title);
    }
    return 0;
}
