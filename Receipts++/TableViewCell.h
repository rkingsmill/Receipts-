//
//  TableViewCell.h
//  Receipts++
//
//  Created by Rosalyn Kingsmill on 2016-05-26.
//  Copyright © 2016 Rosalyn Kingsmill. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cellEventLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *cellAmountLabel;

@end
