//
//  GameViewController.m
//  AlienInvaders
//
//  Created by Bret Williams on 7/17/17.
//  Copyright © 2017 Bret Williams. All rights reserved.
//

#import "GameViewController.h"


@implementation GameViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self changeState: INITIALIZING];

}

-(void)closeScreen {
    
    [self.loadingView removeFromSuperview];
    [self changeState:PLAYING];
    [self.enemies startTimers];
    self.collisionTimer = [NSTimer scheduledTimerWithTimeInterval:.01 target:self selector:@selector(intersectCheck) userInfo:nil repeats:YES];
    
}

-(void)intersectCheck {
    
    BOOL isConnecting = CGRectIntersectsRect(self.enemies.enemiesBullet.bombRect, self.playerOne.playerRect);
    
    if(isConnecting == true) {
        [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(endScreen) userInfo:nil repeats:NO];
        [self changeState: RELOADING];
    }
    
}

-(void)endScreen {
    
    [self.loadingView removeFromSuperview];
    [self changeState:ENDING];
    [self performSegueWithIdentifier:@"unwind" sender:self];
    
}

-(void)loadingScreen {

    self.playerOne = [[[PlayerObject alloc] init] initPlayer: self.view];
    self.playerView = [self.playerOne getPlayerView];
    self.enemies = [[[Enemy alloc]init] initEnemies:self.view];
    self.loadingView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"loading.png"]];
    self.loadingView.frame = self.view.frame;
    
    [self.view addSubview:self.loadingView];
    [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(closeScreen) userInfo:nil repeats:NO];
    
}

-(void)changeState: (int)newState {
    
    switch (newState) {
        case INITIALIZING:
            [self loadingScreen];
            break;
        case PLAYING:
            break;
        case RELOADING:
            [self.view addSubview: self.loadingView];
            [self.enemies stopTimers];
            [self.collisionTimer invalidate];
            self.collisionTimer = NULL;
            break;
        case ENDING:
            break;
        default:
            NSLog(@"Integer out of range...");
            break;
    }
    self.currentState = newState;
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    
}


-(void) releaseTouch {
    
    if(self.moveTimer != nil) {
        [self.moveTimer invalidate];
        self.moveTimer = nil;
    }
    
}


- (IBAction)fireButton:(id)sender {
    
    if(self.currentState != PLAYING)
        return;
    [self.playerOne fireBullet];
    
}


- (IBAction)moveLeft:(id)sender {
    
    [self releaseTouch];
    if(self.currentState != PLAYING)
        return;
    
    self.moveTimer = [NSTimer scheduledTimerWithTimeInterval: .03
            target:self.playerOne
            selector:@selector(movePlayerLeft)
            userInfo: nil
            repeats:YES];
}

- (IBAction)moveRight:(id)sender {
    
    [self releaseTouch];
    if(self.currentState != PLAYING)
        return;
    self.moveTimer = [NSTimer scheduledTimerWithTimeInterval: .03
            target:self.playerOne
            selector:@selector(movePlayerRight)
            userInfo: nil
            repeats:YES];
}

- (IBAction)TouchRelease:(id)sender {
    [self releaseTouch];
}
@end
