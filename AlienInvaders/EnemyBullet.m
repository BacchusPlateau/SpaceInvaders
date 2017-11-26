//
//  EnemyBullet.m
//  AlienInvaders
//
//  Created by Bret Williams on 11/23/17.
//  Copyright © 2017 Bret Williams. All rights reserved.
//

#import "EnemyBullet.h"

@implementation EnemyBullet

-(void)moveBomb {
    
    self.bombRect = CGRectOffset(self.bombRect, 0, 5);
    self.bombView.frame = self.bombRect;
    if(self.bombRect.origin.y > 440) {
        [self.bombTimer invalidate];
        self.bombTimer = nil;
        [self.bombView removeFromSuperview];
    }
    
}

-(void) fireBullet:(UIView *) gameView :(NSArray *) enemyList {
    
    int randEnemy = (int)(random() % enemyList.count);
    UIImageView *enemyView = enemyList[randEnemy];
    self.gameView = gameView;
    UIImage *bombImage1 = [UIImage imageNamed:@"bullet.png"];
    
    int bombWidth = 8;
    int bombStartX = enemyView.frame.origin.x;
    
    CGImageRef imageRef = CGImageCreateWithImageInRect([bombImage1 CGImage], CGRectMake(0, 0, 32, 64));
    CGImageRef imageRef2 = CGImageCreateWithImageInRect([bombImage1 CGImage], CGRectMake(33, 0, 32, 64));
    
    NSMutableArray *bombArray = [[NSMutableArray alloc]init];
    [bombArray addObject:[UIImage imageWithCGImage:imageRef]];
    [bombArray addObject:[UIImage imageWithCGImage:imageRef2]];
    
    self.bombRect = CGRectMake(bombStartX, enemyView.frame.origin.y, bombWidth, bombWidth*2);
    self.bombView = [[UIImageView alloc] initWithFrame:self.bombRect];
 
    [self.bombView setImage:[UIImage imageWithCGImage:imageRef2]];
    self.bombView.animationImages = bombArray;
    self.bombView.animationDuration = .3;
    [self.gameView addSubview: self.bombView];
    [self.bombView startAnimating];
    
    self.bombTimer = [NSTimer scheduledTimerWithTimeInterval:.05 target:self selector:@selector(moveBomb) userInfo:nil repeats:YES];
}

@end
