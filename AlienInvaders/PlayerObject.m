//
//  PlayerObject.m
//  AlienInvaders
//
//  Created by Bret Williams on 11/25/17.
//  Copyright © 2017 Bret Williams. All rights reserved.
//

#import "PlayerObject.h"
#import "PlayerBullet.h"

@implementation PlayerObject

-(PlayerObject *) initPlayer:(UIView *)gameView {
    
    self.gameView = gameView;
    self.playerImage = [UIImage imageNamed:@"ship.png"];
    self.playerView = [[UIImageView alloc] initWithImage: self.playerImage];
    self.playerRect = CGRectMake(50, 400, 32, 32);
    self.playerView.frame = self.playerRect;
    [self.gameView addSubview: self.playerView];
    
    return self;
}

-(UIView *) getPlayerView {
    return self.playerView;
}

-(void) movePlayerRight {
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    if(self.playerRect.origin.x <= screenRect.size.width
       - self.playerRect.size.width - 10){
        self.playerRect = CGRectOffset(self.playerRect, +3, 0);
        self.playerView.frame = self.playerRect;
    }
    
}

-(void) movePlayerLeft {
    if(self.playerRect.origin.x >= 10){
        self.playerRect = CGRectOffset(self.playerRect, -3, 0);
        self.playerView.frame = self.playerRect;
    }
}

-(void) fireBullet {
    [[[PlayerBullet alloc]init] initBullet: self.gameView : self.playerView];
}


@end
