//
//  GameViewController.h
//  AlienInvaders
//
//  Created by Bret Williams on 7/17/17.
//  Copyright © 2017 Bret Williams. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayerObject.h"
#import "Enemy.h"

@interface GameViewController : UIViewController

@property (strong) NSTimer *moveTimer;
@property (strong) NSTimer *collisionTimer;
@property PlayerObject *playerOne;
@property UIView *playerView;
@property Enemy *enemies;

- (IBAction)moveLeft:(id)sender;
- (IBAction)moveRight:(id)sender;
- (IBAction)TouchRelease:(id)sender;
- (IBAction)fireButton:(id)sender;

typedef NS_ENUM(NSInteger, GAME_STATE) {
    INITIALIZING = 1,
    PLAYING = 2,
    RELOADING = 3,
    ENDING = 4
};

@property GAME_STATE currentState;
@property (strong) UIImageView *loadingView;


@end
