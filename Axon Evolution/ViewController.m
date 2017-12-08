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
    
    // This segment of code creates a file that can store the high scores of the user.
    // adapted from https://stackoverflow.com/questions/1820204/objective-c-creating-a-text-file-with-a-string
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"save.txt"];
    self.userData = [NSMutableDictionary dictionaryWithContentsOfFile:filePath];
    NSLog(@"USER DATA: %@", self.userData);
    if(!self.userData){
        self.userData = [NSMutableDictionary dictionary];
        [self.userData setValue:@0 forKey:@"OpticalConundrumHighScore"];
        [self.userData setValue:@0 forKey:@"LogicalPursuitHighScore"];
        [self.userData setValue:@0 forKey:@"FlipRetentionHighScore"];
        [self.userData writeToFile:filePath atomically:YES];
        [self.brainBannerImage setImage:[UIImage imageNamed:@"levelZeroBrainImage"]];
    }
    NSLog(@"USER DATA AFTER ISSUES: %@", self.userData); // Checking that the data is being saved when i return to the home screen
    
    [self highScoreDisplay];
    [self imageSetUp];
    [self setBrainImage];
    [self looksSetup];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// Displays all the highscores for the individual games and then totals them up and displays it in the centre of the screen
-(void)highScoreDisplay{
    self.opticalConundrumLabel.text = [NSString stringWithFormat:@"HighScore: %@", [self.userData valueForKey:@"OpticalConundrumHighScore"]];
    self.logicalPursuitLabel.text = [NSString stringWithFormat:@"HighScore: %@", [self.userData valueForKey:@"LogicalPursuitHighScore"]];
    self.flipRetentionLabel.text = [NSString stringWithFormat:@"HighScore: %@", [self.userData valueForKey:@"FlipRetentionHighScore"]];
    int totalDisplayedHighScore = [[self.userData valueForKey:@"OpticalConundrumHighScore"] intValue] + [[self.userData valueForKey:@"LogicalPursuitHighScore"] intValue] + [[self.userData valueForKey:@"FlipRetentionHighScore"] intValue];
    self.highScoreLabel.text = [NSString stringWithFormat:@"Total HighScore: %d", totalDisplayedHighScore];
}
// Makes all the necessary images be able to act lik buttons and take you to the different games tey represent
-(void)imageSetUp{
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
    // Reset button to reset all your scores if you wish to start again
    [self.resetImage setUserInteractionEnabled:YES];
    UITapGestureRecognizer *resetButtonTapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(resetButtonTapped)];
    [resetButtonTapped setNumberOfTapsRequired:1];
    [self.resetImage addGestureRecognizer:resetButtonTapped];
    
    [self.settingsImage setUserInteractionEnabled:YES];
    UITapGestureRecognizer *settingsButtonTapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(settingsButtonTapped)];
    [resetButtonTapped setNumberOfTapsRequired:1];
    [self.settingsImage addGestureRecognizer:settingsButtonTapped];
    
}

// This funcion gives the necessary labels and images a more defined look with borders after i imported Quartz
-(void)looksSetup{
    self.highScoreLabel.layer.borderColor = RGB7(66, 125, 244).CGColor; // Creating a custom dark blue colour using RHGB values
    self.highScoreLabel.layer.borderWidth = 2.0;
    self.highScoreLabel.layer.cornerRadius = 8;
    
    self.opticalConundrumLabel.layer.borderColor =[UIColor blackColor].CGColor;
    self.opticalConundrumLabel.layer.borderWidth = 1.0; // Sets the thickness of gthe line that surrounds the label
    self.opticalConundrumLabel.layer.cornerRadius = 8;  // Makes the box slightly rounded at the edges
    self.opticalConundrumLabel.backgroundColor = RGB7(161, 0, 255);
    self.opticalConundrumLabel.layer.masksToBounds = YES;  // makes the fill colour fill to the bounds of the label
    
    self.flipRetentionLabel.layer.borderColor =[UIColor blackColor].CGColor;
    self.flipRetentionLabel.layer.borderWidth = 1.0;
    self.flipRetentionLabel.layer.cornerRadius = 8;
    self.flipRetentionLabel.backgroundColor = RGB7(3, 196, 132);
    self.flipRetentionLabel.layer.masksToBounds = YES;
    
    self.logicalPursuitLabel.layer.borderColor =[UIColor blackColor].CGColor;
    self.logicalPursuitLabel.layer.borderWidth = 1.0;
    self.logicalPursuitLabel.layer.cornerRadius = 8;
    self.logicalPursuitLabel.backgroundColor = RGB7(255, 131, 0);
    self.logicalPursuitLabel.layer.masksToBounds = YES;
    
}

