//
//  Enemy.h
//  AlienInvaders
//
//  Created by Bret Williams on 9/23/17.
//  Copyright © 2017 Bret Williams. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "EnemyBullet.h"

@interface Enemy : NSObject

@property UIView *gameView;
@property NSInteger minXPos;
@property NSInteger maxXPos;
@property NSMutableArray *enemyList;
@property NSTimer *enemyTimer;
@property NSTimer *enemyBulletTimer;
@property EnemyBullet *enemiesBullet;

-(Enemy *) initEnemies: (UIView *) gameView;
-(void) moveEnemies;
-(void) dropBomb;
-(void) startTimers;
-(void) stopTimers;
@end
