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
    [self quickreset];
    self.scoreLabel.text = @"yolo";
    self.scoreLabel.text = [NSString stringWithFormat:@"Score : %d",self.flipRetentionData.currentScore];
    
    
    self.flipRetentionData = [[FlipRetentionData alloc] init];
    [self generateRandomImages];
    [self.a11Image setUserInteractionEnabled:YES];
    UITapGestureRecognizer *a11Tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(a11Tapped)];
    [a11Tapped setNumberOfTapsRequired:1];
    [self.a11Image addGestureRecognizer:a11Tapped];
    [self.a12Image setUserInteractionEnabled:YES];
    UITapGestureRecognizer *a12Tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(a12Tapped)];
    [a12Tapped setNumberOfTapsRequired:1];
    [self.a12Image addGestureRecognizer:a12Tapped];
    [self.a13Image setUserInteractionEnabled:YES];
    UITapGestureRecognizer *a13Tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(a13Tapped)];
    [a13Tapped setNumberOfTapsRequired:1];
    [self.a13Image addGestureRecognizer:a13Tapped];
    [self.a14Image setUserInteractionEnabled:YES];
    UITapGestureRecognizer *a14Tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(a14Tapped)];
    [a14Tapped setNumberOfTapsRequired:1];
    [self.a14Image addGestureRecognizer:a14Tapped];
    
    [self.a21Image setUserInteractionEnabled:YES];
    UITapGestureRecognizer *a21Tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(a21Tapped)];
    [a21Tapped setNumberOfTapsRequired:1];
    [self.a21Image addGestureRecognizer:a21Tapped];
    [self.a22Image setUserInteractionEnabled:YES];
    UITapGestureRecognizer *a22Tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(a22Tapped)];
    [a22Tapped setNumberOfTapsRequired:1];
    [self.a22Image addGestureRecognizer:a22Tapped];
    [self.a23Image setUserInteractionEnabled:YES];
    UITapGestureRecognizer *a23Tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(a23Tapped)];
    [a23Tapped setNumberOfTapsRequired:1];
    [self.a23Image addGestureRecognizer:a23Tapped];
    [self.a24Image setUserInteractionEnabled:YES];
    UITapGestureRecognizer *a24Tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(a24Tapped)];
    [a24Tapped setNumberOfTapsRequired:1];
    [self.a24Image addGestureRecognizer:a24Tapped];
    
    [self.a31Image setUserInteractionEnabled:YES];
    UITapGestureRecognizer *a31Tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(a31Tapped)];
    [a31Tapped setNumberOfTapsRequired:1];
    [self.a31Image addGestureRecognizer:a31Tapped];
    [self.a32Image setUserInteractionEnabled:YES];
    UITapGestureRecognizer *a32Tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(a32Tapped)];
    [a32Tapped setNumberOfTapsRequired:1];
    [self.a32Image addGestureRecognizer:a32Tapped];
    [self.a33Image setUserInteractionEnabled:YES];
    UITapGestureRecognizer *a33Tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(a33Tapped)];
    [a33Tapped setNumberOfTapsRequired:1];
    [self.a33Image addGestureRecognizer:a33Tapped];
    [self.a34Image setUserInteractionEnabled:YES];
    UITapGestureRecognizer *a34Tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(a34Tapped)];
    [a34Tapped setNumberOfTapsRequired:1];
    [self.a34Image addGestureRecognizer:a34Tapped];
    
    [self.a41Image setUserInteractionEnabled:YES];
    UITapGestureRecognizer *a41Tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(a41Tapped)];
    [a41Tapped setNumberOfTapsRequired:1];
    [self.a41Image addGestureRecognizer:a41Tapped];
    [self.a42Image setUserInteractionEnabled:YES];
    UITapGestureRecognizer *a42Tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(a42Tapped)];
    [a42Tapped setNumberOfTapsRequired:1];
    [self.a42Image addGestureRecognizer:a42Tapped];
    [self.a43Image setUserInteractionEnabled:YES];
    UITapGestureRecognizer *a43Tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(a43Tapped)];
    [a43Tapped setNumberOfTapsRequired:1];
    [self.a43Image addGestureRecognizer:a43Tapped];
    [self.a44Image setUserInteractionEnabled:YES];
    UITapGestureRecognizer *a44Tapped = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(a44Tapped)];
    [a44Tapped setNumberOfTapsRequired:1];
    [self.a44Image addGestureRecognizer:a44Tapped];
    
    [self.a11Cover setImage:[UIImage imageNamed:@"coverImage"]];
    [self.a12Cover setImage:[UIImage imageNamed:@"coverImage"]];
    [self.a13Cover setImage:[UIImage imageNamed:@"coverImage"]];
    [self.a14Cover setImage:[UIImage imageNamed:@"coverImage"]];
    [self.a21Cover setImage:[UIImage imageNamed:@"coverImage"]];
    [self.a22Cover setImage:[UIImage imageNamed:@"coverImage"]];
    [self.a23Cover setImage:[UIImage imageNamed:@"coverImage"]];
    [self.a24Cover setImage:[UIImage imageNamed:@"coverImage"]];
    [self.a31Cover setImage:[UIImage imageNamed:@"coverImage"]];
    [self.a32Cover setImage:[UIImage imageNamed:@"coverImage"]];
    [self.a33Cover setImage:[UIImage imageNamed:@"coverImage"]];
    [self.a34Cover setImage:[UIImage imageNamed:@"coverImage"]];
    [self.a41Cover setImage:[UIImage imageNamed:@"coverImage"]];
    [self.a42Cover setImage:[UIImage imageNamed:@"coverImage"]];
    [self.a43Cover setImage:[UIImage imageNamed:@"coverImage"]];
    [self.a44Cover setImage:[UIImage imageNamed:@"coverImage"]];
    
    NSLog(@"a11 tag is %ld", (long)self.a11Image.tag);
    //self.pairChecker =self.a11Image.tag;
    NSLog(@"check tag correct: %d", self.pairChecker);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//-(void)bigReset{
    
