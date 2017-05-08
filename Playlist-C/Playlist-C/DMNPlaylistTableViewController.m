//
//  DMNPlaylistTableViewController.m
//  Playlist-C
//
//  Created by handje on 5/8/17.
//  Copyright © 2017 Rob Hand. All rights reserved.
//

#import "DMNPlaylistTableViewController.h"
#import "DMNPlaylistDetailTableViewController.h"
#import "DMNPlaylistController.h" 
#import "DMNPlaylist.h"


@interface DMNPlaylistTableViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@end



@implementation DMNPlaylistTableViewController

- (IBAction)addButtonTapped:(id)sender {
    [[DMNPlaylistController sharedInstance] createPlaylistWithTitle:self.nameTextField.text];
    self.nameTextField.text = @"";
    [self.nameTextField resignFirstResponder]; 
    [self.tableView reloadData];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.tableView reloadData]; 
}

#pragma mark - TableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [DMNPlaylistController sharedInstance].playlists.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"playlistCell" forIndexPath:indexPath];
    
    DMNPlaylist *playlist = [DMNPlaylistController sharedInstance].playlists[indexPath.row];
    cell.textLabel.text = playlist.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu songs", [playlist.songs count]];
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        DMNPlaylist *playlist = [DMNPlaylistController sharedInstance].playlists[indexPath.row];
        [[DMNPlaylistController sharedInstance] deletePlaylist:playlist];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    //safer to call the method isEqualToString on the NSString object rather than using "=="
    if ([segue.identifier isEqualToString:@"toDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        DMNPlaylist *playlist = [DMNPlaylistController sharedInstance].playlists[indexPath.row];
        DMNPlaylistDetailTableViewController *vc = (DMNPlaylistDetailTableViewController *)segue.destinationViewController;
        vc.playlist = playlist; 
    }
}


@end
