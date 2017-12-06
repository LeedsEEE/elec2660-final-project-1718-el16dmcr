//
//  LogicalPursuitController.m
//  Axon Evolution
//
//  Created by David Russell [el16dmcr] on 28/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "LogicalPursuitController.h"


@interface LogicalPursuitController ()

@end

@implementation LogicalPursuitController

-(void)viewDidLoad {
    [super viewDidLoad];
    self.logicalPursuitData = [[LogicalPursuit alloc] init];  // need this so it knows what ive set variables as in other classes
    
    
    self.navigationItem.hidesBackButton = YES;
    [self.view setUserInteractionEnabled:NO];
    [self initShapes];
    [self.logicalPursuitData setStartLives];
    
    NSLog(@"counter is %d", self.logicalPursuitData.roundCounter);
    NSLog(@"lives are %d", self.logicalPursuitData.currentLives);
    self.scoreLabel.text = [NSString stringWithFormat:@"Score : %d", self.logicalPursuitData.currentPoints];
    self.livesRemainingLabel.text = [NSString stringWithFormat:@"Lives Remaining: %d", self.logicalPursuitData.currentLives];
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(generatePattern) userInfo:nil repeats:NO];

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
-(void)initShapes{
    [self.redCircleImage setImage:[UIImage imageNamed:@"redCircleOffImage"]]; //Needs to be set
    [self.redCircleImage setUserInteractionEnabled:YES];
    [self.pinkInvertedSquareImage setImage:[UIImage imageNamed:@"pinkInvertedSquareOffImage"]]; //Needs to be set
    [self.pinkInvertedSquareImage setUserInteractionEnabled:YES];
    [self.blueRhombusImage setImage:[UIImage imageNamed:@"blueRhombusOffImage"]]; //Needs to be set
    [self.blueRhombusImage setUserInteractionEnabled:YES];
    [self.cyanSquareImage setImage:[UIImage imageNamed:@"cyanSquareOffImage"]]; //Needs to be set
    [self.cyanSquareImage setUserInteractionEnabled:YES];
    [self.purpleDiamondImage setImage:[UIImage imageNamed:@"purpleDiamondOffImage"]]; //Needs to be set
    [self.purpleDiamondImage setUserInteractionEnabled:YES];
    [self.greenTriangleImage setImage:[UIImage imageNamed:@"greenTriangleOffImage"]]; //Needs to be set
    [self.greenTriangleImage setUserInteractionEnabled:YES];
    
    UITapGestureRecognizer *redCircleTapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(circleClicked)];
    [redCircleTapped setNumberOfTapsRequired:1];
    UITapGestureRecognizer *pinkInvertedSquareTapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(invertedSquareClicked)];
    [pinkInvertedSquareTapped setNumberOfTapsRequired:1];
    UITapGestureRecognizer *blueRhombusTapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rhombusClicked)];
    [blueRhombusTapped setNumberOfTapsRequired:1];
    UITapGestureRecognizer *cyanSquareTapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(squareClicked)];
    [cyanSquareTapped setNumberOfTapsRequired:1];
    UITapGestureRecognizer *purpleDiamondTapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(diamondClicked)];
    [purpleDiamondTapped setNumberOfTapsRequired:1];
    UITapGestureRecognizer *greenTriangleTapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(triangleClicked)];
    [greenTriangleTapped setNumberOfTapsRequired:1];
    [self.redCircleImage addGestureRecognizer:redCircleTapped];
    [self.pinkInvertedSquareImage addGestureRecognizer:pinkInvertedSquareTapped];
    [self.blueRhombusImage addGestureRecognizer:blueRhombusTapped];
    [self.cyanSquareImage addGestureRecognizer:cyanSquareTapped];
    [self.purpleDiamondImage addGestureRecognizer:purpleDiamondTapped];
    [self.greenTriangleImage addGestureRecognizer:greenTriangleTapped];
}
-(void)checkLenghtOfArray{
    if (self.tempCounter2 == self.logicalPursuitData.roundCounter - 1){
        [self reset];
        [self.logicalPursuitData roundCounterPlus];
        [self generatePattern];
        
    }
    else{
        self.tempCounter2++;
    }

}
-(void)saveScoreAndExit{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:@"save.txt"];
    NSMutableDictionary *userData = [NSMutableDictionary dictionaryWithContentsOfFile:filePath];
    int currentHighScore = [[userData valueForKey:@"LogicalPursuitHighScore"] intValue];
    if (self.logicalPursuitData.currentPoints > currentHighScore){
        
        int newHighScore = self.logicalPursuitData.currentPoints;
        NSNumber *newHighScoreNSN = [[NSNumber alloc] initWithInt:newHighScore];
        [userData setValue:newHighScoreNSN forKey:@"LogicalPursuitHighScore"];
        [userData writeToFile:filePath atomically:YES];
        UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        ViewController *vc = [mainStoryBoard instantiateViewControllerWithIdentifier:@"LogicalPursuitWinScreen"];
        [self presentViewController:vc animated:YES completion:nil];
        
    }
    else {
        
        UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        ViewController *vc = [mainStoryBoard instantiateViewControllerWithIdentifier:@"LogicalPursuitLoseScreen"];
        [self presentViewController:vc animated:YES completion:nil];
        
    }
}
-(void)circleClicked{
    NSLog(@"circle clicked");
    
    if([[self.logicalPursuitData.latestPattern objectAtIndex:self.tempCounter2]  isEqualToString: @"circle"]){
        NSLog(@"correct");
        [self.logicalPursuitData calculatePoints];
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d",self.logicalPursuitData.currentPoints];
        [self checkLenghtOfArray];
        
    }
    else {
        NSLog(@"WRONG");
        NSLog(@"Correct Shape was : %@", [self.logicalPursuitData.latestPattern objectAtIndex:self.tempCounter2]);
        [self.logicalPursuitData removeLive];
        self.livesRemainingLabel.text = [NSString stringWithFormat:@"Lives Remaining: %d", self.logicalPursuitData.currentLives];
        [self.logicalPursuitData checkLives];
        if ([self.logicalPursuitData checkLives] == true){
            [self saveScoreAndExit];
        }
        [self reset];
        [self generatePattern];
    
    }
}
-(void)invertedSquareClicked{
    NSLog(@"inverted square clicked");
    if([[self.logicalPursuitData.latestPattern objectAtIndex:self.tempCounter2]  isEqualToString: @"invertedSquare"]){
        NSLog(@"correct");
        [self.logicalPursuitData calculatePoints];
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d",self.logicalPursuitData.currentPoints];
        [self checkLenghtOfArray];
    }
    else {
        NSLog(@"WRONG");
        NSLog(@"Correct Shape was : %@", [self.logicalPursuitData.latestPattern objectAtIndex:self.tempCounter2]);
        [self.logicalPursuitData removeLive];
        self.livesRemainingLabel.text = [NSString stringWithFormat:@"Lives Remaining: %d", self.logicalPursuitData.currentLives];
        [self.logicalPursuitData checkLives];
        if ([self.logicalPursuitData checkLives] == true){
            [self saveScoreAndExit];
        }
        [self reset];
        [self generatePattern];
    
    }
}
-(void)rhombusClicked{
    NSLog(@"rhombus clicked");
    if([[self.logicalPursuitData.latestPattern objectAtIndex:self.tempCounter2]  isEqualToString: @"rhombus"]){
        NSLog(@"correct");
        [self.logicalPursuitData calculatePoints];
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d",self.logicalPursuitData.currentPoints];
        [self checkLenghtOfArray];
    }
    else {
        NSLog(@"WRONG");
        NSLog(@"Correct Shape was : %@", [self.logicalPursuitData.latestPattern objectAtIndex:self.tempCounter2]);
        [self.logicalPursuitData removeLive];
        self.livesRemainingLabel.text = [NSString stringWithFormat:@"Lives Remaining: %d", self.logicalPursuitData.currentLives];
        [self.logicalPursuitData checkLives];
        if ([self.logicalPursuitData checkLives] == true){
            [self saveScoreAndExit];
        }
        [self reset];
        [self generatePattern];
    
    }
}
-(void)squareClicked{
    NSLog(@"square clicked");
    if([[self.logicalPursuitData.latestPattern objectAtIndex:self.tempCounter2]  isEqualToString: @"square"]){
        NSLog(@"correct");
        [self.logicalPursuitData calculatePoints];
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d",self.logicalPursuitData.currentPoints];
        [self checkLenghtOfArray];
    }
    else {
        NSLog(@"WRONG");
        NSLog(@"Correct Shape was : %@", [self.logicalPursuitData.latestPattern objectAtIndex:self.tempCounter2]);
        [self.logicalPursuitData removeLive];
        self.livesRemainingLabel.text = [NSString stringWithFormat:@"Lives Remaining: %d", self.logicalPursuitData.currentLives];
        [self.logicalPursuitData checkLives];
        if ([self.logicalPursuitData checkLives] == true){
            [self saveScoreAndExit];
        }
        [self reset];
        [self generatePattern];
    
    }
}
-(void)diamondClicked{
    NSLog(@"diamond clicked");
    if([[self.logicalPursuitData.latestPattern objectAtIndex:self.tempCounter2]  isEqualToString: @"diamond"]){
        NSLog(@"correct");
        [self.logicalPursuitData calculatePoints];
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d",self.logicalPursuitData.currentPoints];
        [self checkLenghtOfArray];
    }
    else {
        NSLog(@"WRONG");
        NSLog(@"Correct Shape was : %@", [self.logicalPursuitData.latestPattern objectAtIndex:self.tempCounter2]);
        [self.logicalPursuitData removeLive];
        self.livesRemainingLabel.text = [NSString stringWithFormat:@"Lives Remaining: %d", self.logicalPursuitData.currentLives];
        [self.logicalPursuitData checkLives];
        if ([self.logicalPursuitData checkLives] == true){
            [self saveScoreAndExit];
        }
        [self reset];
        [self generatePattern];
    
    }
}
-(void)triangleClicked{
    NSLog(@"triangle clicked");
    if([[self.logicalPursuitData.latestPattern objectAtIndex:self.tempCounter2]  isEqualToString: @"triangle"]){
        NSLog(@"correct");
        [self.logicalPursuitData calculatePoints];
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d",self.logicalPursuitData.currentPoints];
        [self checkLenghtOfArray];
    }
    else {
        NSLog(@"WRONG");
        NSLog(@"Correct Shape was : %@", [self.logicalPursuitData.latestPattern objectAtIndex:self.tempCounter2]);
        [self.logicalPursuitData removeLive];
        self.livesRemainingLabel.text = [NSString stringWithFormat:@"Lives Remaining: %d", self.logicalPursuitData.currentLives];
        [self.logicalPursuitData checkLives];
        if ([self.logicalPursuitData checkLives] == true){
            [self saveScoreAndExit];
        }
        [self reset];
        [self generatePattern];
     
    }
}