//}
-(void)quickreset{
    self.userCounter = 0;
    self.firstInput = 0;
}
-(void)reenablePairImage{
    NSLog(@"reenablePairImage working");
    if(self.firstInput == 1){
        self.a11Cover.hidden = NO;
        [self.a11Image setUserInteractionEnabled:YES];
    }
    else if (self.firstInput == 2){
        self.a12Cover.hidden = NO;
        [self.a12Image setUserInteractionEnabled:YES];
        
    }
    else if (self.firstInput == 3){
        self.a13Cover.hidden = NO;
        [self.a13Image setUserInteractionEnabled:YES];
        
    }
    else if (self.firstInput == 4){
        self.a14Cover.hidden = NO;
        [self.a14Image setUserInteractionEnabled:YES];
        
    }
    else if (self.firstInput == 5){
        self.a21Cover.hidden = NO;
        [self.a21Image setUserInteractionEnabled:YES];
        
    }
    else if (self.firstInput == 6){
        self.a22Cover.hidden = NO;
        [self.a22Image setUserInteractionEnabled:YES];
        
    }
    else if (self.firstInput == 7){
        self.a23Cover.hidden = NO;
        [self.a23Image setUserInteractionEnabled:YES];
        
    }
    else if (self.firstInput == 8){
        self.a24Cover.hidden = NO;
        [self.a24Image setUserInteractionEnabled:YES];
        
    }
    else if (self.firstInput == 9){
        self.a31Cover.hidden = NO;
        [self.a31Image setUserInteractionEnabled:YES];
        
    }
    else if (self.firstInput == 10){
        self.a32Cover.hidden = NO;
        [self.a32Image setUserInteractionEnabled:YES];
        
    }
    else if (self.firstInput == 11){
        self.a33Cover.hidden = NO;
        [self.a33Image setUserInteractionEnabled:YES];
        
    }
    else if (self.firstInput == 12){
        self.a34Cover.hidden = NO;
        [self.a34Image setUserInteractionEnabled:YES];
        
    }
    else if (self.firstInput == 13){
        self.a41Cover.hidden = NO;
        [self.a41Image setUserInteractionEnabled:YES];
        
    }
    else if (self.firstInput == 14){
        self.a42Cover.hidden = NO;
        [self.a42Image setUserInteractionEnabled:YES];
        
    }
    else if (self.firstInput == 15){
        self.a43Cover.hidden = NO;
        [self.a43Image setUserInteractionEnabled:YES];
        
    }
    else if (self.firstInput == 16){
        self.a44Cover.hidden = NO;
        [self.a44Image setUserInteractionEnabled:YES];
        
    }
}
-(void)hidePairImage{
    NSLog(@"hide Pair Image is working");
    if(self.firstInput == 1){
        self.a11Image.hidden = YES;
        [self.a11Image setUserInteractionEnabled:NO];
    }
    else if (self.firstInput == 2){
        self.a12Image.hidden = YES;
        [self.a12Image setUserInteractionEnabled:NO];
        
    }
    else if (self.firstInput == 3){
        self.a13Image.hidden = YES;
        [self.a13Image setUserInteractionEnabled:NO];
        
    }
    else if (self.firstInput == 4){
        self.a14Image.hidden = YES;
        [self.a14Image setUserInteractionEnabled:NO];
        
    }
    else if (self.firstInput == 5){
        self.a21Image.hidden = YES;
        [self.a21Image setUserInteractionEnabled:NO];
        
    }
    else if (self.firstInput == 6){
        self.a22Image.hidden = YES;
        [self.a21Image setUserInteractionEnabled:NO];
        
    }
    else if (self.firstInput == 7){
        self.a23Image.hidden = YES;
        [self.a23Image setUserInteractionEnabled:NO];
        
    }
    else if (self.firstInput == 8){
        self.a24Image.hidden = YES;
        [self.a24Image setUserInteractionEnabled:NO];
        
    }
    else if (self.firstInput == 9){
        self.a31Image.hidden = YES;
        [self.a31Image setUserInteractionEnabled:NO];
        
    }
    else if (self.firstInput == 10){
        self.a32Image.hidden = YES;
        [self.a32Image setUserInteractionEnabled:NO];
        
    }
    else if (self.firstInput == 11){
        self.a33Image.hidden = YES;
        [self.a33Image setUserInteractionEnabled:NO];
        
    }
    else if (self.firstInput == 12){
        self.a34Image.hidden = YES;
        [self.a34Image setUserInteractionEnabled:NO];
        
    }
    else if (self.firstInput == 13){
        self.a41Image.hidden = YES;
        [self.a41Image setUserInteractionEnabled:NO];
        
    }
    else if (self.firstInput == 14){
        self.a42Image.hidden = YES;
        [self.a42Image setUserInteractionEnabled:NO];
        
    }
    else if (self.firstInput == 15){
        self.a43Image.hidden = YES;
        [self.a43Image setUserInteractionEnabled:NO];
        
    }
    else if (self.firstInput == 16){
        self.a44Image.hidden = YES;
        [self.a44Image setUserInteractionEnabled:NO];
        
    }
}
-(void)CorrectMatch{
    [self.flipRetentionData correctAnswer];
    self.scoreLabel.text = [NSString stringWithFormat:@"Score : %d", self.flipRetentionData.currentScore];
    [self hidePairImage];
    [self quickreset];
}
-(void)incorrectMatch{
    [self.flipRetentionData wrongAnswer];  // Subtract Points
    [self reenablePairImage];
    [self quickreset];
    self.scoreLabel.text = [NSString stringWithFormat:@"Score : %d", self.flipRetentionData.currentScore];
    [self.view setUserInteractionEnabled:NO];
}
-(void)a11Delay{
    self.a11Cover.hidden = NO;
    [self.view setUserInteractionEnabled:YES];
}
-(void)a12Delay{
    self.a12Cover.hidden = NO;
    [self.view setUserInteractionEnabled:YES];
}
-(void)a13Delay{
    self.a13Cover.hidden = NO;
    [self.view setUserInteractionEnabled:YES];
}
-(void)a14Delay{
    self.a14Cover.hidden = NO;
    [self.view setUserInteractionEnabled:YES];
}
-(void)a21Delay{
    self.a21Cover.hidden = NO;
    [self.view setUserInteractionEnabled:YES];
}
-(void)a22Delay{
    self.a22Cover.hidden = NO;
    [self.view setUserInteractionEnabled:YES];
}
-(void)a23Delay{
    self.a23Cover.hidden = NO;
    [self.view setUserInteractionEnabled:YES];
}
-(void)a24Delay{
    self.a24Cover.hidden = NO;
    [self.view setUserInteractionEnabled:YES];
}
-(void)a31Delay{
    self.a31Cover.hidden = NO;
    [self.view setUserInteractionEnabled:YES];
}
-(void)a32Delay{
    self.a32Cover.hidden = NO;
    [self.view setUserInteractionEnabled:YES];
}
-(void)a33Delay{
    self.a33Cover.hidden = NO;
    [self.view setUserInteractionEnabled:YES];
}
-(void)a34Delay{
    self.a34Cover.hidden = NO;
    [self.view setUserInteractionEnabled:YES];
}
-(void)a41Delay{
    self.a41Cover.hidden = NO;
    [self.view setUserInteractionEnabled:YES];
}
-(void)a42Delay{
    self.a42Cover.hidden = NO;
    [self.view setUserInteractionEnabled:YES];
}
-(void)a43Delay{
    self.a43Cover.hidden = NO;
    [self.view setUserInteractionEnabled:YES];
}
-(void)a44Delay{
    self.a44Cover.hidden = NO;
    [self.view setUserInteractionEnabled:YES];
}

