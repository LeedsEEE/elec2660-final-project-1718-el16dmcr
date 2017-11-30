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

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.logicalPursuitData = [[LogicalPursuit alloc] init];  // need this so it knows what ive set variables as in other classes
    
    self.navigationItem.hidesBackButton = YES;
    
    //[self.logicalPursuitData init];
    
    
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
    
    UITapGestureRecognizer *redCircleTapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(shapeClicked)];
    [redCircleTapped setNumberOfTapsRequired:1];
    UITapGestureRecognizer *pinkInvertedSquareTapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(shapeClicked)];
    [pinkInvertedSquareTapped setNumberOfTapsRequired:1];
    UITapGestureRecognizer *blueRhombusTapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(shapeClicked)];
    [blueRhombusTapped setNumberOfTapsRequired:1];
    UITapGestureRecognizer *cyanSquareTapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(shapeClicked)];
    [cyanSquareTapped setNumberOfTapsRequired:1];
    UITapGestureRecognizer *purpleDiamondTapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(shapeClicked)];
    [purpleDiamondTapped setNumberOfTapsRequired:1];
    UITapGestureRecognizer *greenTriangleTapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(shapeClicked)];
    [greenTriangleTapped setNumberOfTapsRequired:1];
    [self.redCircleImage addGestureRecognizer:redCircleTapped];
    [self.pinkInvertedSquareImage addGestureRecognizer:pinkInvertedSquareTapped];
    [self.blueRhombusImage addGestureRecognizer:blueRhombusTapped];
    [self.cyanSquareImage addGestureRecognizer:cyanSquareTapped];
    [self.purpleDiamondImage addGestureRecognizer:purpleDiamondTapped];
    [self.greenTriangleImage addGestureRecognizer:greenTriangleTapped];
    
    [self.logicalPursuitData setStartLives];
    
    NSLog(@"counter is %d", self.logicalPursuitData.roundCounter);
    NSLog(@"lives are %d", self.logicalPursuitData.currentLives);
    
    
    //[NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(generatePattern) userInfo:nil repeats:NO];
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(flashPattern) userInfo:nil repeats:NO];
    //[self generatePattern];
    //[self flashPattern];
    //[self.logicalPursuitData pickNextShape];
    //NSLog(@"random number is %d", self.logicalPursuitData.randomOne);
    
     
    // Do any additional setup after loading the view.
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

-(void)lightCircle{
    [self.redCircleImage setImage:[UIImage imageNamed:@"redCircleOnImage"]];
    //[NSThread sleepForTimeInterval:2.0f];
    
}
-(void)lightInvertedSquare{
    [self.pinkInvertedSquareImage setImage:[UIImage imageNamed:@"pinkInvertedSquareOnImage"]];
    
}
-(void)lightRhombus{
    [self.redCircleImage setImage:[UIImage imageNamed:@"blueRhombusOnImage"]];
    
}
-(void)lightSquare{
    [self.redCircleImage setImage:[UIImage imageNamed:@"cyanSquareOnImage"]];
    
}
-(void)lightDiamond{
    [self.redCircleImage setImage:[UIImage imageNamed:@"purpleDiamondOnImage"]];
    
}
-(void)lightTriangle{
    [self.redCircleImage setImage:[UIImage imageNamed:@"greenTriangleOnImage"]];
    
}
-(void)shapeClicked{
    NSLog(@"shape clicked");
}
-(NSMutableArray *)generatePattern{
    for(int i = 0; i<=self.logicalPursuitData.roundCounter; i++){
        
        [self.logicalPursuitData pickNextShape];
        [self.logicalPursuitData shapeSelector];
        NSLog(@"random number is: %d", self.logicalPursuitData.randomOne);
        NSLog(@"Next shape has been picked");
        //[self.logicalPursuitData.latestPattern addObject:self.logicalPursuitData.shape];
        NSLog(@"pattern has been generated");
        
    }
    return self.logicalPursuitData.latestPattern;
}


-(void)flashPattern {
    for(int i = 0; i<self.logicalPursuitData.roundCounter; i++) {
        
        
        [self.redCircleImage setImage:[UIImage imageNamed:@"redCircleOffImage"]]; //Needs to be set
        
        [self.pinkInvertedSquareImage setImage:[UIImage imageNamed:@"pinkInvertedSquareOffImage"]]; //Needs to be set
        
        [self.blueRhombusImage setImage:[UIImage imageNamed:@"blueRhombusOffImage"]]; //Needs to be set
        
        [self.cyanSquareImage setImage:[UIImage imageNamed:@"cyanSquareOffImage"]]; //Needs to be set
        
        [self.purpleDiamondImage setImage:[UIImage imageNamed:@"purpleDiamondOffImage"]]; //Needs to be set
        
        [self.greenTriangleImage setImage:[UIImage imageNamed:@"greenTriangleOffImage"]]; //Needs to be set
        
        [self.logicalPursuitData pickNextShape];
        [self.logicalPursuitData shapeSelector];
        
        double delayInSeconds = 2.0;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC)); //REFERENCE
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            NSLog(@"shape from the index is: %@", [self.logicalPursuitData.latestPattern objectAtIndex:i]);
            
        
        if ([[self.logicalPursuitData.latestPattern objectAtIndex:i]  isEqualToString: @"circle"]){
            NSLog(@"light up red circle");
            [self lightCircle];
            //[NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(lightCircle) userInfo:nil repeats:NO];
            
            
        }
        else if ([[self.logicalPursuitData.latestPattern objectAtIndex:i]  isEqualToString: @"invertedSquare"]){
            NSLog(@"light up pink inverted square");
            [self lightInvertedSquare];
            //[NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(lightInvertedSquare) userInfo:nil repeats:NO];
            
        }
        else if ([[self.logicalPursuitData.latestPattern objectAtIndex:i]  isEqualToString: @"rhombus"]){
            NSLog(@"light up blue rhombus");
            [self lightRhombus];
            //[NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(lightRhombus) userInfo:nil repeats:NO];
            
        }
        else if ([[self.logicalPursuitData.latestPattern objectAtIndex:i]  isEqualToString: @"square"]){
            NSLog(@"light up cyan square");
            [self lightSquare];
            //[NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(lightSquare) userInfo:nil repeats:NO];
            
        }
        else if ([[self.logicalPursuitData.latestPattern objectAtIndex:i]  isEqualToString: @"diamond"]){
            NSLog(@"light up purple diamond");
            [self lightDiamond];
            //[NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(lightDiamond) userInfo:nil repeats:NO];
            
        }
        else if ([[self.logicalPursuitData.latestPattern objectAtIndex:i]  isEqualToString: @"triangle"]){
            NSLog(@"light up green triangle");
            [self lightTriangle];
            //[NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(lightTriangle) userInfo:nil repeats:NO];
            
        }
        });
            
    }
}

- (IBAction)mainMenuButtonPressed:(UIButton *)sender {
}
@end
