//
//  FlipRetentionController.m
//  Axon Evolution
//
//  Created by David Russell [el16dmcr] on 30/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "FlipRetentionController.h"

@interface FlipRetentionController ()

@end

@implementation FlipRetentionController

- (void)viewDidLoad {
    [super viewDidLoad];
    //[self.flipRetentionData ]
    
    
    //[self.a11Image setUserInteractionEnabled:YES];
    
    self.flipRetentionData = [[FlipRetentionData alloc] init];
    [self generateRandomImages];
    [self.a11Image setUserInteractionEnabled:YES];
    UITapGestureRecognizer *a11Tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(a11Tapped)];
    [a11Tapped setNumberOfTapsRequired:1];
    [self.a12Image setUserInteractionEnabled:YES];
    UITapGestureRecognizer *a12Tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(a12Tapped)];
    [a12Tapped setNumberOfTapsRequired:1];
    [self.a13Image setUserInteractionEnabled:YES];
    UITapGestureRecognizer *a13Tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(a13Tapped)];
    [a13Tapped setNumberOfTapsRequired:1];
    [self.a14Image setUserInteractionEnabled:YES];
    UITapGestureRecognizer *a14Tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(a14Tapped)];
    [a14Tapped setNumberOfTapsRequired:1];
    
    [self.a21Image setUserInteractionEnabled:YES];
    UITapGestureRecognizer *a21Tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(a21Tapped)];
    [a21Tapped setNumberOfTapsRequired:1];
    [self.a22Image setUserInteractionEnabled:YES];
    UITapGestureRecognizer *a22Tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(a22Tapped)];
    [a22Tapped setNumberOfTapsRequired:1];
    [self.a23Image setUserInteractionEnabled:YES];
    UITapGestureRecognizer *a23Tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(a23Tapped)];
    [a23Tapped setNumberOfTapsRequired:1];
    [self.a24Image setUserInteractionEnabled:YES];
    UITapGestureRecognizer *a24Tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(a24Tapped)];
    [a24Tapped setNumberOfTapsRequired:1];
    
    [self.a31Image setUserInteractionEnabled:YES];
    UITapGestureRecognizer *a31Tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(a31Tapped)];
    [a31Tapped setNumberOfTapsRequired:1];
    [self.a32Image setUserInteractionEnabled:YES];
    UITapGestureRecognizer *a32Tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(a32Tapped)];
    [a32Tapped setNumberOfTapsRequired:1];
    [self.a33Image setUserInteractionEnabled:YES];
    UITapGestureRecognizer *a33Tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(a33Tapped)];
    [a33Tapped setNumberOfTapsRequired:1];
    [self.a34Image setUserInteractionEnabled:YES];
    UITapGestureRecognizer *a34Tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(a34Tapped)];
    [a34Tapped setNumberOfTapsRequired:1];
    
    [self.a41Image setUserInteractionEnabled:YES];
    UITapGestureRecognizer *a41Tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(a41Tapped)];
    [a41Tapped setNumberOfTapsRequired:1];
    [self.a42Image setUserInteractionEnabled:YES];
    UITapGestureRecognizer *a42Tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(a42Tapped)];
    [a42Tapped setNumberOfTapsRequired:1];
    [self.a43Image setUserInteractionEnabled:YES];
    UITapGestureRecognizer *a43Tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(a43Tapped)];
    [a43Tapped setNumberOfTapsRequired:1];
    [self.a44Image setUserInteractionEnabled:YES];
    UITapGestureRecognizer *a44Tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(a44Tapped)];
    [a44Tapped setNumberOfTapsRequired:1];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)a11Tapped{
    
}
-(void)a12Tapped{
    
}
-(void)a13Tapped{
    
}
-(void)a14Tapped{
    
}
-(void)a21Tapped{
    
}
-(void)a22Tapped{
    
}
-(void)a23Tapped{
    
}
-(void)a24Tapped{
    
}
-(void)a31Tapped{
    
}
-(void)a32Tapped{
    
}
-(void)a33Tapped{
    
}
-(void)a34Tapped{
    
}
-(void)a41Tapped{
    
}
-(void)a42Tapped{
    
}
-(void)a43Tapped{
    
}
-(void)a144Tapped{
    
}

