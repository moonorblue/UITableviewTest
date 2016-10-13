//
//  ViewController.m
//  tbview
//
//  Created by KaeJer Cho on 2016/10/13.
//  Copyright © 2016年 KaeJer Cho. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    NSMutableArray *array;
    NSMutableArray *hide;
    NSInteger currentHide;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    array = [[NSMutableArray alloc]init];
    hide = [[NSMutableArray alloc]init];
    for (int x =0; x<20; x++) {
        NSString* str = [NSString stringWithFormat:@"%d",x];
        [array addObject:str];
        [hide addObject:@NO];
    }
    _tb.dataSource = self;
    _tb.delegate = self;

    [_tb reloadData];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 20;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (![[hide objectAtIndex:section]  isEqual: @YES]) {
        return 5;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    cell = [_tb dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    NSInteger section = indexPath.section;
    cell.textLabel.text = [array objectAtIndex:section];
    return cell;
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *header = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20)];
    UITapGestureRecognizer *singleTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(gestureHandler:)];
    singleTapRecognizer.numberOfTouchesRequired = 1;
    singleTapRecognizer.numberOfTapsRequired = 1;
    [header addGestureRecognizer:singleTapRecognizer];
    UIView *tagview = [singleTapRecognizer view];
    tagview.tag = section;
    header.backgroundColor = [UIColor redColor];
    return header;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *footer =[[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20)];
    footer.backgroundColor = [UIColor blueColor];
    return footer;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 100;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 80;
}
-(void)gestureHandler:(UIGestureRecognizer *)gestureRecognizer {
    NSInteger section = gestureRecognizer.view.tag;
    if ([[hide objectAtIndex:section]  isEqual: @YES]) {
        [hide replaceObjectAtIndex:section withObject:@NO];
    }
    else {
        [hide replaceObjectAtIndex:section withObject:@YES];
    }
    
    [_tb reloadSections:[NSIndexSet indexSetWithIndex:section] withRowAnimation:UITableViewRowAnimationAutomatic];
    
}

@end