-(void)lightCircle{
    [self.redCircleImage setImage:[UIImage imageNamed:@"redCircleOnImage"]];
    self.whenToPlayLabel.text = [NSString stringWithFormat:(@"%d"),self.tempCounter+1];
    self.tempCounter ++;
    //[NSThread sleepForTimeInterval:2.0f];
    
}
-(void)lightInvertedSquare{
    [self.pinkInvertedSquareImage setImage:[UIImage imageNamed:@"pinkInvertedSquareOnImage"]];
    self.whenToPlayLabel.text = [NSString stringWithFormat:(@"%d"),self.tempCounter+1];
    self.tempCounter ++;
    
}
-(void)lightRhombus{
    [self.blueRhombusImage setImage:[UIImage imageNamed:@"blueRhombusOnImage"]];
    self.whenToPlayLabel.text = [NSString stringWithFormat:(@"%d"),self.tempCounter+1];
    self.tempCounter ++;
    
}
-(void)lightSquare{
    [self.cyanSquareImage setImage:[UIImage imageNamed:@"cyanSquareOnImage"]];
    self.whenToPlayLabel.text = [NSString stringWithFormat:(@"%d"),self.tempCounter+1];
    self.tempCounter ++;
    
}
-(void)lightDiamond{
    [self.purpleDiamondImage setImage:[UIImage imageNamed:@"purpleDiamondOnImage"]];
    self.whenToPlayLabel.text = [NSString stringWithFormat:(@"%d"),self.tempCounter+1];
    self.tempCounter ++;
    
}
-(void)lightTriangle{
    [self.greenTriangleImage setImage:[UIImage imageNamed:@"greenTriangleOnImage"]];
    self.whenToPlayLabel.text = [NSString stringWithFormat:(@"%d"),self.tempCounter+1];
    self.tempCounter ++;
    
}

