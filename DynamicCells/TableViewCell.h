//
//  TableViewCell.h
//  DynamicCells
//
//  Created by itecban itecban on 18/9/17.
//  Copyright © 2017 itecban itecban. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *arrow;

@property (weak, nonatomic) IBOutlet UILabel *title;
@end
