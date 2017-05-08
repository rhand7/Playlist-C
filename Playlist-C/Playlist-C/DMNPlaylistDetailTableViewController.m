//
//  DMNPlaylistDetailTableViewController.m
//  Playlist-C
//
//  Created by handje on 5/8/17.
//  Copyright © 2017 Rob Hand. All rights reserved.
//

#import "DMNPlaylistDetailTableViewController.h"
#import "DMNPlaylistController.h"
#import "DMNPlaylist.h" 
#import "DMNSong.h"

@interface DMNPlaylistDetailTableViewController ()

@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *artistTextField;

@end

@implementation DMNPlaylistDetailTableViewController

- (IBAction)addSongButtonTapped:(id)sender {
    [[DMNPlaylistController sharedInstance] addSongWithTitle:self.titleTextField.text andArtist:self.artistTextField.text toPlaylist:self.playlist];
    self.titleTextField.text = @"";
    self.artistTextField.text = @"";
    [self.titleTextField resignFirstResponder];
    [self.artistTextField resignFirstResponder]; 
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.playlist.songs count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"songCell" forIndexPath:indexPath];
    
    DMNSong *song = self.playlist.songs[indexPath.row];
    cell.textLabel.text = song.title;
    cell.detailTextLabel.text = song.artist;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        DMNSong *song = self.playlist.songs[indexPath.row];
        [[DMNPlaylistController sharedInstance] deleteSong:song fromPlaylist:self.playlist];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

- (void)setPlaylist:(DMNPlaylist *)playlist
{  //whenever this playlist changes value, update the tableview
    if (playlist != _playlist) {
        _playlist = playlist;
        [self.tableView reloadData];
    }
}

@end