-(int)reset{
    self.tempCounter = 0;
    self.tempCounter2 = 0;
    [self.logicalPursuitData clearArray];
    //for (int i = 0; i < self.logicalPursuitData.roundCounter ; i++) {
       // [self.logicalPursuitData.latestPattern removeAllObjects];
    //}
    return self.tempCounter;
    return self.tempCounter2;
}
-(void)generatePattern{
    
    if(self.tempCounter < self.logicalPursuitData.roundCounter){
        
        
        [self.view setUserInteractionEnabled:NO];
        
        NSLog(@"roundCounter is %d",self.logicalPursuitData.roundCounter);
        NSLog(@"roundCounter is %d",self.tempCounter);
        // Turs last shape that was on off
        [self.redCircleImage setImage:[UIImage imageNamed:@"redCircleOffImage"]];
        [self.pinkInvertedSquareImage setImage:[UIImage imageNamed:@"pinkInvertedSquareOffImage"]];
        [self.blueRhombusImage setImage:[UIImage imageNamed:@"blueRhombusOffImage"]];
        [self.cyanSquareImage setImage:[UIImage imageNamed:@"cyanSquareOffImage"]];
        [self.purpleDiamondImage setImage:[UIImage imageNamed:@"purpleDiamondOffImage"]];
        [self.greenTriangleImage setImage:[UIImage imageNamed:@"greenTriangleOffImage"]];
        
        [self.logicalPursuitData pickNextShape];
        [self.logicalPursuitData shapeSelector];
        [self flashPattern];
        NSLog(@"random number is: %d", self.logicalPursuitData.randomOne);
        NSLog(@"Next shape has been picked");
        //[self.logicalPursuitData.latestPattern addObject:self.logicalPursuitData.shape];
        NSLog(@"pattern has been generated");
    }
    else {
        [self.redCircleImage setImage:[UIImage imageNamed:@"redCircleOffImage"]]; //Needs to be set
        [self.pinkInvertedSquareImage setImage:[UIImage imageNamed:@"pinkInvertedSquareOffImage"]]; //Needs to be set
        [self.blueRhombusImage setImage:[UIImage imageNamed:@"blueRhombusOffImage"]]; //Needs to be set
        [self.cyanSquareImage setImage:[UIImage imageNamed:@"cyanSquareOffImage"]]; //Needs to be set
        [self.purpleDiamondImage setImage:[UIImage imageNamed:@"purpleDiamondOffImage"]]; //Needs to be set
        [self.greenTriangleImage setImage:[UIImage imageNamed:@"greenTriangleOffImage"]]; //Needs to be set
        NSLog(@"pattern has been flashed");
        [self.view setUserInteractionEnabled:YES];
        self.whenToPlayLabel.text = (@"Play Now");
        
    }
    
    
}


