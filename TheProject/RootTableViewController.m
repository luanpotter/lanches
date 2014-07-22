//
//  RootTableViewController.m
//  TheProject
//
//  Created by Mac Mini on 23/07/14.
//  Copyright (c) 2014 Dextra. All rights reserved.
//

#import "RootTableViewController.h"
#import <AFNetworking.h>
#import "LancheTableViewCell.h"
#import "DetailLancheViewController.h"

@interface RootTableViewController ()

@end

@implementation RootTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        lanches = @[];
    }
    return self;
}


- (void)viewDidLoad
{

    
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"LancheTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    NSLog(@"=> RootTableViewController");
    NSURL *url = [NSURL URLWithString:@"http://162.222.181.128/s/lanches"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFHTTPRequestOperationManager *client = [[AFHTTPRequestOperationManager alloc] init];
    AFHTTPRequestOperation* operation = [client HTTPRequestOperationWithRequest: request
                                                                        success:^(AFHTTPRequestOperation *operation, id responseObject)
                                         {
                                             lanches = responseObject;
                                             NSLog(@"%d",lanches.count);
                                             [self.tableView reloadData];
                                         } failure:nil];
    
    //AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        //NSLog(@"App.net Global Stream: %@", JSON);
    //} failure:nil];
    [operation start];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (lanches != nil) {
        return lanches.count;
    }
    
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LancheTableViewCell *cell = (LancheTableViewCell *) [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    [cell lanche:lanches[[indexPath row]]];
    
     //[cell.name setText: [lanches[[indexPath row]] valueForKey:@"nome"]];
    //UIImage *img = [UIImage imageWithContentsOfFile: [lanches[[indexPath row]] valueForKey:@"imagem"] ];
    //[cell.image setImage: img];
    //[cell.price setText: [lanches[[indexPath row]] valueForKey:@"preco"]];
    // Configure the cell...
    
    return cell;
}

- (float) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DetailLancheViewController *detailView = [[DetailLancheViewController alloc] init];
    [self.navigationController pushViewController:detailView animated:YES];
    
    
    
    NSLog(@"PAssou por aqui");
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
