
#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "game.h"
#include "spritesheet.h"
#include "soundLib.h"
#include "jump.h"
#include "gasp.h"

// Variables
int lifeCount;
int timeForFan;
int timeForPaps;
int timeForSnap;
int papActive;
int fanActive;
int awardActive;
int awardsCollected;
int fanTime;

// Actors
LEO leo;
FAN fans[10];
PAP bendPaps[10];
PAP paps[10];
LIVES lives[3];
AWARD awards[35];
enum {LEOWALK, CHEATLEO, PAP1, PAP2, MODELRIGHT, MODELLEFT, AWARDS, LEOBLANK};

//more musica

SOUND soundA;
SOUND soundB;


/////////////////////////////////INTIALIZE////////////////////////////////////////////
void initGame() {
	timer = 0;
	fanTime = 0;
	countDown = 0;
	awardsCollected = 0;
	fanActive = 0;
	papActive = 0;
	awardActive = 0;
	initPlayer();
	if(level == 1) {
		initPaps();
	} else if (level == 2) {
		initPaps();
		initFans();
	} else if (level == 3) {
		initPaps();
		initFans();
		initAwards();
	}
	initLives();
	for(int i = 0; i < lifeCount; i++) {
		lives[i].active = 1;
	}
	
}

void initPlayer() {
    leo.size = 32;
	leo.row = SHIFTUP(120-leo.size/2);
	leo.col = 100-leo.size/2;


	leo.aniCounter = 50;
	leo.sprite = 0;
	leo.isaCheat = 0;
	leo.speed = 20;
	leo.active = 1;
	leo.index = 0;
	leo.anistate = 0;
	//shiftrow to not destroy other stuff

    leo.rdel = 0;
    leo.cdel = 1;
    leo.racc = 60;
    leo.cacc = 20;
    leo.stopRange = 5;
    leo.isJumping = 0;

    leo.maxHSpeed = SHIFTUP(3);
    leo.maxVSpeed = SHIFTUP(6);

}

void initFans() {
	for(int i = 0; i < 10; i++) {
		fans[i].index = 1 + i;
		fans[i].width = 24;
    	fans[i].height = 24;
		fans[i].row = 120;
		fans[i].col = SCREENWIDTH + fans[i].width;
		fans[i].minCol = leo.col - leo.size*3; //for having fans zigzag on screen
    	fans[i].cdel = -2;
    	fans[i].eager = 0;
    	fans[i].goingLeft = 1;
    	fans[i].anistate = 5;
   		fans[i].sprite = 0;
    	fans[i].active = 0;
		fans[i].aniCounter = 0;
	}
	timeForFan = rand()%25 + 50;
}

void initPaps() {
	 for (int i = 0; i < 10; ++i) {
	 	bendPaps[i].index = 11 + i; //after fans
	 	bendPaps[i].row = 120;
	 	bendPaps[i].col = SCREENWIDTH + 32;
	 	bendPaps[i].cdel = -1;
	 	bendPaps[i].width = 32;
	 	bendPaps[i].height = 32;
	 	bendPaps[i].sprite = 0;
	 	bendPaps[i].numFrames = 3;
	 	bendPaps[i].active = 0;
	 	bendPaps[i].anistate = 3;
	 }

	 for (int i = 0; i < 10; ++i) {
	 	paps[i].index = 21 + i; //after fans & bend paps
	 	paps[i].row = 120;
	 	paps[i].col = SCREENWIDTH + 32;
	 	paps[i].cdel = -1;
	 	paps[i].width = 32;
	 	paps[i].height = 32;
	 	paps[i].sprite = 0;
	 	paps[i].numFrames = 4;
	 	paps[i].active = 0;
	 	paps[i].anistate = 4;
	 }
}

void initLives() {
	for (int i = 0; i < 3; i++) {
		lives[i].active = 0;
		lives[i].height = 16;
		lives[i].width = 16;
		lives[i].row = 0;
		lives[i].col = 20 + (16 * (i));
		lives[i].index = i+31; // after fans & bend paps & paps
		lives[i].sprite = 2;
		lives[i].anistate = 7;
	}
}

void initAwards() {
	for(int i = 0; i < 15; i++) {
    	awards[i].index = 35 + i; //after fans & bend paps & paps & lives
	 	awards[i].row = 80 + rand()%40;
	 	awards[i].col = SCREENWIDTH + 16;
	 	awards[i].cdel = -1;
	 	awards[i].width = 16;
	 	awards[i].height = 16;
	 	awards[i].sprite = rand()%3;
	 	awards[i].numFrames = 7;
	 	awards[i].active = 0;
	 	awards[i].anistate = 14;
	}
}




