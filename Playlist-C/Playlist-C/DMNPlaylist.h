//
//  DMNPlaylist.h
//  Playlist-C
//
//  Created by handje on 5/8/17.
//  Copyright © 2017 Rob Hand. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DMNSong;

@interface DMNPlaylist : NSObject

- (instancetype)initWithName:(NSString *)name songs:(NSArray *)songs;

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong, readonly) NSArray *songs;

- (void)addSongsObject:(DMNSong *)song;
- (void)removeSongsObject:(DMNSong *)song; 

@end
