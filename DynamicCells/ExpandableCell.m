//
//  ExpandableCell.m
//  DynamicCells
//
//  Created by David Cava Jimenez on 24/9/17.
//  Copyright © 2017 itecban itecban. All rights reserved.
//

#import "ExpandableCell.h"
#import "TableViewCell.h"

@interface ExpandableCell ()
@property(atomic)  int count;
@property(atomic)  BOOL expandableCell;
@property(atomic)  BOOL upHeight;
@property(strong,nonatomic) UITableView *tableView;
@end

@implementation ExpandableCell

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _expandableCell = NO;
    _upHeight=NO;
    CGFloat x = 20;
    CGFloat y = 50;
    CGFloat width = self.view.frame.size.width -40 ;
    CGFloat height = 1000;
    CGRect tableFrame = CGRectMake(x, y, width, height);
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:tableFrame style:UITableViewStyleGrouped];
    
    tableView.rowHeight = 70;
    
    tableView.sectionFooterHeight = 0;
    tableView.sectionHeaderHeight = 0;
    tableView.scrollEnabled = YES;
    tableView.showsVerticalScrollIndicator = NO;
    tableView.userInteractionEnabled = YES;
    tableView.bounces = YES;
    tableView.dataSource = self;
    tableView.separatorStyle= UITableViewCellSeparatorStyleNone;
    // tableView.tableFooterView = [[UIView alloc] init];
    //tableView.tableHeaderView = [[UIView alloc] init];
    
    // tableView.tableHeaderView = nil;
    tableView.delegate = self;
    tableView.backgroundColor= [UIColor colorWithRed:0.98 green:0.98 blue:0.98 alpha:1.0];
    [tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil]  forCellReuseIdentifier:@"myCell"];
    
    [tableView registerNib:[UINib nibWithNibName:@"ObligatoryCell" bundle:nil]  forCellReuseIdentifier:@"MandatoryCell"];
    [tableView setBackgroundColor:[UIColor colorWithRed:0.93 green:0.93 blue:0.94 alpha:1.0]];
    
    // [tableView registerNib:[UINib nibWithNibName:@"DynamicCells" bundle:nil] forCellWithReuseIdentifier:@"myCell"];
    self.count = 1;
    //tableView.tableHeaderView.hidden = YES;
    [[self view] addSubview:tableView];
    
    self.tableView = tableView;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"";
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return nil;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TableViewCell *cell = nil;
  
        
        cell =(TableViewCell *) [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
       /* cell.layer.shadowOffset = CGSizeMake(1, 1);
        cell.layer.shadowColor = [[UIColor blackColor] CGColor];
        cell.layer.shadowRadius = 2;
        cell.layer.shadowOpacity =.10;
        
        UIBezierPath * p =  [UIBezierPath bezierPathWithRect:cell.layer.bounds];
        cell.layer.shadowPath = p.CGPath;*/
    cell.delegate = self;
    
    UIView *selectionView = [UIView new];
    selectionView.backgroundColor = [UIColor whiteColor];
     [cell setSelectedBackgroundView:selectionView];
    
    
         //UIBezierPath(rect: cell.postCard.layer.bounds).CGPath
    return cell;
    
    
    
}




- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSLog(@"indexPath: %ld", (long)indexPath.row );
    
    
    
    if(!_upHeight){
    if(_expandableCell ){
        _expandableCell = NO;
        return 350;
        
    }else{
           _expandableCell = YES;
        return 70;
        
    }
    }else{
        _upHeight = NO;
       return 700;
    
    }
    
}


- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath {
    
    _count++;
    
  //  NSArray<NSIndexPath *> * array = @[[NSIndexPath indexPathForRow:1 inSection:0]];
    
  //  [tableView insertRowsAtIndexPaths:array withRowAnimation:UITableViewRowAnimationFade];
    // tableView.insertRowsAtIndexPaths([NSIndexPath indexPathForRow:_count inSection:0], withRowAnimation: UITableViewRowAnimation.Fade)
    
    NSLog(@"celda seleccionada");

   
    [tableView beginUpdates];
    [tableView endUpdates];
    
    if  (_expandableCell )  {
        
        TableViewCell *cell = (TableViewCell *) [tableView cellForRowAtIndexPath:indexPath];
        
        
        cell.normalView.alpha = 0.0f;
        cell.normalView.hidden = NO;
        cell.expandableView.alpha = 1.0f;
        cell.expandableView.hidden= YES;
        [UIView animateWithDuration:0.4 animations:^{
            cell.normalView.alpha = 1.0f;
            cell.expandableView.alpha = 0.0f;
        }];
        
    } else {
     
        
        TableViewCell *cell = (TableViewCell *) [tableView cellForRowAtIndexPath:indexPath];
        
        
        cell.expandableView.alpha = 0.0f;
        cell.expandableView.hidden = NO;
        cell.normalView.alpha = 1.0f;
        cell.normalView.hidden= YES;
        [UIView animateWithDuration:0.4 animations:^{
            cell.expandableView.alpha = 1.0f;
            cell.normalView.alpha = 0.0f;
        }];
        
    }
  
    
    
}


-(void) upHeightCell:(TableViewCell *) cell{
    _upHeight = YES;

    [self.tableView beginUpdates];
    [self.tableView endUpdates];
    
    
    cell.loanCell.alpha = 0.0f;
    cell.loanCell.hidden= NO;
    [UIView animateWithDuration:1 animations:^{
        cell.loanCell.alpha = 1.0f;
       
    }];
    
    
    

    
    


}

@end
