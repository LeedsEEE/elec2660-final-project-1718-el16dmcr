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
    NSLog(@"USER DATA: %@", self.userData);
    if(!self.userData){
        self.userData = [NSMutableDictionary dictionary];
        [self.userData setValue:@0 forKey:@"OpticalConundrumHighScore"];
        [self.userData setValue:@0 forKey:@"LogicalPursuitHighScore"];
        [self.userData setValue:@0 forKey:@"FlipRetentionHighScore"];
        [self.userData setValue:@"" forKey:@"UserName"];
        [self.userData setValue:@0 forKey:@"Age"];
        [self.userData writeToFile:filePath atomically:YES];
    }
    NSLog(@"USER DATA AFTER ISSUES: %@", self.userData);
    
    
    [self.opticalConundrumGame setUserInteractionEnabled:YES];
    UITapGestureRecognizer *opticalConundrumTapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(opticalConundrumTapped)];
    [opticalConundrumTapped setNumberOfTapsRequired:1];
    [self.opticalConundrumGame addGestureRecognizer:opticalConundrumTapped];
    
    [self.flipRetentionGame setUserInteractionEnabled:YES];
    UITapGestureRecognizer *flipRetentionTapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(flipRetentionTapped)];
    [flipRetentionTapped setNumberOfTapsRequired:1];
    [self.flipRetentionGame addGestureRecognizer:flipRetentionTapped];
    
    [self.logicalPursuitGame setUserInteractionEnabled:YES];
    UITapGestureRecognizer *logicalPursuitTapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(logicalPursuitTapped)];
    [logicalPursuitTapped setNumberOfTapsRequired:1];
    [self.logicalPursuitGame addGestureRecognizer:logicalPursuitTapped];
    
    
    self.opticalConundrumLabel.text = [NSString stringWithFormat:@"HighScore: %@", [self.userData valueForKey:@"OpticalConundrumHighScore"]];
    self.logicalPursuitLabel.text = [NSString stringWithFormat:@"HighScore: %@", [self.userData valueForKey:@"LogicalPursuitHighScore"]];
    self.flipRetentionLabel.text = [NSString stringWithFormat:@"HighScore: %@", [self.userData valueForKey:@"FlipRetentionHighScore"]];
    int totalDisplayedHighScore = [[self.userData valueForKey:@"OpticalConundrumHighScore"] intValue] + [[self.userData valueForKey:@"LogicalPursuitHighScore"] intValue] + [[self.userData valueForKey:@"FlipRetentionHighScore"] intValue];
    self.highScoreLabel.text = [NSString stringWithFormat:@"Total HighScore: %d", totalDisplayedHighScore];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)opticalConundrumTapped{
    
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *vc = [mainStoryBoard instantiateViewControllerWithIdentifier:@"OpticalConundrumInstructionScreen"];
    [self presentViewController:vc animated:YES completion:nil];
}
-(void)logicalPursuitTapped{
    
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *vc = [mainStoryBoard instantiateViewControllerWithIdentifier:@"LogicalPursuitInstructionScreen"];
    [self presentViewController:vc animated:YES completion:nil];
}
-(void)flipRetentionTapped{
    
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *vc = [mainStoryBoard instantiateViewControllerWithIdentifier:@"FlipRetentionInstructionScreen"];
    [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)settingsButtonPressed:(UIButton *)sender {
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *vc = [mainStoryBoard instantiateViewControllerWithIdentifier:@"SettingsScreen"];
    [self presentViewController:vc animated:YES completion:nil];
}
@end