// This function just chekcs what your highscore is and then sets the appropriate brain image at the bottom of the screen
-(void)setBrainImage{
    int totalDisplayedHighScore = [[self.userData valueForKey:@"OpticalConundrumHighScore"] intValue] + [[self.userData valueForKey:@"LogicalPursuitHighScore"] intValue] + [[self.userData valueForKey:@"FlipRetentionHighScore"] intValue];
    if (totalDisplayedHighScore > 0){
        [self.brainBannerImage setImage:[UIImage imageNamed:@"levelZeroBrainImage"]];
    }
    if (totalDisplayedHighScore > 1000){
        [self.brainBannerImage setImage:[UIImage imageNamed:@"levelOneBrainImage"]];
    }
    if (totalDisplayedHighScore > 2000){
        [self.brainBannerImage setImage:[UIImage imageNamed:@"levelTwoBrainImage"]];
    }
    if (totalDisplayedHighScore > 3000){
        [self.brainBannerImage setImage:[UIImage imageNamed:@"levelThreeBrainImage"]];
    }
    if (totalDisplayedHighScore > 4000){
        [self.brainBannerImage setImage:[UIImage imageNamed:@"levelFourBrainImage"]];
    }
}
// This function is just used to make defining custom coours easier
UIColor *RGB7(float r, float g, float b)             //adapted from https://stackoverflow.com/questions/13224206/how-do-i-create-a-uicolor-from-rgba
{
    return [UIColor colorWithRed:r/255.0f
                           green:g/255.0f
                            blue:b/255.0f
                           alpha:1.0];
}
// This function registers the user tapping the optical conundrum logo and it then takes you to the instruction screen for the game so you can read how it works
-(void)opticalConundrumTapped{
    
    // adapted from https://www.youtube.com/watch?v=QhNdvCE9jVg
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *vc = [mainStoryBoard instantiateViewControllerWithIdentifier:@"OpticalConundrumInstructionScreen"];
    [self presentViewController:vc animated:YES completion:nil];
}
// This function registers the user tapping the logical pursuit game icon and then takes you to the instruction screen for the game so you can read how it works
-(void)logicalPursuitTapped{
    
    // adapted from https://www.youtube.com/watch?v=QhNdvCE9jVg
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *vc = [mainStoryBoard instantiateViewControllerWithIdentifier:@"LogicalPursuitInstructionScreen"];
    [self presentViewController:vc animated:YES completion:nil];
}
// This function registers the user tapping the flip retention game icon and then takes you to the instruction screen for the game so you can read how it works
-(void)flipRetentionTapped{
    
    // adapted from https://www.youtube.com/watch?v=QhNdvCE9jVg
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *vc = [mainStoryBoard instantiateViewControllerWithIdentifier:@"FlipRetentionInstructionScreen"];
    [self presentViewController:vc animated:YES completion:nil];
}
// This function allows you to reset any stored data you may have
-(void)resetButtonTapped{
    NSLog(@"reset Button has been Pressed");
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"save.txt"];
    self.userData = [NSMutableDictionary dictionaryWithContentsOfFile:filePath];
    self.userData = [NSMutableDictionary dictionary];
    [self.userData setValue:@0 forKey:@"OpticalConundrumHighScore"];
    [self.userData setValue:@0 forKey:@"LogicalPursuitHighScore"];
    [self.userData setValue:@0 forKey:@"FlipRetentionHighScore"];
    [self.userData setValue:@"" forKey:@"UserName"];
    [self.userData setValue:@0 forKey:@"Age"];
    [self.userData writeToFile:filePath atomically:NO];
    [self highScoreDisplay];
    [self.brainBannerImage setImage:[UIImage imageNamed:@"levelZeroBrainImage"]];
}
// This button will take you to the settings page so ou can alter the settings of the games and how you want to play them
-(void)settingsButtonTapped{
    
    // adapted from https://www.youtube.com/watch?v=QhNdvCE9jVg 
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *vc = [mainStoryBoard instantiateViewControllerWithIdentifier:@"SettingsScreen"];
    [self presentViewController:vc animated:YES completion:nil];
}

-(void)pencilImageTapped{
    
}
@end
