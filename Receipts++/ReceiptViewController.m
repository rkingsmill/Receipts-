//
//  ReceiptViewController.m
//  Receipts++
//
//  Created by Rosalyn Kingsmill on 2016-05-26.
//  Copyright © 2016 Rosalyn Kingsmill. All rights reserved.
//

#import "ReceiptViewController.h"
#import "Receipt.h"
#import "Tag.h"
#import "AppDelegate.h"

@interface ReceiptViewController ()

@property (strong, nonatomic) NSManagedObjectContext *moc;

@end

@implementation ReceiptViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.selectedTags = [[NSMutableSet alloc] init];
    
    //reference
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    self.moc = appDelegate.managedObjectContext;
}

- (IBAction)tagSelected:(UIButton *)sender {
    if ([self.selectedTags containsObject:sender.titleLabel.text]) {
        [self.selectedTags removeObject:sender.titleLabel.text];
    } else {
        [self.selectedTags addObject:sender.titleLabel.text];
    }
    
    NSLog(@"%@", self.selectedTags);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveReceipt:(id)sender {

    Receipt *receipt = [NSEntityDescription insertNewObjectForEntityForName:@"Receipt" inManagedObjectContext:self.moc];
    
    NSString *amount = self.receiptAmountTextfield.text;
    receipt.amount =  [NSDecimalNumber decimalNumberWithString:amount];
    receipt.date = self.receiptDatePicker.date;
    receipt.event = self.receiptDescriptionTextfield.text;
    
    // Loop over set of selectedTags which are strings
    NSMutableSet *selectedTags = [[NSMutableSet alloc] init];
    for (NSString *selectedTag in self.selectedTags) {
        // Create real tags out of the strings
        Tag *tag = [NSEntityDescription insertNewObjectForEntityForName:@"Tag" inManagedObjectContext:self.moc];
        tag.name = selectedTag;
        [selectedTags addObject:tag];
    }
    
    // then add tags to receipt
    [receipt addTags:selectedTags];
    
    [self.moc save:nil];
    
    [self.navigationController popViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
