//
//  Enemy.m
//  AlienInvaders
//
//  Created by Bret Williams on 9/23/17.
//  Copyright © 2017 Bret Williams. All rights reserved.
//

#import "Enemy.h"
#import "EnemyBullet.h"

@implementation Enemy

int eSize = 32;
bool goingLeft = false;
int enemyRows = 5;
int enemyColumns = 5;


-(void) dropBomb {
    
    EnemyBullet *newBullet = [[EnemyBullet alloc]init];
    [newBullet fireBullet:self.gameView :self.enemyList];
    
}

-(void) moveEnemies {
    
    UIImageView *enemyView = self.enemyList[0];
    if(enemyView.frame.origin.x <= self.minXPos) {
        goingLeft = false;
    }
    
    enemyView = self.enemyList[enemyColumns - 1];
    if(enemyView.frame.origin.x >= self.maxXPos) {
        goingLeft = true;
    }
    
    //move through all enemies and move them left or right by 3 pixels
    
    for(int i=0; i< self.enemyList.count; i++) {
        enemyView = self.enemyList[i];
        int xPos;
        
        if(goingLeft) {
            xPos = enemyView.frame.origin.x-3;
        } else {
            xPos = enemyView.frame.origin.x+3;
        }
        
        enemyView.frame = CGRectMake(xPos, enemyView.frame.origin.y, eSize, eSize);
        
        //add new enemy to the game view
        [self.gameView addSubview:enemyView];
    }
}

-(Enemy *) initEnemies: (UIView *)gameView {
    
    self.minXPos = 10;
    self.maxXPos = 278;
    self.gameView = gameView;
    
    int rowCount = 0;
    int startX = 10;
    int startY = 0;
    
    UIImage *enemyImage = [UIImage imageNamed:@"enemy01.png"];
    self.enemyList = [[NSMutableArray alloc] init];
    
    for(int i=0; i<(enemyRows * enemyColumns); i++) {
        int columnMod = i%enemyColumns;
        if(columnMod == 0)
            rowCount++;
        
        int xPos = startX + ((eSize*columnMod) + (columnMod*5));
        int yPos = startY + ((eSize*rowCount) + (rowCount*10));
        
        UIImageView *enemyView = [[UIImageView alloc]initWithImage:enemyImage];
        
        enemyView.frame = CGRectMake(xPos, yPos, eSize, eSize);
        [self.enemyList addObject:enemyView];
        [self.gameView addSubview:enemyView];
    }
    
   
    return self;
}

-(void) stopTimers {
    
    [self.enemyTimer invalidate];
    self.enemyTimer = NULL;
    [self.enemyBulletTimer invalidate];
    self.enemyBulletTimer = NULL;
    self.enemiesBullet = NULL;
    
}

-(void) startTimers {
    
    self.enemyTimer = [NSTimer scheduledTimerWithTimeInterval:.03
                                                       target:self
                                                     selector:@selector(moveEnemies)
                                                     userInfo:nil
                                                      repeats:YES];
    
    self.enemyBulletTimer = [NSTimer scheduledTimerWithTimeInterval:1
                                                             target:self
                                                           selector:@selector(dropBomb)
                                                           userInfo:nil
                                                            repeats:YES];
}

@end

