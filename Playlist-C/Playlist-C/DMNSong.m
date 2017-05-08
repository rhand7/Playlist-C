//
//  DMNSong.m
//  Playlist-C
//
//  Created by handje on 5/8/17.
//  Copyright © 2017 Rob Hand. All rights reserved.
//

#import "DMNSong.h"

@implementation DMNSong

- (instancetype)initWithTitle:(NSString *)title artist:(NSString *)artist
{
    self = [super init]; //this says, self is an NSObject
    if (self) {            //self has some kind of value
        _title = title;     //underscore bypasses setter and getter
        _artist = artist;
    }
    return self;
}

@end
