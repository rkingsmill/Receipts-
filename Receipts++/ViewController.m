//
//  ViewController.m
//  Receipts++
//
//  Created by Rosalyn Kingsmill on 2016-05-26.
//  Copyright © 2016 Rosalyn Kingsmill. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"
#import "ReceiptViewController.h"
#import "Tag.h"
#import "Receipt.h"
#import "AppDelegate.h"

@interface ViewController ()<UITableViewDataSource>

@property (strong, nonatomic) NSManagedObjectContext *moc;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) NSArray *tags;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.addReceiptButton.backgroundColor = [UIColor lightGrayColor];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    self.moc = appDelegate.managedObjectContext;
    
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Tag"
                                              inManagedObjectContext:self.moc];
    [fetchRequest setEntity:entity];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name"
                                                                   ascending:YES];
    NSArray *sortDescriptors = @[sortDescriptor];
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    Tag *food = [NSEntityDescription insertNewObjectForEntityForName:@"Tag" inManagedObjectContext:self.moc];
    Tag *entertainment = [NSEntityDescription insertNewObjectForEntityForName:@"Tag" inManagedObjectContext:self.moc];
    Tag *transportation = [NSEntityDescription insertNewObjectForEntityForName:@"Tag" inManagedObjectContext:self.moc];
    Tag *housing = [NSEntityDescription insertNewObjectForEntityForName:@"Tag" inManagedObjectContext:self.moc];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.tags.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  
    return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    //cell.cellEventLabel.text =
 
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"addReceipt"]) {
        ReceiptViewController *controller = (ReceiptViewController *)[segue destinationViewController];
        
    }
}

@end
