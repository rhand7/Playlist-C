//
//  DMNPlaylist.m
//  Playlist-C
//
//  Created by handje on 5/8/17.
//  Copyright © 2017 Rob Hand. All rights reserved.
//

#import "DMNPlaylist.h"

@interface DMNPlaylist ()

//private property - keeps track of songs that are added/removed from array
@property (nonatomic, strong) NSMutableArray *internalSongs;

@end

@implementation DMNPlaylist

- (instancetype)initWithName:(NSString *)name songs:(NSArray *)songs
{
    self = [super init];
    if (self) {
        _name = name;
        _internalSongs = [songs mutableCopy];
    }
    return self;
}

#pragma mark - Properties 

//similar to computed property
- (NSArray *)songs { return self.internalSongs; }

- (void)addSongsObject:(DMNSong *)song
{
    [self.internalSongs addObject:song];
}

- (void)removeSongsObject:(DMNSong *)song 
{
    [self.internalSongs removeObject:song];
}

@end