-(void)a11Tapped{
    NSLog(@"a11 Tapped");
    self.a11Cover.hidden = YES;
    if(self.userCounter == 0){
        self.pairChecker = self.a11Image.tag;
        NSLog(@"pair checker is: %d",self.pairChecker);
        self.userCounter ++;
        self.firstInput = 1;
        [self.a11Image setUserInteractionEnabled:NO];
    }
    else{
        if ( self.a11Image.tag == self.pairChecker){
            NSLog(@"detected second tap");// If the second tile is a match
            NSLog(@"firstInput was : %d", self.firstInput);
            [self CorrectMatch];
            self.a11Cover.hidden = YES;
            self.a11Image.hidden = YES;
            [self.a11Image setUserInteractionEnabled:NO];
        }
        else {
            NSLog(@"detected second tap");
            NSLog(@"firstInput was : %d", self.firstInput);
            [self incorrectMatch];
            [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(a11Delay) userInfo:nil repeats:NO];
            
        }
        
    }
    
}

-(void)a12Tapped{
    NSLog(@"a12 Tapped");
    self.a12Cover.hidden = YES;
    if(self.userCounter == 0){
        self.pairChecker = self.a12Image.tag;
        self.userCounter ++;
        self.firstInput = 2;
        [self.a12Image setUserInteractionEnabled:NO];
    }
    else{
        if ( self.a12Image.tag == self.pairChecker){  // If the second tile is a match
            [self CorrectMatch];
            self.a12Cover.hidden = YES;
            self.a12Image.hidden = YES;
            [self.a12Image setUserInteractionEnabled:NO];
        }
        else {
            [self incorrectMatch];
            [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(a12Delay) userInfo:nil repeats:NO];
        }
        
    }
}
-(void)a13Tapped{
    self.a13Cover.hidden = YES;
    if(self.userCounter == 0){
        self.pairChecker = self.a12Image.tag;
        self.userCounter ++;
        self.firstInput = 3;
        [self.a13Image setUserInteractionEnabled:NO];
    }
    else{
        if ( self.a13Image.tag == self.pairChecker){  // If the second tile is a match
            [self CorrectMatch];
            self.a13Cover.hidden = YES;
            self.a13Image.hidden = YES;
            [self.a13Image setUserInteractionEnabled:NO];
            
        }
        else {
            [self incorrectMatch];
            [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(a13Delay) userInfo:nil repeats:NO];
            
            
        }
        
    }
}
-(void)a14Tapped{
    self.a14Cover.hidden = YES;
    if(self.userCounter == 0){
        self.pairChecker = self.a14Image.tag;
        self.userCounter ++;
        self.firstInput = 4;
        [self.a14Image setUserInteractionEnabled:NO];
    }
    else{
        if ( self.a14Image.tag == self.pairChecker){  // If the second tile is a match
            [self CorrectMatch];
            self.a14Cover.hidden = YES;
            self.a14Image.hidden = YES;
            [self.a14Image setUserInteractionEnabled:NO];
        }
        else {
            [self incorrectMatch];
            [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(a14Delay) userInfo:nil repeats:NO];
            
        }
        
    }
}
-(void)a21Tapped{
    self.a21Cover.hidden = YES;
    if(self.userCounter == 0){
        self.pairChecker = self.a21Image.tag;
        self.userCounter ++;
        self.firstInput = 5;
        [self.a11Image setUserInteractionEnabled:NO];
    }
    else{
        if ( self.a21Image.tag == self.pairChecker){  // If the second tile is a match
            [self CorrectMatch];
            self.a21Cover.hidden = YES;
            self.a21Image.hidden = YES;
            [self.a21Image setUserInteractionEnabled:NO];
            
        }
        else {
            [self incorrectMatch];
            [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(a21Delay) userInfo:nil repeats:NO];
            
        }
        
    }
}
-(void)a22Tapped{
    self.a22Cover.hidden = YES;
    if(self.userCounter == 0){
        self.pairChecker = self.a22Image.tag;
        self.userCounter ++;
        self.firstInput = 6;
        [self.a22Image setUserInteractionEnabled:NO];
    }
    else{
        if ( self.a22Image.tag == self.pairChecker){  // If the second tile is a match
            [self CorrectMatch];
            self.a22Cover.hidden = YES;
            self.a22Image.hidden = YES;
            [self.a22Image setUserInteractionEnabled:NO];
            
        }
        else {
            [self incorrectMatch];
            [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(a22Delay) userInfo:nil repeats:NO];
            
        }
        
    }
}
-(void)a23Tapped{
    self.a23Cover.hidden = YES;
    if(self.userCounter == 0){
        self.pairChecker = self.a23Image.tag;
        self.userCounter ++;
        self.firstInput = 7;
        [self.a23Image setUserInteractionEnabled:NO];
    }
    else{
        if ( self.a23Image.tag == self.pairChecker){  // If the second tile is a match
            [self CorrectMatch];
            self.a23Cover.hidden = YES;
            self.a23Image.hidden = YES;
            [self.a23Image setUserInteractionEnabled:NO];
            
        }
        else {
            [self incorrectMatch];
            [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(a23Delay) userInfo:nil repeats:NO];
            
        }
        
    }
}
-(void)a24Tapped{
    self.a24Cover.hidden = YES;
    if(self.userCounter == 0){
        self.pairChecker = self.a24Image.tag;
        self.userCounter ++;
        self.firstInput = 8;
        [self.a24Image setUserInteractionEnabled:NO];
    }
    else{
        if ( self.a24Image.tag == self.pairChecker){  // If the second tile is a match
            [self CorrectMatch];
            self.a24Cover.hidden = YES;
            self.a24Image.hidden = YES;
            [self.a24Image setUserInteractionEnabled:NO];
            
        }
        else {
            [self incorrectMatch];
            [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(a24Delay) userInfo:nil repeats:NO];
            
        }
        
    }
}
-(void)a31Tapped{
    self.a31Cover.hidden = YES;
    if(self.userCounter == 0){
        self.pairChecker = self.a31Image.tag;
        self.userCounter ++;
        self.firstInput = 9;
        [self.a31Image setUserInteractionEnabled:NO];
    }
    else{
        if ( self.a31Image.tag == self.pairChecker){  // If the second tile is a match
            [self CorrectMatch];
            self.a31Cover.hidden = YES;
            self.a31Image.hidden = YES;
            [self.a31Image setUserInteractionEnabled:NO];
        }
        else {
            [self incorrectMatch];
            [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(a31Delay) userInfo:nil repeats:NO];
            
        }
        
    }
}
-(void)a32Tapped{
    self.a32Cover.hidden = YES;
    if(self.userCounter == 0){
        self.pairChecker = self.a32Image.tag;
        self.userCounter ++;
        self.firstInput = 10;
        [self.a32Image setUserInteractionEnabled:NO];
    }
    else{
        if ( self.a32Image.tag == self.pairChecker){  // If the second tile is a match
            [self CorrectMatch];
            self.a32Cover.hidden = YES;
            self.a32Image.hidden = YES;
            [self.a32Image setUserInteractionEnabled:NO];
            
        }
        else {
            [self incorrectMatch];
            [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(a32Delay) userInfo:nil repeats:NO];
            
        }
        
    }
}
-(void)a33Tapped{
    self.a33Cover.hidden = YES;
    if(self.userCounter == 0){
        self.pairChecker = self.a33Image.tag;
        self.userCounter ++;
        self.firstInput = 11;
        [self.a33Image setUserInteractionEnabled:NO];
    }
    else{
        if ( self.a33Image.tag == self.pairChecker){  // If the second tile is a match
            [self CorrectMatch];
            self.a33Cover.hidden = YES;
            self.a33Image.hidden = YES;
            [self.a33Image setUserInteractionEnabled:NO];
            
        }
        else {
            [self incorrectMatch];
            [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(a33Delay) userInfo:nil repeats:NO];
            
        }
        
    }
}
-(void)a34Tapped{
    self.a34Cover.hidden = YES;
    if(self.userCounter == 0){
        self.pairChecker = self.a34Image.tag;
        self.userCounter ++;
        self.firstInput = 12;
        [self.a34Image setUserInteractionEnabled:NO];
    }
    else{
        if ( self.a34Image.tag == self.pairChecker){  // If the second tile is a match
            [self CorrectMatch];
            self.a34Cover.hidden = YES;
            self.a34Image.hidden = YES;
            [self.a34Image setUserInteractionEnabled:NO];
            
        }
        else {
            [self incorrectMatch];
            [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(a34Delay) userInfo:nil repeats:NO];
            
        }
        
    }
}
-(void)a41Tapped{
    self.a41Cover.hidden = YES;
    if(self.userCounter == 0){
        self.pairChecker = self.a41Image.tag;
        self.userCounter ++;
        self.firstInput = 13;
        [self.a41Image setUserInteractionEnabled:NO];
    }
    else{
        if ( self.a41Image.tag == self.pairChecker){  // If the second tile is a match
            [self CorrectMatch];
            self.a41Cover.hidden = YES;
            self.a41Image.hidden = YES;
            [self.a41Image setUserInteractionEnabled:NO];
            
        }
        else {
            [self incorrectMatch];
            [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(a41Delay) userInfo:nil repeats:NO];
            
        }
        
    }
}
-(void)a42Tapped{
    self.a42Cover.hidden = YES;
    if(self.userCounter == 0){
        self.pairChecker = self.a42Image.tag;
        self.userCounter ++;
        self.firstInput = 14;
        [self.a42Image setUserInteractionEnabled:NO];
    }
    else{
        if ( self.a42Image.tag == self.pairChecker){  // If the second tile is a match
            [self CorrectMatch];
            self.a42Cover.hidden = YES;
            self.a42Image.hidden = YES;
            [self.a42Image setUserInteractionEnabled:NO];
            
        }
        else {
            [self incorrectMatch];
            [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(a42Delay) userInfo:nil repeats:NO];
            
        }
        
    }
}
-(void)a43Tapped{
    self.a43Cover.hidden = YES;
    if(self.userCounter == 0){
        self.pairChecker = self.a43Image.tag;
        self.userCounter ++;
        self.firstInput = 15;
        [self.a43Image setUserInteractionEnabled:NO];
    }
    else{
        if ( self.a43Image.tag == self.pairChecker){  // If the second tile is a match
            [self CorrectMatch];
            self.a43Cover.hidden = YES;
            self.a43Image.hidden = YES;
            [self.a43Image setUserInteractionEnabled:NO];
            
        }
        else {
            [self incorrectMatch];
            [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(a43Delay) userInfo:nil repeats:NO];
            
        }
        
    }
}
-(void)a44Tapped{
    self.a44Cover.hidden = YES;
    if(self.userCounter == 0){
        self.pairChecker = self.a44Image.tag;
        self.userCounter ++;
        self.firstInput = 16;
        [self.a44Image setUserInteractionEnabled:NO];
    }
    else{
        if ( self.a44Image.tag == self.pairChecker){  // If the second tile is a match
            [self CorrectMatch];
            self.a44Cover.hidden = YES;
            self.a44Image.hidden = YES;
            [self.a44Image setUserInteractionEnabled:NO];
            
        }
        else {
            [self incorrectMatch];
            [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(a44Delay) userInfo:nil repeats:NO];
            
        }
        
    }
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
            [self.a11Image setTag:1];
        }
        else if(self.tagSetter == 2){
            
            [self.a11Image setImage:[UIImage imageNamed:@"setOnePairTwo"]];
            [self.a11Image setTag:2];
        }
        else if(self.tagSetter == 3){

            [self.a11Image setImage:[UIImage imageNamed:@"setOnePairThree"]];
            [self.a11Image setTag:3];
        }
        else if(self.tagSetter == 4){
            [self.a11Image setImage:[UIImage imageNamed:@"setOnePairFour"]];
            [self.a11Image setTag:4];
        }
        else if(self.tagSetter == 5){
            [self.a11Image setImage:[UIImage imageNamed:@"setOnePairFive"]];
            [self.a11Image setTag:5];
        }
        else if(self.tagSetter == 6){
            [self.a11Image setImage:[UIImage imageNamed:@"setOnePairSix"]];
            [self.a11Image setTag:6];
        }
        else if(self.tagSetter == 7){
            [self.a11Image setImage:[UIImage imageNamed:@"setOnePairSeven"]];
            [self.a11Image setTag:7];
        }
        else if(self.tagSetter == 8){
            [self.a11Image setImage:[UIImage imageNamed:@"setOnePairEight"]];
            [self.a11Image setTag:8];
        }
        
    }
    if([[self.flipRetentionData.sixteenPositionTiles objectAtIndex:self.flipRetentionData.randomTwo]  isEqual: @2]){
        NSLog(@" picture a12");
        if (self.tagSetter == 1){
            [self.a12Image setImage:[UIImage imageNamed:@"setOnePairOne"]];
            [self.a12Image setTag:1];
        }
        else if(self.tagSetter == 2){
            [self.a12Image setImage:[UIImage imageNamed:@"setOnePairTwo"]];
            [self.a11Image setTag:2];
        }
        else if(self.tagSetter == 3){
            [self.a12Image setImage:[UIImage imageNamed:@"setOnePairThree"]];
            [self.a11Image setTag:3];
        }
        else if(self.tagSetter == 4){
            [self.a12Image setImage:[UIImage imageNamed:@"setOnePairFour"]];
            [self.a12Image setTag:4];
        }
        else if(self.tagSetter == 5){
            [self.a12Image setImage:[UIImage imageNamed:@"setOnePairFive"]];
            [self.a12Image setTag:5];
        }
        else if(self.tagSetter == 6){
            [self.a12Image setImage:[UIImage imageNamed:@"setOnePairSix"]];
            [self.a12Image setTag:6];
        }
        else if(self.tagSetter == 7){
            [self.a12Image setImage:[UIImage imageNamed:@"setOnePairSeven"]];
            [self.a12Image setTag:7];
        }
        else if(self.tagSetter == 8){
            [self.a12Image setImage:[UIImage imageNamed:@"setOnePairEight"]];
            [self.a12Image setTag:8];
        }
        
    }
    if([[self.flipRetentionData.sixteenPositionTiles objectAtIndex:self.flipRetentionData.randomTwo]  isEqual: @3]){
        NSLog(@" picture a13");
        if (self.tagSetter == 1){
            [self.a13Image setImage:[UIImage imageNamed:@"setOnePairOne"]];
            [self.a13Image setTag:1];
        }
        else if(self.tagSetter == 2){
            [self.a13Image setImage:[UIImage imageNamed:@"setOnePairTwo"]];
            [self.a13Image setTag:2];
        }
        else if(self.tagSetter == 3){
            [self.a13Image setImage:[UIImage imageNamed:@"setOnePairThree"]];
            [self.a13Image setTag:3];
        }
        else if(self.tagSetter == 4){
            [self.a13Image setImage:[UIImage imageNamed:@"setOnePairFour"]];
            [self.a13Image setTag:4];
        }
        else if(self.tagSetter == 5){
            [self.a13Image setImage:[UIImage imageNamed:@"setOnePairFive"]];
            [self.a13Image setTag:5];
        }
        else if(self.tagSetter == 6){
            [self.a13Image setImage:[UIImage imageNamed:@"setOnePairSix"]];
            [self.a13Image setTag:6];
        }
        else if(self.tagSetter == 7){
            [self.a13Image setImage:[UIImage imageNamed:@"setOnePairSeven"]];
            [self.a13Image setTag:7];
        }
        else if(self.tagSetter == 8){
            [self.a13Image setImage:[UIImage imageNamed:@"setOnePairEight"]];
            [self.a13Image setTag:8];
        }
        
    }
    if([[self.flipRetentionData.sixteenPositionTiles objectAtIndex:self.flipRetentionData.randomTwo]  isEqual: @4]){
        NSLog(@" picture a14");
        if (self.tagSetter == 1){
            [self.a14Image setImage:[UIImage imageNamed:@"setOnePairOne"]];
            [self.a14Image setTag:1];
        }
        else if(self.tagSetter == 2){
            [self.a14Image setImage:[UIImage imageNamed:@"setOnePairTwo"]];
            [self.a14Image setTag:2];
        }
        else if(self.tagSetter == 3){
            [self.a14Image setImage:[UIImage imageNamed:@"setOnePairThree"]];
            [self.a14Image setTag:3];
        }
        else if(self.tagSetter == 4){
            [self.a14Image setImage:[UIImage imageNamed:@"setOnePairFour"]];
            [self.a14Image setTag:4];
        }
        else if(self.tagSetter == 5){
            [self.a14Image setImage:[UIImage imageNamed:@"setOnePairFive"]];
            [self.a14Image setTag:5];
        }
        else if(self.tagSetter == 6){
            [self.a14Image setImage:[UIImage imageNamed:@"setOnePairSix"]];
            [self.a14Image setTag:6];
        }
        else if(self.tagSetter == 7){
            [self.a14Image setImage:[UIImage imageNamed:@"setOnePairSeven"]];
            [self.a14Image setTag:7];
        }
        else if(self.tagSetter == 8){
            [self.a14Image setImage:[UIImage imageNamed:@"setOnePairEight"]];
            [self.a14Image setTag:8];
        }
        
    }
    if([[self.flipRetentionData.sixteenPositionTiles objectAtIndex:self.flipRetentionData.randomTwo]  isEqual: @5]){
        NSLog(@" picture a21");
        if (self.tagSetter == 1){
            [self.a21Image setImage:[UIImage imageNamed:@"setOnePairOne"]];
            [self.a21Image setTag:1];
        }
        else if(self.tagSetter == 2){
            [self.a21Image setImage:[UIImage imageNamed:@"setOnePairTwo"]];
            [self.a21Image setTag:2];
        }
        else if(self.tagSetter == 3){
            [self.a21Image setImage:[UIImage imageNamed:@"setOnePairThree"]];
            [self.a21Image setTag:3];
        }
        else if(self.tagSetter == 4){
            [self.a21Image setImage:[UIImage imageNamed:@"setOnePairFour"]];
            [self.a21Image setTag:4];
        }
        else if(self.tagSetter == 5){
            [self.a21Image setImage:[UIImage imageNamed:@"setOnePairFive"]];
            [self.a21Image setTag:5];
        }
        else if(self.tagSetter == 6){
            [self.a21Image setImage:[UIImage imageNamed:@"setOnePairSix"]];
            [self.a21Image setTag:6];
        }
        else if(self.tagSetter == 7){
            [self.a21Image setImage:[UIImage imageNamed:@"setOnePairSeven"]];
            [self.a21Image setTag:7];
        }
        else if(self.tagSetter == 8){
            [self.a21Image setImage:[UIImage imageNamed:@"setOnePairEight"]];
            [self.a21Image setTag:8];
        }
        
    }
    if([[self.flipRetentionData.sixteenPositionTiles objectAtIndex:self.flipRetentionData.randomTwo]  isEqual: @6]){
        NSLog(@" picture a22");
        if (self.tagSetter == 1){
            [self.a22Image setImage:[UIImage imageNamed:@"setOnePairOne"]];
            [self.a22Image setTag:1];
        }
        else if(self.tagSetter == 2){
            [self.a22Image setImage:[UIImage imageNamed:@"setOnePairTwo"]];
            [self.a22Image setTag:2];
        }
        else if(self.tagSetter == 3){
            [self.a22Image setImage:[UIImage imageNamed:@"setOnePairThree"]];
            [self.a22Image setTag:3];
        }
        else if(self.tagSetter == 4){
            [self.a22Image setImage:[UIImage imageNamed:@"setOnePairFour"]];
            [self.a22Image setTag:4];
        }
        else if(self.tagSetter == 5){
            [self.a22Image setImage:[UIImage imageNamed:@"setOnePairFive"]];
            [self.a22Image setTag:5];
        }
        else if(self.tagSetter == 6){
            [self.a22Image setImage:[UIImage imageNamed:@"setOnePairSix"]];
            [self.a22Image setTag:6];
        }
        else if(self.tagSetter == 7){
            [self.a22Image setImage:[UIImage imageNamed:@"setOnePairSeven"]];
            [self.a22Image setTag:7];
        }
        else if(self.tagSetter == 8){
            [self.a22Image setImage:[UIImage imageNamed:@"setOnePairEight"]];
            [self.a22Image setTag:8];
        }
        
    }
    if([[self.flipRetentionData.sixteenPositionTiles objectAtIndex:self.flipRetentionData.randomTwo]  isEqual: @7]){
        NSLog(@" picture a23");
        if (self.tagSetter == 1){
            [self.a23Image setImage:[UIImage imageNamed:@"setOnePairOne"]];
            [self.a23Image setTag:1];
        }
        else if(self.tagSetter == 2){
            [self.a23Image setImage:[UIImage imageNamed:@"setOnePairTwo"]];
            [self.a23Image setTag:2];
        }
        else if(self.tagSetter == 3){
            [self.a23Image setImage:[UIImage imageNamed:@"setOnePairThree"]];
            [self.a23Image setTag:3];
        }
        else if(self.tagSetter == 4){
            [self.a23Image setImage:[UIImage imageNamed:@"setOnePairFour"]];
            [self.a23Image setTag:4];
        }
        else if(self.tagSetter == 5){
            [self.a23Image setImage:[UIImage imageNamed:@"setOnePairFive"]];
            [self.a23Image setTag:5];
        }
        else if(self.tagSetter == 6){
            [self.a23Image setImage:[UIImage imageNamed:@"setOnePairSix"]];
            [self.a23Image setTag:6];
        }
        else if(self.tagSetter == 7){
            [self.a23Image setImage:[UIImage imageNamed:@"setOnePairSeven"]];
            [self.a23Image setTag:7];
        }
        else if(self.tagSetter == 8){
            [self.a23Image setImage:[UIImage imageNamed:@"setOnePairEight"]];
            [self.a23Image setTag:8];
        }
        
    }
    if([[self.flipRetentionData.sixteenPositionTiles objectAtIndex:self.flipRetentionData.randomTwo]  isEqual: @8]){
        NSLog(@" picture a24");
        if (self.tagSetter == 1){
            [self.a24Image setImage:[UIImage imageNamed:@"setOnePairOne"]];
            [self.a24Image setTag:1];
        }
        else if(self.tagSetter == 2){
            [self.a24Image setImage:[UIImage imageNamed:@"setOnePairTwo"]];
            [self.a24Image setTag:2];
        }
        else if(self.tagSetter == 3){
            [self.a24Image setImage:[UIImage imageNamed:@"setOnePairThree"]];
            [self.a24Image setTag:3];
        }
        else if(self.tagSetter == 4){
            [self.a24Image setImage:[UIImage imageNamed:@"setOnePairFour"]];
            [self.a24Image setTag:4];
        }
        else if(self.tagSetter == 5){
            [self.a24Image setImage:[UIImage imageNamed:@"setOnePairFive"]];
            [self.a24Image setTag:5];
        }
        else if(self.tagSetter == 6){
            [self.a24Image setImage:[UIImage imageNamed:@"setOnePairSix"]];
            [self.a24Image setTag:6];
        }
        else if(self.tagSetter == 7){
            [self.a24Image setImage:[UIImage imageNamed:@"setOnePairSeven"]];
            [self.a24Image setTag:7];
        }
        else if(self.tagSetter == 8){
            [self.a24Image setImage:[UIImage imageNamed:@"setOnePairEight"]];
            [self.a24Image setTag:8];
        }
        
    }
    if([[self.flipRetentionData.sixteenPositionTiles objectAtIndex:self.flipRetentionData.randomTwo]  isEqual: @9]){
        NSLog(@" picture a31");
        if (self.tagSetter == 1){
            [self.a31Image setImage:[UIImage imageNamed:@"setOnePairOne"]];
            [self.a31Image setTag:1];
        }
        else if(self.tagSetter == 2){
            [self.a31Image setImage:[UIImage imageNamed:@"setOnePairTwo"]];
            [self.a31Image setTag:2];
        }
        else if(self.tagSetter == 3){
            [self.a31Image setImage:[UIImage imageNamed:@"setOnePairThree"]];
            [self.a31Image setTag:3];
        }
        else if(self.tagSetter == 4){
            [self.a31Image setImage:[UIImage imageNamed:@"setOnePairFour"]];
            [self.a31Image setTag:4];
        }
        else if(self.tagSetter == 5){
            [self.a31Image setImage:[UIImage imageNamed:@"setOnePairFive"]];
            [self.a31Image setTag:5];
        }
        else if(self.tagSetter == 6){
            [self.a31Image setImage:[UIImage imageNamed:@"setOnePairSix"]];
            [self.a31Image setTag:6];
        }
        else if(self.tagSetter == 7){
            [self.a31Image setImage:[UIImage imageNamed:@"setOnePairSeven"]];
            [self.a31Image setTag:7];
        }
        else if(self.tagSetter == 8){
            [self.a31Image setImage:[UIImage imageNamed:@"setOnePairEight"]];
            [self.a31Image setTag:8];
        }
        
    }
    if([[self.flipRetentionData.sixteenPositionTiles objectAtIndex:self.flipRetentionData.randomTwo]  isEqual: @10]){
        NSLog(@" picture a32");
        if (self.tagSetter == 1){
            [self.a32Image setImage:[UIImage imageNamed:@"setOnePairOne"]];
            [self.a32Image setTag:1];
        }
        else if(self.tagSetter == 2){
            [self.a32Image setImage:[UIImage imageNamed:@"setOnePairTwo"]];
            [self.a32Image setTag:2];
        }
        else if(self.tagSetter== 3){
            [self.a32Image setImage:[UIImage imageNamed:@"setOnePairThree"]];
            [self.a32Image setTag:3];
        }
        else if(self.tagSetter == 4){
            [self.a32Image setImage:[UIImage imageNamed:@"setOnePairFour"]];
            [self.a32Image setTag:4];
        }
        else if(self.tagSetter == 5){
            [self.a32Image setImage:[UIImage imageNamed:@"setOnePairFive"]];
            [self.a32Image setTag:5];
        }
        else if(self.tagSetter == 6){
            [self.a32Image setImage:[UIImage imageNamed:@"setOnePairSix"]];
            [self.a32Image setTag:6];
        }
        else if(self.tagSetter == 7){
            [self.a32Image setImage:[UIImage imageNamed:@"setOnePairSeven"]];
            [self.a32Image setTag:7];
        }
        else if(self.tagSetter == 8){
            [self.a32Image setImage:[UIImage imageNamed:@"setOnePairEight"]];
            [self.a32Image setTag:8];
        }
        
    }
    if([[self.flipRetentionData.sixteenPositionTiles objectAtIndex:self.flipRetentionData.randomTwo]  isEqual: @11]){
        NSLog(@" picture a33");
        if (self.tagSetter == 1){
            [self.a33Image setImage:[UIImage imageNamed:@"setOnePairOne"]];
            [self.a33Image setTag:1];
        }
        else if(self.tagSetter == 2){
            [self.a33Image setImage:[UIImage imageNamed:@"setOnePairTwo"]];
            [self.a33Image setTag:2];
        }
        else if(self.tagSetter == 3){
            [self.a33Image setImage:[UIImage imageNamed:@"setOnePairThree"]];
            [self.a33Image setTag:3];
        }
        else if(self.tagSetter == 4){
            [self.a33Image setImage:[UIImage imageNamed:@"setOnePairFour"]];
            [self.a33Image setTag:4];
        }
        else if(self.tagSetter == 5){
            [self.a33Image setImage:[UIImage imageNamed:@"setOnePairFive"]];
            [self.a33Image setTag:5];
        }
        else if(self.tagSetter == 6){
            [self.a33Image setImage:[UIImage imageNamed:@"setOnePairSix"]];
            [self.a33Image setTag:6];
        }
        else if(self.tagSetter == 7){
            [self.a33Image setImage:[UIImage imageNamed:@"setOnePairSeven"]];
            [self.a33Image setTag:7];
        }
        else if(self.tagSetter == 8){
            [self.a33Image setImage:[UIImage imageNamed:@"setOnePairEight"]];
            [self.a33Image setTag:8];
        }
        
    }
    if([[self.flipRetentionData.sixteenPositionTiles objectAtIndex:self.flipRetentionData.randomTwo]  isEqual: @12]){
        NSLog(@" picture a34");
        if (self.tagSetter == 1){
            [self.a34Image setImage:[UIImage imageNamed:@"setOnePairOne"]];
            [self.a34Image setTag:1];
        }
        else if(self.tagSetter == 2){
            [self.a34Image setImage:[UIImage imageNamed:@"setOnePairTwo"]];
            [self.a34Image setTag:2];
        }
        else if(self.tagSetter == 3){
            [self.a34Image setImage:[UIImage imageNamed:@"setOnePairThree"]];
            [self.a34Image setTag:3];
        }
        else if(self.tagSetter == 4){
            [self.a34Image setImage:[UIImage imageNamed:@"setOnePairFour"]];
            [self.a34Image setTag:4];
        }
        else if(self.tagSetter == 5){
            [self.a34Image setImage:[UIImage imageNamed:@"setOnePairFive"]];
            [self.a34Image setTag:5];
        }
        else if(self.tagSetter == 6){
            [self.a34Image setImage:[UIImage imageNamed:@"setOnePairSix"]];
            [self.a34Image setTag:6];
        }
        else if(self.tagSetter == 7){
            [self.a34Image setImage:[UIImage imageNamed:@"setOnePairSeven"]];
            [self.a34Image setTag:7];
        }
        else if(self.tagSetter == 8){
            [self.a34Image setImage:[UIImage imageNamed:@"setOnePairEight"]];
            [self.a34Image setTag:8];
        }
        
    }
    if([[self.flipRetentionData.sixteenPositionTiles objectAtIndex:self.flipRetentionData.randomTwo]  isEqual: @13]){
        NSLog(@" picture a41");
        if (self.tagSetter == 1){
            [self.a41Image setImage:[UIImage imageNamed:@"setOnePairOne"]];
            [self.a41Image setTag:1];
        }
        else if(self.tagSetter == 2){
            [self.a41Image setImage:[UIImage imageNamed:@"setOnePairTwo"]];
            [self.a41Image setTag:2];
        }
        else if(self.tagSetter== 3){
            [self.a41Image setImage:[UIImage imageNamed:@"setOnePairThree"]];
            [self.a41Image setTag:3];
        }
        else if(self.tagSetter == 4){
            [self.a41Image setImage:[UIImage imageNamed:@"setOnePairFour"]];
            [self.a41Image setTag:4];
        }
        else if(self.tagSetter == 5){
            [self.a41Image setImage:[UIImage imageNamed:@"setOnePairFive"]];
            [self.a41Image setTag:5];
        }
        else if(self.tagSetter == 6){
            [self.a41Image setImage:[UIImage imageNamed:@"setOnePairSix"]];
            [self.a41Image setTag:6];
        }
        else if(self.tagSetter == 7){
            [self.a41Image setImage:[UIImage imageNamed:@"setOnePairSeven"]];
            [self.a41Image setTag:7];
        }
        else if(self.tagSetter == 8){
            [self.a41Image setImage:[UIImage imageNamed:@"setOnePairEight"]];
            [self.a41Image setTag:8];
        }
        
    }
    if([[self.flipRetentionData.sixteenPositionTiles objectAtIndex:self.flipRetentionData.randomTwo]  isEqual: @14]){
        NSLog(@" picture a42");
        if (self.tagSetter == 1){
            [self.a42Image setImage:[UIImage imageNamed:@"setOnePairOne"]];
            [self.a42Image setTag:1];
        }
        else if(self.tagSetter == 2){
            [self.a42Image setImage:[UIImage imageNamed:@"setOnePairTwo"]];
            [self.a42Image setTag:2];
        }
        else if(self.tagSetter == 3){
            [self.a42Image setImage:[UIImage imageNamed:@"setOnePairThree"]];
            [self.a42Image setTag:3];
        }
        else if(self.tagSetter== 4){
            [self.a42Image setImage:[UIImage imageNamed:@"setOnePairFour"]];
            [self.a42Image setTag:4];
        }
        else if(self.tagSetter == 5){
            [self.a42Image setImage:[UIImage imageNamed:@"setOnePairFive"]];
            [self.a42Image setTag:5];
        }
        else if(self.tagSetter == 6){
            [self.a42Image setImage:[UIImage imageNamed:@"setOnePairSix"]];
            [self.a42Image setTag:6];
        }
        else if(self.tagSetter == 7){
            [self.a42Image setImage:[UIImage imageNamed:@"setOnePairSeven"]];
            [self.a42Image setTag:7];
        }
        else if(self.tagSetter == 8){
            [self.a42Image setImage:[UIImage imageNamed:@"setOnePairEight"]];
            [self.a42Image setTag:8];
        }
        
    }
    if([[self.flipRetentionData.sixteenPositionTiles objectAtIndex:self.flipRetentionData.randomTwo]  isEqual: @15]){
        NSLog(@" picture a43");
        if (self.tagSetter == 1){
            [self.a43Image setImage:[UIImage imageNamed:@"setOnePairOne"]];
            [self.a43Image setTag:1];
        }
        else if(self.tagSetter == 2){
            [self.a43Image setImage:[UIImage imageNamed:@"setOnePairTwo"]];
            [self.a43Image setTag:2];
        }
        else if(self.tagSetter == 3){
            [self.a43Image setImage:[UIImage imageNamed:@"setOnePairThree"]];
            [self.a43Image setTag:3];
        }
        else if(self.tagSetter == 4){
            [self.a43Image setImage:[UIImage imageNamed:@"setOnePairFour"]];
            [self.a43Image setTag:4];
        }
        else if(self.tagSetter == 5){
            [self.a43Image setImage:[UIImage imageNamed:@"setOnePairFive"]];
            [self.a43Image setTag:5];
        }
        else if(self.tagSetter == 6){
            [self.a43Image setImage:[UIImage imageNamed:@"setOnePairSix"]];
            [self.a43Image setTag:6];
        }
        else if(self.tagSetter == 7){
            [self.a43Image setImage:[UIImage imageNamed:@"setOnePairSeven"]];
            [self.a43Image setTag:7];
        }
        else if(self.tagSetter == 8){
            [self.a43Image setImage:[UIImage imageNamed:@"setOnePairEight"]];
            [self.a43Image setTag:8];
        }
        
    }
    if([[self.flipRetentionData.sixteenPositionTiles objectAtIndex:self.flipRetentionData.randomTwo]  isEqual: @16]){
        NSLog(@" picture a44");
        if (self.tagSetter == 1){
            [self.a44Image setImage:[UIImage imageNamed:@"setOnePairOne"]];
            [self.a44Image setTag:1];
        }
        else if(self.tagSetter == 2){
            [self.a44Image setImage:[UIImage imageNamed:@"setOnePairTwo"]];
            [self.a44Image setTag:2];
        }
        else if(self.tagSetter == 3){
            [self.a44Image setImage:[UIImage imageNamed:@"setOnePairThree"]];
            [self.a44Image setTag:3];
        }
        else if(self.tagSetter == 4){
            [self.a44Image setImage:[UIImage imageNamed:@"setOnePairFour"]];
            [self.a44Image setTag:4];
        }
        else if(self.tagSetter == 5){
            [self.a44Image setImage:[UIImage imageNamed:@"setOnePairFive"]];
            [self.a44Image setTag:5];
        }
        else if(self.tagSetter == 6){
            [self.a44Image setImage:[UIImage imageNamed:@"setOnePairSix"]];
            [self.a44Image setTag:6];
        }
        else if(self.tagSetter == 7){
            [self.a44Image setImage:[UIImage imageNamed:@"setOnePairSeven"]];
            [self.a44Image setTag:7];
        }
        else if(self.tagSetter == 8){
            [self.a44Image setImage:[UIImage imageNamed:@"setOnePairEight"]];
            [self.a44Image setTag:8];
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
