//
//  ViewController.m
//  RanbowView
//
//  Created by Richard Martin on 2016-01-18.
//  Copyright © 2016 Richard Martin. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property NSMutableArray *colors;

@property (weak, nonatomic) IBOutlet UITableView *addTableItems;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.colors = [NSMutableArray arrayWithObjects:
                   [UIColor redColor],
                   [UIColor blueColor],
                   [UIColor yellowColor],
                   [UIColor greenColor],
                   [UIColor orangeColor],
                   nil];
    
    
}

- (IBAction)createRandColor:(UIBarButtonItem *)sender {
    
    CGFloat red = (float)rand() / RAND_MAX;
    CGFloat green = (float)rand() / RAND_MAX;
    CGFloat blue = (float)rand() / RAND_MAX;
    
    UIColor *randomColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    
    [self.colors addObject:randomColor];
    
    [self.addTableItems reloadData];
    
    
}


-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.colors.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    
    cell.textLabel.text = [NSString stringWithFormat:@"row %li", indexPath.row];
    
//    if (indexPath.row == 0) {
//        cell.backgroundColor = [UIColor redColor];
//    }
//    else if (indexPath.row == 1) {
//        cell.backgroundColor = [UIColor greenColor];
//    }
//    else if (indexPath.row == 2) {
//        cell.backgroundColor = [UIColor blueColor];
//    }
    
    cell.backgroundColor = [self.colors objectAtIndex:indexPath.row];
    
    
    return cell;


}


@end
