//
//  ViewController.h
//  tbview
//
//  Created by KaeJer Cho on 2016/10/13.
//  Copyright © 2016年 KaeJer Cho. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tb;

@end