///////////////////////////////////UPDATE///////////////////////////////////////
void updateGame() {
	timer++;
	fanTime++;
	updatePlayer();
	if(level == 1) {
		updatePaps1();
	}
	if(level == 2) {
		updatePaps1();
		updateFans();
	}
	if(level == 3) {
		updatePaps1();
		updateFans();
		updateAwards();
	}
	// updatePaps2();
	if(timer % 53 == 0) {
		countDown++;
	}
	//insert level info
	if(countDown == timeRemain && lifeCount >= 1 && level <= 2) {
		level++;
		notIntrod = 1;
	}
	if(awardsCollected >= 20 && level == 3) {
		level++;
		notIntrod = 1;
	}
	
}

void updatePlayer() {
	leo.aniCounter++;
	//speed up and slow down
	if(BUTTON_HELD(BUTTON_RIGHT)) {
		leo.speed = 10;
		if((leo.col+leo.size) < 240) {
			leo.col+=leo.cdel;
		}
	} else if(BUTTON_HELD(BUTTON_LEFT)) {
		leo.speed = 26;
		if(leo.col > 0) {
			leo.col -= leo.cdel;
		}	
	} else {
		leo.speed = 17;
	}
	//actual sprite movement
	if (!leo.isJumping) {
		if (leo.aniCounter % leo.speed == 0) {
	        if (leo.sprite >= 2) {
	            leo.sprite = 1;
	        }
	    	 else {
	            leo.sprite += 1;
	        }
		}
	} else {
		leo.sprite = 3;
	}

	//jump movement
	leo.rdel += leo.racc;
	if (leo.row + leo.rdel > 0) {
		leo.row += leo.rdel;
		// if((leo.row%7 == 0) && (leo.col+leo.size < 240)) {
		// 	leo.col += leo.cdel;
		// }
		
	}

    //stops down jump
	if (SHIFTDOWN(leo.row) >= 120) {
		leo.row = SHIFTUP(120);
		// leo.col = 100-leo.size;
		// leo.col = SHIFTUP(100-leo.size/2);
		leo.rdel = 0;
		leo.isJumping = 0;
	}

	if (BUTTON_PRESSED(BUTTON_A) && SHIFTDOWN(leo.row) >= 62) {
		leo.rdel = -SHIFTUP(6);
		// leo.cdel = 1;
		leo.isJumping = 1;
		playSoundB(jump, JUMPLEN, JUMPFREQ, 0);
	}

	//////////cheat
	if(BUTTON_HELD(BUTTON_B) && BUTTON_HELD(BUTTON_START)) {
		leo.anistate = 1;
		leo.isaCheat = 1;
	}
	if((leo.isaCheat > 0) && (timer % 5 == 0)) {
		leo.isaCheat += 1;
	}

	if (leo.isaCheat >= 80) { /////make more of a warning
		leo.anistate = 0;
		leo.isaCheat = 0;
	 } else if(leo.isaCheat >= 60 && leo.isaCheat <= 70) {
		leo.anistate = 2;
		//flicker
	}

	if(collisionCheck() == 1) {
		//flicker
		leo.aniCounter = 0;
	}

	if (leo.aniCounter < 50 && !leo.isaCheat) {
		leo.anistate = 2;
	} else if(!leo.isaCheat){
		leo.anistate = 0; 
	}

}


int collisionCheck() {
	if(leo.isaCheat && isMeryl == 0) {
		return 0;
	}
	/////colliding with a fan
	for (int j = 0; j < 10; j++) {
		if (fans[j].active && collision(SHIFTDOWN(leo.row), leo.col, leo.size, leo.size, 
			fans[j].row, fans[j].col, fans[j].height, fans[j].width) == 1) {
			playSoundB(gasp, GASPLEN, GASPFREQ, 0);
			fans[j].active = 0; //****change to Leo flicker
			fanActive--;
			lives[--lifeCount].active = 0;
			return 1;
		}
	}

	///////colliding wih a pap
	for (int j = 0; j < 10; j++) {
		if (bendPaps[j].active) {
			if(papsCollision(SHIFTDOWN(leo.row), leo.col, leo.size, leo.size,
			bendPaps[j].row, bendPaps[j].col, bendPaps[j].height, bendPaps[j].width) == 1) {
				papActive--;
				bendPaps[j].active = 0; 
				leo.rdel = -SHIFTUP(6);
				return 0;

			} else if (papsCollision(SHIFTDOWN(leo.row), leo.col, leo.size, leo.size,
			bendPaps[j].row, bendPaps[j].col, bendPaps[j].width, bendPaps[j].height) >= 2) {
				papActive--;
				bendPaps[j].active = 0;
				lives[--lifeCount].active = 0;
				return 1;
			}
			
		}
	}
	return 0;
}