-(void)generateRandomImages{
    for(int i = 0; i<8; i++){
        
        NSLog(@"i = %d",i);
        NSLog(@"counter one %d", self.flipRetentionData.counterOne);
        
        
        [self.flipRetentionData generatePairImages];
        NSLog(@"random number one is : %d", self.flipRetentionData.randomOne);
        NSLog(@"number in array: %@", [self.flipRetentionData.firstEightPlaces objectAtIndex:self.flipRetentionData.randomOne]);
        [self.flipRetentionData incrementCounterOne];
        if ([[self.flipRetentionData.firstEightPlaces objectAtIndex:self.flipRetentionData.randomOne] isEqual: @1]){
            self.tagSetter = 1;
            [self.flipRetentionData generatePairPositions];
            [self generatePlaceForImage:[self.flipRetentionData.firstEightPlaces objectAtIndex:self.flipRetentionData.randomOne]];
            [self.flipRetentionData incrementCounterTwo];
            [self.flipRetentionData.sixteenPositionTiles removeObjectAtIndex:self.flipRetentionData.randomTwo];
            [self.flipRetentionData generatePairPositions];
            [self generatePlaceForImage:[self.flipRetentionData.firstEightPlaces objectAtIndex:self.flipRetentionData.randomOne]];
            [self.flipRetentionData incrementCounterTwo];
            [self.flipRetentionData.sixteenPositionTiles removeObjectAtIndex:self.flipRetentionData.randomTwo];
            [self.flipRetentionData.firstEightPlaces removeObjectAtIndex:self.flipRetentionData.randomOne];
            NSLog(@"Number 1 Picked");
        }
        else if ([[self.flipRetentionData.firstEightPlaces objectAtIndex:self.flipRetentionData.randomOne]  isEqual: @2]){
            self.tagSetter = 2;
            [self.flipRetentionData generatePairPositions];
            [self generatePlaceForImage:[self.flipRetentionData.firstEightPlaces objectAtIndex:self.flipRetentionData.randomOne]];
            [self.flipRetentionData incrementCounterTwo];
            [self.flipRetentionData.sixteenPositionTiles removeObjectAtIndex:self.flipRetentionData.randomTwo];
            [self.flipRetentionData generatePairPositions];
            [self generatePlaceForImage:[self.flipRetentionData.firstEightPlaces objectAtIndex:self.flipRetentionData.randomOne]];
            [self.flipRetentionData incrementCounterTwo];
            [self.flipRetentionData.sixteenPositionTiles removeObjectAtIndex:self.flipRetentionData.randomTwo];
            [self.flipRetentionData.firstEightPlaces removeObjectAtIndex:self.flipRetentionData.randomOne];
            NSLog(@"Number 2 Picked");
        }
        else if ([[self.flipRetentionData.firstEightPlaces objectAtIndex:self.flipRetentionData.randomOne]  isEqual: @3]){
            self.tagSetter = 3;
            [self.flipRetentionData generatePairPositions];
            [self generatePlaceForImage:[self.flipRetentionData.firstEightPlaces objectAtIndex:self.flipRetentionData.randomOne]];
            [self.flipRetentionData incrementCounterTwo];
            [self.flipRetentionData.sixteenPositionTiles removeObjectAtIndex:self.flipRetentionData.randomTwo];
            [self.flipRetentionData generatePairPositions];
            [self generatePlaceForImage:[self.flipRetentionData.firstEightPlaces objectAtIndex:self.flipRetentionData.randomOne]];
            [self.flipRetentionData incrementCounterTwo];
            [self.flipRetentionData.sixteenPositionTiles removeObjectAtIndex:self.flipRetentionData.randomTwo];
            [self.flipRetentionData.firstEightPlaces removeObjectAtIndex:self.flipRetentionData.randomOne];
            NSLog(@"Number 3 picked");
        }
        else if ([[self.flipRetentionData.firstEightPlaces objectAtIndex:self.flipRetentionData.randomOne]  isEqual: @4]){
            self.tagSetter = 4;
            [self.flipRetentionData generatePairPositions];
            [self generatePlaceForImage:[self.flipRetentionData.firstEightPlaces objectAtIndex:self.flipRetentionData.randomOne]];
            [self.flipRetentionData incrementCounterTwo];
            [self.flipRetentionData.sixteenPositionTiles removeObjectAtIndex:self.flipRetentionData.randomTwo];
            [self.flipRetentionData generatePairPositions];
            
            [self generatePlaceForImage:[self.flipRetentionData.firstEightPlaces objectAtIndex:self.flipRetentionData.randomOne]];
            [self.flipRetentionData incrementCounterTwo];
            [self.flipRetentionData.sixteenPositionTiles removeObjectAtIndex:self.flipRetentionData.randomTwo];
            [self.flipRetentionData.firstEightPlaces removeObjectAtIndex:self.flipRetentionData.randomOne];
            NSLog(@"Number 4 Picked");
        }
        else if ([[self.flipRetentionData.firstEightPlaces objectAtIndex:self.flipRetentionData.randomOne]  isEqual: @5]){
            self.tagSetter = 5;
            [self.flipRetentionData generatePairPositions];
            [self generatePlaceForImage:[self.flipRetentionData.firstEightPlaces objectAtIndex:self.flipRetentionData.randomOne]];
            [self.flipRetentionData incrementCounterTwo];
            [self.flipRetentionData.sixteenPositionTiles removeObjectAtIndex:self.flipRetentionData.randomTwo];
            [self.flipRetentionData generatePairPositions];
            [self generatePlaceForImage:[self.flipRetentionData.firstEightPlaces objectAtIndex:self.flipRetentionData.randomOne]];
            [self.flipRetentionData incrementCounterTwo];
            [self.flipRetentionData.sixteenPositionTiles removeObjectAtIndex:self.flipRetentionData.randomTwo];
            [self.flipRetentionData.firstEightPlaces removeObjectAtIndex:self.flipRetentionData.randomOne];
            NSLog(@"Number 5 Picked");
        }
        else if ([[self.flipRetentionData.firstEightPlaces objectAtIndex:self.flipRetentionData.randomOne]  isEqual: @6]){
            self.tagSetter = 6;
            [self.flipRetentionData generatePairPositions];
            [self generatePlaceForImage:[self.flipRetentionData.firstEightPlaces objectAtIndex:self.flipRetentionData.randomOne]];
            [self.flipRetentionData incrementCounterTwo];
            [self.flipRetentionData.sixteenPositionTiles removeObjectAtIndex:self.flipRetentionData.randomTwo];
            [self.flipRetentionData generatePairPositions];
            [self generatePlaceForImage:[self.flipRetentionData.firstEightPlaces objectAtIndex:self.flipRetentionData.randomOne]];
            [self.flipRetentionData incrementCounterTwo];
            [self.flipRetentionData.sixteenPositionTiles removeObjectAtIndex:self.flipRetentionData.randomTwo];
            [self.flipRetentionData.firstEightPlaces removeObjectAtIndex:self.flipRetentionData.randomOne];
            NSLog(@"Number 6 Picked");
        }
        else if ([[self.flipRetentionData.firstEightPlaces objectAtIndex:self.flipRetentionData.randomOne]  isEqual: @7]){
            self.tagSetter = 7;
            [self.flipRetentionData generatePairPositions];
            [self generatePlaceForImage:[self.flipRetentionData.firstEightPlaces objectAtIndex:self.flipRetentionData.randomOne]];
            [self.flipRetentionData incrementCounterTwo];
            [self.flipRetentionData.sixteenPositionTiles removeObjectAtIndex:self.flipRetentionData.randomTwo];
            [self.flipRetentionData generatePairPositions];
            [self generatePlaceForImage:[self.flipRetentionData.firstEightPlaces objectAtIndex:self.flipRetentionData.randomOne]];
            [self.flipRetentionData incrementCounterTwo];
            [self.flipRetentionData.sixteenPositionTiles removeObjectAtIndex:self.flipRetentionData.randomTwo];
            [self.flipRetentionData.firstEightPlaces removeObjectAtIndex:self.flipRetentionData.randomOne];
            NSLog(@"Number 7 Picked");
        }
        else if ([[self.flipRetentionData.firstEightPlaces objectAtIndex:self.flipRetentionData.randomOne]  isEqual: @8]){
            self.tagSetter = 8;
            [self.flipRetentionData generatePairPositions];
            [self generatePlaceForImage:[self.flipRetentionData.firstEightPlaces objectAtIndex:self.flipRetentionData.randomOne]];
            [self.flipRetentionData incrementCounterTwo];
            [self.flipRetentionData.sixteenPositionTiles removeObjectAtIndex:self.flipRetentionData.randomTwo];
            [self.flipRetentionData generatePairPositions];
            [self generatePlaceForImage:[self.flipRetentionData.firstEightPlaces objectAtIndex:self.flipRetentionData.randomOne]];
            [self.flipRetentionData incrementCounterTwo];
            [self.flipRetentionData.sixteenPositionTiles removeObjectAtIndex:self.flipRetentionData.randomTwo];
            [self.flipRetentionData.firstEightPlaces removeObjectAtIndex:self.flipRetentionData.randomOne];
            NSLog(@"Number 8 Picked");
        }
        
    }
}
-(void)generatePlaceForImage: (id)sender{
    NSLog(@"sender is: %@",sender);
    NSLog(@"Random Place selector number is %d", self.flipRetentionData.randomTwo);
    if([[self.flipRetentionData.sixteenPositionTiles objectAtIndex:self.flipRetentionData.randomTwo]  isEqual: @1]){
        NSLog(@" picture a11");
        if (self.tagSetter == 1){
            
            [self.a11Image setImage:[UIImage imageNamed:@"setOnePairOne"]];
            [self.a11Image setTag:(int) sender];
        }
        else if(self.tagSetter == 2){
            
            [self.a11Image setImage:[UIImage imageNamed:@"setOnePairTwo"]];
            [self.a11Image setTag:(int) sender];
        }
        else if(self.tagSetter == 3){

            [self.a11Image setImage:[UIImage imageNamed:@"setOnePairThree"]];
            [self.a11Image setTag:(int) sender];
        }
        else if(self.tagSetter == 4){
            [self.a11Image setImage:[UIImage imageNamed:@"setOnePairFour"]];
            [self.a11Image setTag:(int) sender];
        }
        else if(self.tagSetter == 5){
            [self.a11Image setImage:[UIImage imageNamed:@"setOnePairFive"]];
            [self.a11Image setTag:(int) sender];
        }
        else if(self.tagSetter == 6){
            [self.a11Image setImage:[UIImage imageNamed:@"setOnePairSix"]];
            [self.a11Image setTag:(int) sender];
        }
        else if(self.tagSetter == 7){
            [self.a11Image setImage:[UIImage imageNamed:@"setOnePairSeven"]];
            [self.a11Image setTag:(int) sender];
        }
        else if(self.tagSetter == 8){
            [self.a11Image setImage:[UIImage imageNamed:@"setOnePairEight"]];
            [self.a11Image setTag:(int) sender];
        }
        
    }
    if([[self.flipRetentionData.sixteenPositionTiles objectAtIndex:self.flipRetentionData.randomTwo]  isEqual: @2]){
        NSLog(@" picture a12");
        if (self.tagSetter == 1){
            [self.a12Image setImage:[UIImage imageNamed:@"setOnePairOne"]];
            [self.a12Image setTag:(int) sender];
        }
        else if(self.tagSetter == 2){
            [self.a12Image setImage:[UIImage imageNamed:@"setOnePairTwo"]];
            [self.a11Image setTag:(int) sender];
        }
        else if(self.tagSetter == 3){
            [self.a12Image setImage:[UIImage imageNamed:@"setOnePairThree"]];
            [self.a11Image setTag:(int) sender];
        }
        else if(self.tagSetter == 4){
            [self.a12Image setImage:[UIImage imageNamed:@"setOnePairFour"]];
            [self.a12Image setTag:(int) sender];
        }
        else if(self.tagSetter == 5){
            [self.a12Image setImage:[UIImage imageNamed:@"setOnePairFive"]];
            [self.a12Image setTag:(int) sender];
        }
        else if(self.tagSetter == 6){
            [self.a12Image setImage:[UIImage imageNamed:@"setOnePairSix"]];
            [self.a12Image setTag:(int) sender];
        }
        else if(self.tagSetter == 7){
            [self.a12Image setImage:[UIImage imageNamed:@"setOnePairSeven"]];
            [self.a12Image setTag:(int) sender];
        }
        else if(self.tagSetter == 8){
            [self.a12Image setImage:[UIImage imageNamed:@"setOnePairEight"]];
            [self.a12Image setTag:(int) sender];
        }
        
    }
    if([[self.flipRetentionData.sixteenPositionTiles objectAtIndex:self.flipRetentionData.randomTwo]  isEqual: @3]){
        NSLog(@" picture a13");
        if (self.tagSetter == 1){
            [self.a13Image setImage:[UIImage imageNamed:@"setOnePairOne"]];
            [self.a13Image setTag:(int) sender];
        }
        else if(self.tagSetter == 2){
            [self.a13Image setImage:[UIImage imageNamed:@"setOnePairTwo"]];
            [self.a13Image setTag:(int) sender];
        }
        else if(self.tagSetter == 3){
            [self.a13Image setImage:[UIImage imageNamed:@"setOnePairThree"]];
            [self.a13Image setTag:(int) sender];
        }
        else if(self.tagSetter == 4){
            [self.a13Image setImage:[UIImage imageNamed:@"setOnePairFour"]];
            [self.a13Image setTag:(int) sender];
        }
        else if(self.tagSetter == 5){
            [self.a13Image setImage:[UIImage imageNamed:@"setOnePairFive"]];
            [self.a13Image setTag:(int) sender];
        }
        else if(self.tagSetter == 6){
            [self.a13Image setImage:[UIImage imageNamed:@"setOnePairSix"]];
            [self.a13Image setTag:(int) sender];
        }
        else if(self.tagSetter == 7){
            [self.a13Image setImage:[UIImage imageNamed:@"setOnePairSeven"]];
            [self.a13Image setTag:(int) sender];
        }
        else if(self.tagSetter == 8){
            [self.a13Image setImage:[UIImage imageNamed:@"setOnePairEight"]];
            [self.a13Image setTag:(int) sender];
        }
        
    }
    if([[self.flipRetentionData.sixteenPositionTiles objectAtIndex:self.flipRetentionData.randomTwo]  isEqual: @4]){
        NSLog(@" picture a14");
        if (self.tagSetter == 1){
            [self.a14Image setImage:[UIImage imageNamed:@"setOnePairOne"]];
            [self.a14Image setTag:(int) sender];
        }
        else if(self.tagSetter == 2){
            [self.a14Image setImage:[UIImage imageNamed:@"setOnePairTwo"]];
            [self.a14Image setTag:(int) sender];
        }
        else if(self.tagSetter == 3){
            [self.a14Image setImage:[UIImage imageNamed:@"setOnePairThree"]];
            [self.a14Image setTag:(int) sender];
        }
        else if(self.tagSetter == 4){
            [self.a14Image setImage:[UIImage imageNamed:@"setOnePairFour"]];
            [self.a14Image setTag:(int) sender];
        }
        else if(self.tagSetter == 5){
            [self.a14Image setImage:[UIImage imageNamed:@"setOnePairFive"]];
            [self.a14Image setTag:(int) sender];
        }
        else if(self.tagSetter == 6){
            [self.a14Image setImage:[UIImage imageNamed:@"setOnePairSix"]];
            [self.a14Image setTag:(int) sender];
        }
        else if(self.tagSetter == 7){
            [self.a14Image setImage:[UIImage imageNamed:@"setOnePairSeven"]];
            [self.a14Image setTag:(int) sender];
        }
        else if(self.tagSetter == 8){
            [self.a14Image setImage:[UIImage imageNamed:@"setOnePairEight"]];
            [self.a14Image setTag:(int) sender];
        }
        
    }
    if([[self.flipRetentionData.sixteenPositionTiles objectAtIndex:self.flipRetentionData.randomTwo]  isEqual: @5]){
        NSLog(@" picture a21");
        if (self.tagSetter == 1){
            [self.a21Image setImage:[UIImage imageNamed:@"setOnePairOne"]];
            [self.a21Image setTag:(int) sender];
        }
        else if(self.tagSetter == 2){
            [self.a21Image setImage:[UIImage imageNamed:@"setOnePairTwo"]];
            [self.a21Image setTag:(int) sender];
        }
        else if(self.tagSetter == 3){
            [self.a21Image setImage:[UIImage imageNamed:@"setOnePairThree"]];
            [self.a21Image setTag:(int) sender];
        }
        else if(self.tagSetter == 4){
            [self.a21Image setImage:[UIImage imageNamed:@"setOnePairFour"]];
            [self.a21Image setTag:(int) sender];
        }
        else if(self.tagSetter == 5){
            [self.a21Image setImage:[UIImage imageNamed:@"setOnePairFive"]];
            [self.a21Image setTag:(int) sender];
        }
        else if(self.tagSetter == 6){
            [self.a21Image setImage:[UIImage imageNamed:@"setOnePairSix"]];
            [self.a21Image setTag:(int) sender];
        }
        else if(self.tagSetter == 7){
            [self.a21Image setImage:[UIImage imageNamed:@"setOnePairSeven"]];
            [self.a21Image setTag:(int) sender];
        }
        else if(self.tagSetter == 8){
            [self.a21Image setImage:[UIImage imageNamed:@"setOnePairEight"]];
            [self.a21Image setTag:(int) sender];
        }
        
    }
    if([[self.flipRetentionData.sixteenPositionTiles objectAtIndex:self.flipRetentionData.randomTwo]  isEqual: @6]){
        NSLog(@" picture a22");
        if (self.tagSetter == 1){
            [self.a22Image setImage:[UIImage imageNamed:@"setOnePairOne"]];
            [self.a22Image setTag:(int) sender];
        }
        else if(self.tagSetter == 2){
            [self.a22Image setImage:[UIImage imageNamed:@"setOnePairTwo"]];
            [self.a22Image setTag:(int) sender];
        }
        else if(self.tagSetter == 3){
            [self.a22Image setImage:[UIImage imageNamed:@"setOnePairThree"]];
            [self.a22Image setTag:(int) sender];
        }
        else if(self.tagSetter == 4){
            [self.a22Image setImage:[UIImage imageNamed:@"setOnePairFour"]];
            [self.a22Image setTag:(int) sender];
        }
        else if(self.tagSetter == 5){
            [self.a22Image setImage:[UIImage imageNamed:@"setOnePairFive"]];
            [self.a22Image setTag:(int) sender];
        }
        else if(self.tagSetter == 6){
            [self.a22Image setImage:[UIImage imageNamed:@"setOnePairSix"]];
            [self.a22Image setTag:(int) sender];
        }
        else if(self.tagSetter == 7){
            [self.a22Image setImage:[UIImage imageNamed:@"setOnePairSeven"]];
            [self.a22Image setTag:(int) sender];
        }
        else if(self.tagSetter == 8){
            [self.a22Image setImage:[UIImage imageNamed:@"setOnePairEight"]];
            [self.a22Image setTag:(int) sender];
        }
        
    }
    if([[self.flipRetentionData.sixteenPositionTiles objectAtIndex:self.flipRetentionData.randomTwo]  isEqual: @7]){
        NSLog(@" picture a23");
        if (self.tagSetter == 1){
            [self.a23Image setImage:[UIImage imageNamed:@"setOnePairOne"]];
            [self.a23Image setTag:(int) sender];
        }
        else if(self.tagSetter == 2){
            [self.a23Image setImage:[UIImage imageNamed:@"setOnePairTwo"]];
            [self.a23Image setTag:(int) sender];
        }
        else if(self.tagSetter == 3){
            [self.a23Image setImage:[UIImage imageNamed:@"setOnePairThree"]];
            [self.a23Image setTag:(int) sender];
        }
        else if(self.tagSetter == 4){
            [self.a23Image setImage:[UIImage imageNamed:@"setOnePairFour"]];
            [self.a23Image setTag:(int) sender];
        }
        else if(self.tagSetter == 5){
            [self.a23Image setImage:[UIImage imageNamed:@"setOnePairFive"]];
            [self.a23Image setTag:(int) sender];
        }
        else if(self.tagSetter == 6){
            [self.a23Image setImage:[UIImage imageNamed:@"setOnePairSix"]];
            [self.a23Image setTag:(int) sender];
        }
        else if(self.tagSetter == 7){
            [self.a23Image setImage:[UIImage imageNamed:@"setOnePairSeven"]];
            [self.a23Image setTag:(int) sender];
        }
        else if(self.tagSetter == 8){
            [self.a23Image setImage:[UIImage imageNamed:@"setOnePairEight"]];
            [self.a23Image setTag:(int) sender];
        }
        
    }
    if([[self.flipRetentionData.sixteenPositionTiles objectAtIndex:self.flipRetentionData.randomTwo]  isEqual: @8]){
        NSLog(@" picture a24");
        if (self.tagSetter == 1){
            [self.a24Image setImage:[UIImage imageNamed:@"setOnePairOne"]];
            [self.a24Image setTag:(int) sender];
        }
        else if(self.tagSetter == 2){
            [self.a24Image setImage:[UIImage imageNamed:@"setOnePairTwo"]];
            [self.a24Image setTag:(int) sender];
        }
        else if(self.tagSetter == 3){
            [self.a24Image setImage:[UIImage imageNamed:@"setOnePairThree"]];
            [self.a24Image setTag:(int) sender];
        }
        else if(self.tagSetter == 4){
            [self.a24Image setImage:[UIImage imageNamed:@"setOnePairFour"]];
            [self.a24Image setTag:(int) sender];
        }
        else if(self.tagSetter == 5){
            [self.a24Image setImage:[UIImage imageNamed:@"setOnePairFive"]];
            [self.a24Image setTag:(int) sender];
        }
        else if(self.tagSetter == 6){
            [self.a24Image setImage:[UIImage imageNamed:@"setOnePairSix"]];
            [self.a24Image setTag:(int) sender];
        }
        else if(self.tagSetter == 7){
            [self.a24Image setImage:[UIImage imageNamed:@"setOnePairSeven"]];
            [self.a24Image setTag:(int) sender];
        }
        else if(self.tagSetter == 8){
            [self.a24Image setImage:[UIImage imageNamed:@"setOnePairEight"]];
            [self.a24Image setTag:(int) sender];
        }
        
    }
    if([[self.flipRetentionData.sixteenPositionTiles objectAtIndex:self.flipRetentionData.randomTwo]  isEqual: @9]){
        NSLog(@" picture a31");
        if (self.tagSetter == 1){
            [self.a31Image setImage:[UIImage imageNamed:@"setOnePairOne"]];
            [self.a31Image setTag:(int) sender];
        }
        else if(self.tagSetter == 2){
            [self.a31Image setImage:[UIImage imageNamed:@"setOnePairTwo"]];
            [self.a31Image setTag:(int) sender];
        }
        else if(self.tagSetter == 3){
            [self.a31Image setImage:[UIImage imageNamed:@"setOnePairThree"]];
            [self.a31Image setTag:(int) sender];
        }
        else if(self.tagSetter == 4){
            [self.a31Image setImage:[UIImage imageNamed:@"setOnePairFour"]];
            [self.a31Image setTag:(int) sender];
        }
        else if(self.tagSetter == 5){
            [self.a31Image setImage:[UIImage imageNamed:@"setOnePairFive"]];
            [self.a31Image setTag:(int) sender];
        }
        else if(self.tagSetter == 6){
            [self.a31Image setImage:[UIImage imageNamed:@"setOnePairSix"]];
            [self.a31Image setTag:(int) sender];
        }
        else if(self.tagSetter == 7){
            [self.a31Image setImage:[UIImage imageNamed:@"setOnePairSeven"]];
            [self.a31Image setTag:(int) sender];
        }
        else if(self.tagSetter == 8){
            [self.a31Image setImage:[UIImage imageNamed:@"setOnePairEight"]];
            [self.a31Image setTag:(int) sender];
        }
        
    }
    if([[self.flipRetentionData.sixteenPositionTiles objectAtIndex:self.flipRetentionData.randomTwo]  isEqual: @10]){
        NSLog(@" picture a32");
        if (self.tagSetter == 1){
            [self.a32Image setImage:[UIImage imageNamed:@"setOnePairOne"]];
            [self.a32Image setTag:(int) sender];
        }
        else if(self.tagSetter == 2){
            [self.a32Image setImage:[UIImage imageNamed:@"setOnePairTwo"]];
            [self.a32Image setTag:(int) sender];
        }
        else if(self.tagSetter== 3){
            [self.a32Image setImage:[UIImage imageNamed:@"setOnePairThree"]];
            [self.a32Image setTag:(int) sender];
        }
        else if(self.tagSetter == 4){
            [self.a32Image setImage:[UIImage imageNamed:@"setOnePairFour"]];
            [self.a32Image setTag:(int) sender];
        }
        else if(self.tagSetter == 5){
            [self.a32Image setImage:[UIImage imageNamed:@"setOnePairFive"]];
            [self.a32Image setTag:(int) sender];
        }
        else if(self.tagSetter == 6){
            [self.a32Image setImage:[UIImage imageNamed:@"setOnePairSix"]];
            [self.a32Image setTag:(int) sender];
        }
        else if(self.tagSetter == 7){
            [self.a32Image setImage:[UIImage imageNamed:@"setOnePairSeven"]];
            [self.a32Image setTag:(int) sender];
        }
        else if(self.tagSetter == 8){
            [self.a32Image setImage:[UIImage imageNamed:@"setOnePairEight"]];
            [self.a32Image setTag:(int) sender];
        }
        
    }
    if([[self.flipRetentionData.sixteenPositionTiles objectAtIndex:self.flipRetentionData.randomTwo]  isEqual: @11]){
        NSLog(@" picture a33");
        if (self.tagSetter == 1){
            [self.a33Image setImage:[UIImage imageNamed:@"setOnePairOne"]];
            [self.a33Image setTag:(int) sender];
        }
        else if(self.tagSetter == 2){
            [self.a33Image setImage:[UIImage imageNamed:@"setOnePairTwo"]];
            [self.a33Image setTag:(int) sender];
        }
        else if(self.tagSetter == 3){
            [self.a33Image setImage:[UIImage imageNamed:@"setOnePairThree"]];
            [self.a33Image setTag:(int) sender];
        }
        else if(self.tagSetter == 4){
            [self.a33Image setImage:[UIImage imageNamed:@"setOnePairFour"]];
            [self.a33Image setTag:(int) sender];
        }
        else if(self.tagSetter == 5){
            [self.a33Image setImage:[UIImage imageNamed:@"setOnePairFive"]];
            [self.a33Image setTag:(int) sender];
        }
        else if(self.tagSetter == 6){
            [self.a33Image setImage:[UIImage imageNamed:@"setOnePairSix"]];
            [self.a33Image setTag:(int) sender];
        }
        else if(self.tagSetter == 7){
            [self.a33Image setImage:[UIImage imageNamed:@"setOnePairSeven"]];
            [self.a33Image setTag:(int) sender];
        }
        else if(self.tagSetter == 8){
            [self.a33Image setImage:[UIImage imageNamed:@"setOnePairEight"]];
            [self.a33Image setTag:(int) sender];
        }
        
    }
    if([[self.flipRetentionData.sixteenPositionTiles objectAtIndex:self.flipRetentionData.randomTwo]  isEqual: @12]){
        NSLog(@" picture a34");
        if (self.tagSetter == 1){
            [self.a34Image setImage:[UIImage imageNamed:@"setOnePairOne"]];
            [self.a34Image setTag:(int) sender];
        }
        else if(self.tagSetter == 2){
            [self.a34Image setImage:[UIImage imageNamed:@"setOnePairTwo"]];
            [self.a34Image setTag:(int) sender];
        }
        else if(self.tagSetter == 3){
            [self.a34Image setImage:[UIImage imageNamed:@"setOnePairThree"]];
            [self.a34Image setTag:(int) sender];
        }
        else if(self.tagSetter == 4){
            [self.a34Image setImage:[UIImage imageNamed:@"setOnePairFour"]];
            [self.a34Image setTag:(int) sender];
        }
        else if(self.tagSetter == 5){
            [self.a34Image setImage:[UIImage imageNamed:@"setOnePairFive"]];
            [self.a34Image setTag:(int) sender];
        }
        else if(self.tagSetter == 6){
            [self.a34Image setImage:[UIImage imageNamed:@"setOnePairSix"]];
            [self.a34Image setTag:(int) sender];
        }
        else if(self.tagSetter == 7){
            [self.a34Image setImage:[UIImage imageNamed:@"setOnePairSeven"]];
            [self.a34Image setTag:(int) sender];
        }
        else if(self.tagSetter == 8){
            [self.a34Image setImage:[UIImage imageNamed:@"setOnePairEight"]];
            [self.a34Image setTag:(int) sender];
        }
        
    }
    if([[self.flipRetentionData.sixteenPositionTiles objectAtIndex:self.flipRetentionData.randomTwo]  isEqual: @13]){
        NSLog(@" picture a41");
        if (self.tagSetter == 1){
            [self.a41Image setImage:[UIImage imageNamed:@"setOnePairOne"]];
            [self.a41Image setTag:(int) sender];
        }
        else if(self.tagSetter == 2){
            [self.a41Image setImage:[UIImage imageNamed:@"setOnePairTwo"]];
            [self.a41Image setTag:(int) sender];
        }
        else if(self.tagSetter== 3){
            [self.a41Image setImage:[UIImage imageNamed:@"setOnePairThree"]];
            [self.a41Image setTag:(int) sender];
        }
        else if(self.tagSetter == 4){
            [self.a41Image setImage:[UIImage imageNamed:@"setOnePairFour"]];
            [self.a41Image setTag:(int) sender];
        }
        else if(self.tagSetter == 5){
            [self.a41Image setImage:[UIImage imageNamed:@"setOnePairFive"]];
            [self.a41Image setTag:(int) sender];
        }
        else if(self.tagSetter == 6){
            [self.a41Image setImage:[UIImage imageNamed:@"setOnePairSix"]];
            [self.a41Image setTag:(int) sender];
        }
        else if(self.tagSetter == 7){
            [self.a41Image setImage:[UIImage imageNamed:@"setOnePairSeven"]];
            [self.a41Image setTag:(int) sender];
        }
        else if(self.tagSetter == 8){
            [self.a41Image setImage:[UIImage imageNamed:@"setOnePairEight"]];
            [self.a41Image setTag:(int) sender];
        }
        
    }
    if([[self.flipRetentionData.sixteenPositionTiles objectAtIndex:self.flipRetentionData.randomTwo]  isEqual: @14]){
        NSLog(@" picture a42");
        if (self.tagSetter == 1){
            [self.a42Image setImage:[UIImage imageNamed:@"setOnePairOne"]];
            [self.a42Image setTag:(int) sender];
        }
        else if(self.tagSetter == 2){
            [self.a42Image setImage:[UIImage imageNamed:@"setOnePairTwo"]];
            [self.a42Image setTag:(int) sender];
        }
        else if(self.tagSetter == 3){
            [self.a42Image setImage:[UIImage imageNamed:@"setOnePairThree"]];
            [self.a42Image setTag:(int) sender];
        }
        else if(self.tagSetter== 4){
            [self.a42Image setImage:[UIImage imageNamed:@"setOnePairFour"]];
            [self.a42Image setTag:(int) sender];
        }
        else if(self.tagSetter == 5){
            [self.a42Image setImage:[UIImage imageNamed:@"setOnePairFive"]];
            [self.a42Image setTag:(int) sender];
        }
        else if(self.tagSetter == 6){
            [self.a42Image setImage:[UIImage imageNamed:@"setOnePairSix"]];
            [self.a42Image setTag:(int) sender];
        }
        else if(self.tagSetter == 7){
            [self.a42Image setImage:[UIImage imageNamed:@"setOnePairSeven"]];
            [self.a42Image setTag:(int) sender];
        }
        else if(self.tagSetter == 8){
            [self.a42Image setImage:[UIImage imageNamed:@"setOnePairEight"]];
            [self.a42Image setTag:(int) sender];
        }
        
    }
    if([[self.flipRetentionData.sixteenPositionTiles objectAtIndex:self.flipRetentionData.randomTwo]  isEqual: @15]){
        NSLog(@" picture a43");
        if (self.tagSetter == 1){
            [self.a43Image setImage:[UIImage imageNamed:@"setOnePairOne"]];
            [self.a43Image setTag:(int) sender];
        }
        else if(self.tagSetter == 2){
            [self.a43Image setImage:[UIImage imageNamed:@"setOnePairTwo"]];
            [self.a43Image setTag:(int) sender];
        }
        else if(self.tagSetter == 3){
            [self.a43Image setImage:[UIImage imageNamed:@"setOnePairThree"]];
            [self.a43Image setTag:(int) sender];
        }
        else if(self.tagSetter == 4){
            [self.a43Image setImage:[UIImage imageNamed:@"setOnePairFour"]];
            [self.a43Image setTag:(int) sender];
        }
        else if(self.tagSetter == 5){
            [self.a43Image setImage:[UIImage imageNamed:@"setOnePairFive"]];
            [self.a43Image setTag:(int) sender];
        }
        else if(self.tagSetter == 6){
            [self.a43Image setImage:[UIImage imageNamed:@"setOnePairSix"]];
            [self.a43Image setTag:(int) sender];
        }
        else if(self.tagSetter == 7){
            [self.a43Image setImage:[UIImage imageNamed:@"setOnePairSeven"]];
            [self.a43Image setTag:(int) sender];
        }
        else if(self.tagSetter == 8){
            [self.a43Image setImage:[UIImage imageNamed:@"setOnePairEight"]];
            [self.a43Image setTag:(int) sender];
        }
        
    }
    if([[self.flipRetentionData.sixteenPositionTiles objectAtIndex:self.flipRetentionData.randomTwo]  isEqual: @16]){
        NSLog(@" picture a44");
        if (self.tagSetter == 1){
            [self.a44Image setImage:[UIImage imageNamed:@"setOnePairOne"]];
            [self.a44Image setTag:(int) sender];
        }
        else if(self.tagSetter == 2){
            [self.a44Image setImage:[UIImage imageNamed:@"setOnePairTwo"]];
            [self.a44Image setTag:(int) sender];
        }
        else if(self.tagSetter == 3){
            [self.a44Image setImage:[UIImage imageNamed:@"setOnePairThree"]];
            [self.a44Image setTag:(int) sender];
        }
        else if(self.tagSetter == 4){
            [self.a44Image setImage:[UIImage imageNamed:@"setOnePairFour"]];
            [self.a44Image setTag:(int) sender];
        }
        else if(self.tagSetter == 5){
            [self.a44Image setImage:[UIImage imageNamed:@"setOnePairFive"]];
            [self.a44Image setTag:(int) sender];
        }
        else if(self.tagSetter == 6){
            [self.a44Image setImage:[UIImage imageNamed:@"setOnePairSix"]];
            [self.a44Image setTag:(int) sender];
        }
        else if(self.tagSetter == 7){
            [self.a44Image setImage:[UIImage imageNamed:@"setOnePairSeven"]];
            [self.a44Image setTag:(int) sender];
        }
        else if(self.tagSetter == 8){
            [self.a44Image setImage:[UIImage imageNamed:@"setOnePairEight"]];
            [self.a44Image setTag:(int) sender];
        }
        
    }
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
