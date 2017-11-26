//
//  PlayerBullet.m
//  AlienInvaders
//
//  Created by Bret Williams on 11/23/17.
//  Copyright © 2017 Bret Williams. All rights reserved.
//


#import "GameViewController.h"
#import "PlayerBullet.h"

@implementation PlayerBullet

-(void)initBullet:(UIView *)gameView :(UIImageView *)playerView {
    
    self.gameView = gameView;
    UIImage *bombImage1 = [UIImage imageNamed:@"bullet.png"];
    int bulletWidth = 8;
    int bulletStartX = playerView.frame.origin.x + (playerView.frame.size.width/2) - (bulletWidth/2);
    
    CGImageRef imageRef = CGImageCreateWithImageInRect([bombImage1 CGImage], CGRectMake(0, 0, 32, 64));
    CGImageRef imageRef2 = CGImageCreateWithImageInRect([bombImage1 CGImage], CGRectMake(0, 0, 32, 64));
    
    NSMutableArray *bombArray = [[NSMutableArray alloc]init];
    [bombArray addObject:[UIImage imageWithCGImage:imageRef]];
    [bombArray addObject:[UIImage imageWithCGImage:imageRef2]];
    
    self.bulletRect = CGRectMake(bulletStartX, playerView.frame.origin.y, bulletWidth, bulletWidth*2);
    self.bulletView = [[UIImageView alloc] initWithFrame: self.bulletRect];
    [self.bulletView setImage: [UIImage imageWithCGImage:imageRef2]];
    self.bulletView.animationImages = bombArray;
    self.bulletView.animationDuration = .3;
    [self.gameView addSubview:self.bulletView];
    
    [self.bulletView startAnimating];
    self.bulletTimer = [NSTimer scheduledTimerWithTimeInterval:.03 target:self selector:@selector(moveBullet) userInfo:nil repeats:YES];
}

-(void) moveBullet {
    
    self.bulletRect = CGRectOffset(self.bulletRect, 0, -5);
    self.bulletView.frame = self.bulletRect;
    if(self.bulletRect.origin.y < 50) {
        [self.bulletTimer invalidate];
        self.bulletTimer = nil;
        [self.bulletView removeFromSuperview];
    }
}

@end
