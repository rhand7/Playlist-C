//
//  DMNPlaylistDetailTableViewController.h
//  Playlist-C
//
//  Created by handje on 5/8/17.
//  Copyright © 2017 Rob Hand. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DMNPlaylist; 

@interface DMNPlaylistDetailTableViewController : UITableViewController

@property (nonatomic, strong)DMNPlaylist *playlist;

@end