-(void)flashPattern {
            NSLog(@"shape from the index is: %@", [self.logicalPursuitData.latestPattern objectAtIndex:self.tempCounter]);
    
        if ([[self.logicalPursuitData.latestPattern objectAtIndex:self.tempCounter]  isEqualToString: @"circle"]){
            NSLog(@"light up red circle");
            [self lightCircle];
            [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(generatePattern) userInfo:nil repeats:NO];
            
        }
        else if ([[self.logicalPursuitData.latestPattern objectAtIndex:self.tempCounter]  isEqualToString: @"invertedSquare"]){
            NSLog(@"light up pink inverted square");
            [self lightInvertedSquare];
            [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(generatePattern) userInfo:nil repeats:NO];
            
        }
        else if ([[self.logicalPursuitData.latestPattern objectAtIndex:self.tempCounter]  isEqualToString: @"rhombus"]){
            NSLog(@"light up blue rhombus");
            [self lightRhombus];
            [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(generatePattern) userInfo:nil repeats:NO];
            
        }
        else if ([[self.logicalPursuitData.latestPattern objectAtIndex:self.tempCounter]  isEqualToString: @"square"]){
            NSLog(@"light up cyan square");
            [self lightSquare];
            [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(generatePattern) userInfo:nil repeats:NO];
            
        }
        else if ([[self.logicalPursuitData.latestPattern objectAtIndex:self.tempCounter]  isEqualToString: @"diamond"]){
            NSLog(@"light up purple diamond");
            [self lightDiamond];
            [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(generatePattern) userInfo:nil repeats:NO];
            
        }
        else if ([[self.logicalPursuitData.latestPattern objectAtIndex:self.tempCounter]  isEqualToString: @"triangle"]){
            NSLog(@"light up green triangle");
            [self lightTriangle];
            [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(generatePattern) userInfo:nil repeats:NO];
            
        }
}

- (IBAction)mainMenuButtonPressed:(UIButton *)sender {
}
@end
