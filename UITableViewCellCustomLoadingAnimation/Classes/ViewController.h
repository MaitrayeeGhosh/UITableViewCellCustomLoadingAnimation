//
//  ViewController.h
//  UITableViewCellCustomLoadingAnimation
//
//  Created by Maitrayee Ghosh on 02/05/15.
//  Copyright (c) 2015 Maitrayee Ghosh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    NSString *animationType;
}

@property (weak, nonatomic) IBOutlet UITableView *animatedUITableView;

- (IBAction)didTapBottomToTopAnimationBtn:(id)sender;

- (IBAction)didTapRightToLeftAnimationBtn:(id)sender;

@end

