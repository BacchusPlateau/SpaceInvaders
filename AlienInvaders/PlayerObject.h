//
//  PlayerObject.h
//  AlienInvaders
//
//  Created by Bret Williams on 11/25/17.
//  Copyright © 2017 Bret Williams. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "PlayerBullet.h"

@interface PlayerObject : NSObject

@property UIView *gameView;
@property CGRect playerRect;
@property (strong) UIImage *playerImage;
@property (strong) UIImageView *playerView;

-(PlayerObject *) initPlayer:(UIView *) gameView;
-(void) movePlayerRight;
-(void) movePlayerLeft;
-(void) fireBullet;
-(UIView *) getPlayerView;

@end
