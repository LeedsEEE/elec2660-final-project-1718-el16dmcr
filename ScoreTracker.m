//
//  ScoreTracker.m
//  Axon Evolution
//
//  Created by David Russell [el16dmcr] on 20/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "ScoreTracker.h"

@implementation ScoreTracker

-(int)getOpticalConundrumScore{
    self.opticalConundrumScore = self.opticalConumdrumSave.currentScore;
    if( self.opticalConundrumScore > self.opticalConundrumHighScore){
        self.opticalConundrumHighScore = self.opticalConundrumScore;
        [self saveDataToFile];
    }
    return self.opticalConundrumScore;
    return self.opticalConundrumHighScore;
}
-(int)getLogicalPursuitScore{
    self.logicalPursuitScore = self.logicalPursuitSave.currentPoints;
    if( self.logicalPursuitScore > self.logicalPursuitHighScore){
        self.logicalPursuitHighScore = self.opticalConundrumScore;
        [self saveDataToFile];
    }
    return self.logicalPursuitScore;
    return self.logicalPursuitHighScore;
}
-(int)getFlipRetentionScore{
    self.flipRetentionScore = self.flipRetentionSave.currentScore;
    if( self.flipRetentionScore> self.flipRetentionHighScore){
        self.flipRetentionHighScore = self.flipRetentionScore;
        [self saveDataToFile];
    }
    return self.flipRetentionScore;
    return self.flipRetentionHighScore;
}
-(void)saveDataToFile{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
    NSString *documentaryDirectory = [paths objectAtIndex:0];
    
    NSString *fileName = [NSString stringWithFormat:@"%@/textfile.txt", documentaryDirectory];
    
    NSString *content = [NSString stringWithFormat:@"%d\n%d\n%d", self.opticalConundrumHighScore, self.logicalPursuitHighScore, self.flipRetentionHighScore];
    
    [content writeToFile:fileName
              atomically:NO
                encoding:NSStringEncodingConversionAllowLossy
                    error:nil];
}
@end
