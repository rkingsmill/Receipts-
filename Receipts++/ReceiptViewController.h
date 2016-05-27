//
//  ReceiptViewController.h
//  Receipts++
//
//  Created by Rosalyn Kingsmill on 2016-05-26.
//  Copyright © 2016 Rosalyn Kingsmill. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReceiptViewController : UIViewController

@property (strong, nonatomic) NSMutableSet *selectedTags; 

@property (weak, nonatomic) IBOutlet UITextField *receiptAmountTextfield;
@property (weak, nonatomic) IBOutlet UITextField *receiptDescriptionTextfield;
@property (weak, nonatomic) IBOutlet UIButton *foodTagButton;
@property (weak, nonatomic) IBOutlet UIButton *housingTagButton;
@property (weak, nonatomic) IBOutlet UIButton *entertainmentTagButton;
@property (weak, nonatomic) IBOutlet UIButton *transportationTagButton;
@property (weak, nonatomic) IBOutlet UIDatePicker *receiptDatePicker;

- (IBAction)tagSelected:(UIButton *)sender;

@end
