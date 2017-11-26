//
//  PlayerBullet.h
//  AlienInvaders
//
//  Created by Bret Williams on 11/23/17.
//  Copyright © 2017 Bret Williams. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface PlayerBullet : NSObject

@property CGRect bulletRect;
@property UIImageView *bulletView;
@property (strong) NSTimer *bulletTimer;
@property UIView *gameView;

-(void) initBullet: (UIView *) gameView :(UIImageView *) playerView;

@end
