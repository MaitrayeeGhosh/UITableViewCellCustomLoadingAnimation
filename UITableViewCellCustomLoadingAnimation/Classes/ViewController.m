//
//  ViewController.m
//  UITableViewCellCustomLoadingAnimation
//
//  Created by Maitrayee Ghosh on 02/05/15.
//  Copyright (c) 2015 Maitrayee Ghosh. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 120;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID=@"cellId";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell==Nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.textLabel.text=[NSString stringWithFormat:@"This is cell no. %ld",(long)indexPath.row];
    cell.textLabel.font = [UIFont fontWithName:@"TrebuchetMS-Bold" size:22];
    cell.textLabel.textColor=[UIColor colorWithRed:0.2 green:0.3490 blue:0.6431 alpha:1.0];
    cell.imageView.image=[UIImage imageNamed:@"Bird.jpg"];
    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    /*************  For bottom to top animation *****************/
    
    if ([animationType isEqualToString:@"BottomToTop"]) {
        UIView *cellContentView = [cell contentView];
        CGFloat rotationAngleDegrees = -30;
        CGFloat rotationAngleRadians = rotationAngleDegrees * (M_PI/180);
        CGPoint offsetPositioning = CGPointMake(0, cell.contentView.frame.size.height*4);
        CATransform3D transform = CATransform3DIdentity;
        transform = CATransform3DRotate(transform, rotationAngleRadians, -50.0, 0.0, 1.0);
        transform = CATransform3DTranslate(transform, offsetPositioning.x, offsetPositioning.y, -50.0);
        cellContentView.layer.transform = transform;
        cellContentView.layer.opacity = 0.8;
        
        [UIView animateWithDuration:0.65 delay:00 usingSpringWithDamping:0.85 initialSpringVelocity:0.8 options:0 animations:^{
            cellContentView.layer.transform = CATransform3DIdentity;
            cellContentView.layer.opacity = 1;
        } completion:^(BOOL finished) {}];
    }
    /************* For right to left animation *****************/
    
    else  if ([animationType isEqualToString:@"RightToLeft"])
    {
        UIView *cellContentView  = [cell contentView];
        CGFloat rotationAngleDegrees = -30;
        CGFloat rotationAngleRadians = rotationAngleDegrees * (M_PI/180);
        CGPoint offsetPositioning = CGPointMake(500, -20.0);
        CATransform3D transform = CATransform3DIdentity;
        transform = CATransform3DRotate(transform, rotationAngleRadians, -50.0, 0.0, 1.0);
        transform = CATransform3DTranslate(transform, offsetPositioning.x, offsetPositioning.y, -50.0);
        cellContentView.layer.transform = transform;
        cellContentView.layer.opacity = 0.8;
        
        [UIView animateWithDuration:.65 delay:0.0 usingSpringWithDamping:0.85 initialSpringVelocity:.8 options:0 animations:^{
            cellContentView.layer.transform = CATransform3DIdentity;
            cellContentView.layer.opacity = 1;
        } completion:^(BOOL finished) {}];
    }
}

#pragma mark - IBAction

- (IBAction)didTapBottomToTopAnimationBtn:(id)sender {
    animationType=@"BottomToTop";
}

- (IBAction)didTapRightToLeftAnimationBtn:(id)sender {
       animationType=@"RightToLeft";
}

@end
