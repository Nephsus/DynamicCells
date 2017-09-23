//
//  DynamicCells.m
//  DynamicCells
//
//  Created by itecban itecban on 18/9/17.
//  Copyright © 2017 itecban itecban. All rights reserved.
//

#import "DynamicCells.h"

@interface DynamicCells ()


@property(atomic)  int count;

@end

@implementation DynamicCells

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    CGFloat x = 50;
    CGFloat y = 50;
    CGFloat width = self.view.frame.size.width -100 ;
    CGFloat height = 500;
    CGRect tableFrame = CGRectMake(x, y, width, height);
    
    UITableView *tableView = [[UITableView alloc]initWithFrame:tableFrame style:UITableViewStyleGrouped];
    
tableView.rowHeight = 70;
   
    tableView.sectionFooterHeight = 0;
    tableView.sectionHeaderHeight = 0;
    tableView.scrollEnabled = NO;
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
    
    
   // [tableView registerNib:[UINib nibWithNibName:@"DynamicCells" bundle:nil] forCellWithReuseIdentifier:@"myCell"];
    self.count = 1;
    //tableView.tableHeaderView.hidden = YES;
    [[self view] addSubview:tableView];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


-(CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.count;
}

-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
  return @"";
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return nil;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = nil;
    
    if(_count == 1 ){
    
           cell = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
        cell.layer.shadowOffset = CGSizeMake(1, 1);
        cell.layer.shadowColor = [[UIColor blackColor] CGColor];
        cell.layer.shadowRadius = 2;
        cell.layer.shadowOpacity =.10;
        
        UIBezierPath * p =  [UIBezierPath bezierPathWithRect:cell.layer.bounds];
        cell.layer.shadowPath = p.CGPath;
    }else
        cell = [tableView dequeueReusableCellWithIdentifier:@"MandatoryCell" forIndexPath:indexPath];

    
   
    
    
    // UIBezierPath(rect: cell.postCard.layer.bounds).CGPath
    return cell;
    
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    NSLog(@"indexPath: %ld", (long)indexPath.row );
    if(indexPath.row == 0 ){
        return 70;
    
      }else{
          return 280;
      
      }


}


- (void)tableView:(UITableView*)tableView didSelectRowAtIndexPath:(NSIndexPath*)indexPath {

    _count++;

    NSArray<NSIndexPath *> * array = @[[NSIndexPath indexPathForRow:1 inSection:0]];
    
   [tableView insertRowsAtIndexPaths:array withRowAnimation:UITableViewRowAnimationFade];
   // tableView.insertRowsAtIndexPaths([NSIndexPath indexPathForRow:_count inSection:0], withRowAnimation: UITableViewRowAnimation.Fade)




}



@end
