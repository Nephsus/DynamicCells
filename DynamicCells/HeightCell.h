//
//  HeightCell.h
//  DynamicCells
//
//  Created by David Cava Jimenez on 24/9/17.
//  Copyright © 2017 itecban itecban. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TableViewCell;

@protocol HeightCell <NSObject>


@required
- (void)upHeightCell:( TableViewCell *) cell;

@end