void updateFans() {
	//controlling when they appear
	if (++fanTime % timeForFan == 0 && fanActive < 1) {
		for (int i = 0; i < 10; ++i) {
			if (!fans[i].active) {
				//reinit
				fans[i].col = SCREENWIDTH + fans[i].width*2*i;
				fans[i].minCol = leo.col - leo.size*3; 
		    	fans[i].cdel = -2;
		    	fans[i].eager = 0;
		    	fans[i].goingLeft = 1;

				fans[i].active = 1;
				fanActive++;
				fanTime = 0;
				timeForFan = rand()%30 + 50;
				break;
			}
		}
	}
	//YAS BEYOTCH
	//what they do when alive and how they move
	for (int i = 0; i < 10; i++) {
		if(fans[i].active) {
			fans[i].aniCounter++;
			//rush to the center
			
			if(fans[i].col >= fans[i].minCol && fans[i].goingLeft == 1) { //go left
				fans[i].col += fans[i].cdel;
				if(fans[i].aniCounter % 7 == 0) {
					if(fans[i].sprite == 2) {
						fans[i].sprite = 3;
					} else {
						fans[i].sprite = 2;
					}
				}
			} else { //then go back and forth....
				fans[i].cdel = -1;
				fans[i].col -= fans[i].cdel;
				fans[i].goingLeft = 0;
				fans[i].minCol -= 1;
				//first go right
				if(fans[i].aniCounter % 7 == 0) {
					fans[i].eager++;
					if(fans[i].sprite <= 0) {
						fans[i].sprite = 1;
					} else {
						fans[i].sprite = 0;
					}
				}

				if(fans[i].eager % 20 == 0) { //go right for the same distance always
					fans[i].goingLeft = 1;
				}
			}
			//until you get off the screen
			if(fans[i].col < -32) {
				fans[i].active = 0;
				fanActive = 0;			
			}
		}
	}
}

void updatePaps1() { //the paparrazzi that kneels
	if (++timer % timeForSnap == 0 && papActive <= 1) {
		for (int i = 0; i < 10; ++i) {
			if(!bendPaps[i].active) {
				bendPaps[i].col = SCREENWIDTH + 32*i;
				bendPaps[i].active = 1;
				papActive++;
				timeForSnap = rand()%37 + 50;
				break;
			}
		}
	}

	for (int i = 0; i < 10; i++) {
		if(bendPaps[i].active) {
			bendPaps[i].col += bendPaps[i].cdel;
			if(leo.aniCounter % 7 == 0) {
				if(bendPaps[i].sprite <= 0) {
					bendPaps[i].sprite = 1;
				} else {
					bendPaps[i].sprite = 0;
				}
			}
		}

		if(bendPaps[i].col < -32) {
			papActive = 0;
			bendPaps[i].active = 0;
		}
	}
}

void updateAwards() {
	for(int i = 0; i < 35; i++) {
		if(++timer % 213 && awardActive <= 3) {
			if(!awards[i].active) {
				awards[i].col = SCREENWIDTH + 16*i;
				awards[i].active = 1;
				awardActive++;
				break;
			}
		}

		if(awards[i].active) {
			if(leo.aniCounter % 7 == 0) {
				if(awards[i].anistate%2 == 0) { //if on even
					awards[i].anistate++;
				} else {
					awards[i].anistate--;
				}
			}
			awards[i].col += awards[i].cdel;
			//how do you make awards appear in sets?
			if (collision(SHIFTDOWN(leo.row), leo.col, leo.size, leo.size, 
			awards[i].row, awards[i].col, awards[i].height, awards[i].width)) {
				awards[i].active = 0;
				awardsCollected+=1;
				if(awardsCollected >= 10) {
						drawScore(1, (awardsCollected/10));
					}
					drawScore(0, (awardsCollected%10));
				awardActive--;
			}
			if(awards[i].col < -32) {
				awards[i].active = 0;
				awardActive--;
			}
		}
	}
}

