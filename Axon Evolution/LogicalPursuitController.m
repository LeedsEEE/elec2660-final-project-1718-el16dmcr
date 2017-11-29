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
    
    self.navigationItem.hidesBackButton = YES;
    
    [self.redCircleImage setImage:[UIImage imageNamed:@""]]; //Needs to be set
    [self.redCircleImage setUserInteractionEnabled:YES];
    [self.pinkInvertedSquareImage setImage:[UIImage imageNamed:@""]]; //Needs to be set
    [self.pinkInvertedSquareImage setUserInteractionEnabled:YES];
    [self.blueRhombusImage setImage:[UIImage imageNamed:@""]]; //Needs to be set
    [self.blueRhombusImage setUserInteractionEnabled:YES];
    [self.cyanSquareImage setImage:[UIImage imageNamed:@""]]; //Needs to be set
    [self.cyanSquareImage setUserInteractionEnabled:YES];
    [self.purpleDiamondImage setImage:[UIImage imageNamed:@""]]; //Needs to be set
    [self.purpleDiamondImage setUserInteractionEnabled:YES];
    [self.greenTriangleImage setImage:[UIImage imageNamed:@""]]; //Needs to be set
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
    
    [self generatePattern];
    [self flashPattern];
     
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
-(void)shapeClicked{
    NSLog(@"shape clicked");
}
-(NSMutableArray *)generatePattern{
    for(int i = 0; i<self.logicalPursuitData.roundCounter; i++){
        [self.logicalPursuitData pickNextShape];
        [self.logicalPursuitData.latestPattern addObject:[NSNumber numberWithInt:self.logicalPursuitData.randomOne]];
        
    }
    return self.logicalPursuitData.latestPattern;
}


-(void)flashPattern {
    for(int i = 0; i<self.logicalPursuitData.roundCounter; i++) {
        [self.logicalPursuitData shapeSelector];
        if ([[self.logicalPursuitData.latestPattern objectAtIndex:i]  isEqual: @"circle"]){
            NSLog(@"light up red circle");
        }
        else if ([[self.logicalPursuitData.latestPattern objectAtIndex:i]  isEqual: @"invertedSquare"]){
            NSLog(@"light up pink inverted square");
        }
        else if ([[self.logicalPursuitData.latestPattern objectAtIndex:i]  isEqual: @"rhombus"]){
            NSLog(@"light up blue rhombus");
        }
        else if ([[self.logicalPursuitData.latestPattern objectAtIndex:i]  isEqual: @"square"]){
            NSLog(@"light up cyan square");
        }
        else if ([[self.logicalPursuitData.latestPattern objectAtIndex:i]  isEqual: @"diamond"]){
            NSLog(@"light up purple diamond");
        }
        else if ([[self.logicalPursuitData.latestPattern objectAtIndex:i]  isEqual: @"triangle"]){
            NSLog(@"light up green triangle");
        }
    }
}

- (IBAction)mainMenuButtonPressed:(UIButton *)sender {
}
@end
