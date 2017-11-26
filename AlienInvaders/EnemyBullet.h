//
//  EnemyBullet.h
//  AlienInvaders
//
//  Created by Bret Williams on 11/23/17.
//  Copyright © 2017 Bret Williams. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface EnemyBullet : NSObject

@property CGRect bombRect;
@property UIImageView *bombView;
@property (strong) NSTimer *bombTimer;
@property UIView *gameView;


-(void) fireBullet: (UIView *) gameView :(NSArray *) enemyList;

@end
