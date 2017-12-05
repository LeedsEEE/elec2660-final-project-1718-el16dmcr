//
//  ViewController.m
//  Axon Evolution
//
//  Created by David Russell [el16dmcr] on 14/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "ViewController.h"
#import "OpticalConundrumData.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.hidesBackButton = YES;
    
        self.opticalConundrumData = [[OpticalConundrumData alloc] init];
        // load score
    
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"save.txt"];
    _userData = [NSMutableDictionary dictionaryWithContentsOfFile:filePath];
    NSLog(@"USER DATA: %@", _userData);
    if(!_userData){
        _userData = [NSMutableDictionary dictionary];
//        _userData[@"OpticalConundrumHighScore"] = @0;
        [_userData setValue:@0 forKey:@"OpticalConundrumHighScore"];
        [_userData setValue:@0 forKey:@"LogicalPursuitHighScore"];
        [_userData setValue:@0 forKey:@"FlipRetentionHighScore"];
        [_userData setValue:@"" forKey:@"UserName"];
        [_userData setValue:@0 forKey:@"Age"];
        [_userData writeToFile:filePath atomically:YES];
    }
    NSLog(@"USER DATA AFTER ISSUES: %@", _userData);
    
    
    [self.opticalConundrumGame setUserInteractionEnabled:YES];
    UITapGestureRecognizer *opticalConundrumTapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(opticalConundrumTapped)];
    [opticalConundrumTapped setNumberOfTapsRequired:1];
    [self.opticalConundrumGame addGestureRecognizer:opticalConundrumTapped];
    
    [self.flipRetentionGame setUserInteractionEnabled:YES];
    UITapGestureRecognizer *flipRetentionTapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(flipRetentionTapped)];
    [opticalConundrumTapped setNumberOfTapsRequired:1];
    [self.opticalConundrumGame addGestureRecognizer:opticalConundrumTapped];
    
    
    
    self.highScoreLabel.text = [NSString stringWithFormat:@"HighScore : %@", [_userData valueForKey:@"OpticalConundrumHighScore"]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)opticalConundrumTapped{
    
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *vc = [mainStoryBoard instantiateViewControllerWithIdentifier:@"OpticalConundrumInstructionScreen"];
    vc.opticalConundrumData = self.opticalConundrumData;
    [self presentViewController:vc animated:YES completion:nil];
}
-(void)logicalPursuitTapped{
    
}
-(void)flipRetentionTapped{
    
}

@end