///////////////////////////////////DRAW//////////////////////////////////////////////
void drawGame() {
	
	if(level == 1) {
		drawPaps();
	}
	if(level == 2) {
		drawFans();
		drawPaps();
	}
	if(level == 3) {
		drawFans();
		drawPaps();
		drawAwards();
		//draw the word score
		for(int i = 0; i < 3; i++) {
			int col = 180 - (3-i)*16;
			int ind = 50 + i;
			shadowOAM[ind].attr0 = (145 & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[ind].attr1 = (col & COLMASK) | ATTR1_SMALL;
			shadowOAM[ind].attr2 = ATTR2_TILEID(20, (i*2) + 26);
		}
		//draw '/25'
		for(int i = 0; i < 2; i++) {
			int ind = 56+i;
			int col = 200 + i*16;
			shadowOAM[ind].attr0 = (145 & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[ind].attr1 = (col & COLMASK) | ATTR1_SMALL;
			shadowOAM[ind].attr2 = ATTR2_TILEID(22, (i*2) + 26);	
		}

	}
	for(int i = 0; i < (lifeCount + 1); i++) { 
    	drawLives(&lives[i]);
	}
	drawPlayer();
	DMANow(3, shadowOAM, OAM, 128*4);
}



void drawPlayer() {
	shadowOAM[0].attr0 = (SHIFTDOWN(leo.row) & ROWMASK)| ATTR0_4BPP | ATTR0_SQUARE;
	shadowOAM[0].attr1 = (leo.col & COLMASK) | ATTR1_MEDIUM;
	shadowOAM[0].attr2 = ATTR2_TILEID(leo.sprite*4, leo.anistate*4);

}

void drawFans() {
	for(int i = 0; i < 10; i++) {
		if(fans[i].active) {
			shadowOAM[fans[i].index].attr0 = (fans[i].row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[fans[i].index].attr1 = (fans[i].col & COLMASK) | ATTR1_MEDIUM;
			shadowOAM[fans[i].index].attr2 = ATTR2_TILEID(fans[i].sprite*4, fans[i].anistate*4);
		} else {
			shadowOAM[fans[i].index].attr0 = ATTR0_HIDE;
		}
	}
}

void drawPaps() {
	for(int i = 0; i < 10; i++) {
		if(bendPaps[i].active) {
			shadowOAM[bendPaps[i].index].attr0 = (bendPaps[i].row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[bendPaps[i].index].attr1 = (bendPaps[i].col & COLMASK) | ATTR1_MEDIUM;
			shadowOAM[bendPaps[i].index].attr2 = ATTR2_TILEID(bendPaps[i].sprite*4, bendPaps[i].anistate*4);
		} else {
			shadowOAM[bendPaps[i].index].attr0 = ATTR0_HIDE;
		}
	}

	for(int i = 0; i < 10; i++) {
		if(paps[i].active) {
			shadowOAM[paps[i].index].attr0 = (paps[i].row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[paps[i].index].attr1 = (paps[i].col & COLMASK) | ATTR1_MEDIUM;
			shadowOAM[paps[i].index].attr2 = ATTR2_TILEID(paps[i].sprite*4, paps[i].anistate*4);
		} else {
			shadowOAM[paps[i].index].attr0 = ATTR0_HIDE;
		}
	}
}

void drawLives(LIVES* life) {
	if(life->active) {
		shadowOAM[life->index].attr0 = (life->row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[life->index].attr1 = (life->col & COLMASK) | ATTR1_SMALL;
		shadowOAM[life->index].attr2 = ATTR2_TILEID(life->sprite*4, life->anistate*4);
	} else {
		shadowOAM[life->index].attr0 = ATTR0_HIDE;
	}
}

void drawAwards() {
	for(int i = 0; i < 35; i++) {
		if(awards[i].active) {
			shadowOAM[awards[i].index].attr0 = (awards[i].row & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
			shadowOAM[awards[i].index].attr1 = (awards[i].col & COLMASK) | ATTR1_SMALL;
			shadowOAM[awards[i].index].attr2 = ATTR2_TILEID(awards[i].sprite*2, awards[i].anistate*2);
		} else {
			shadowOAM[awards[i].index].attr0 = ATTR0_HIDE;
		}
	}
}

void drawScore(int place, int num) { 
	int col = 187 - place*8;
	int ind = 54+place; //after score text
	shadowOAM[ind].attr0 = (145 & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
	shadowOAM[ind].attr1 = (col & COLMASK) | ATTR1_SMALL;
	shadowOAM[ind].attr2 = ATTR2_TILEID(num*2, 26);
}