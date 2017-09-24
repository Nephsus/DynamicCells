//
//  TableViewCell.h
//  DynamicCells
//
//  Created by itecban itecban on 18/9/17.
//  Copyright © 2017 itecban itecban. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HeightCell.h"

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *arrow;

@property (weak, nonatomic) IBOutlet UILabel *title;

@property (nonatomic, weak) id<HeightCell> delegate;


- (IBAction)btnUnderstand:(id)sender;


@property (weak, nonatomic) IBOutlet UIView *expandableView;

@property (weak, nonatomic) IBOutlet UIView *loanCell;

@property (weak, nonatomic) IBOutlet UIView *normalView;

@end
