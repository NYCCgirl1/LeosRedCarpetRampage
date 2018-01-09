#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "game.h"
#include "bonus.h"

PLAYER leo;
PLAYER steve;

int startCol;

///////////////// INITIALIZE /////////////////////
void initBonus() {
	winner = 0;
	loser = 0;
	timer = 0;
	startCol = 0;
	if(level == 2) {//then speed race
		initRaceLeo();
		initSteve();
		clock = 20;
	}
	if(level == 3) {
		initQuadLeo();
		clock = 30;
	}
}

void initQuadLeo() { //for bonus2
	leo.size = 32;
	leo.row = 120-leo.size/2;
	leo.col = 25;


	leo.aniCounter = 50;
	leo.sprite = 4;
	leo.active = 1;
	leo.index = 60;
	leo.anistate = 0;
    leo.cdel = 1;
}

void initRaceLeo() { //OG LEO
	leo.size = 32;
	leo.row = 120-leo.size/2;
	leo.col = 25;


	leo.aniCounter = 50;
	leo.sprite = 0;
	leo.active = 1;
	leo.index = 61;
	leo.anistate = 0;
    leo.cdel = 1;
}

void initSteve() {
	steve.size = 32;
	steve.row = 120-steve.size/2;
	steve.col = SHIFTUP(0);

	steve.cdel = 0;
	steve.speed = 20;


	steve.aniCounter = 0;
	steve.sprite = 4;
	steve.active = 1;
	steve.index = 62;
	steve.anistate = 1;
}



/////////////// DRAW //////////////////////////////
void drawBonus() {
	if(level == 2) {//then speed race
		drawRaceLeo();
		drawSteve();
	}
	if(level == 3) {
		drawQuadLeo();
	}
	//draw timer (the word)
	for(int i = 0; i < 2; i++) {
		int ind = 63;
		int col = 200 + i*16;
		shadowOAM[ind].attr0 = (145 & ROWMASK) | ATTR0_4BPP | ATTR0_SQUARE;
		shadowOAM[ind].attr1 = (col & COLMASK) | ATTR1_SMALL;
		shadowOAM[ind].attr2 = ATTR2_TILEID(24, (i*2) + 26);	
	}
	if(clock >= 10) {
		drawScore(1, (clock/10));
	}
	drawScore(0, (clock%10));
}

void drawQuadLeo() { 
	shadowOAM[leo.index].attr0 = (leo.row & ROWMASK)| ATTR0_4BPP | ATTR0_SQUARE;
	shadowOAM[leo.index].attr1 = (leo.col & COLMASK) | ATTR1_MEDIUM;
	shadowOAM[leo.index].attr2 = ATTR2_TILEID(leo.sprite*4, leo.anistate*4);
}

void drawRaceLeo() {
	shadowOAM[leo.index].attr0 = (leo.row & ROWMASK)| ATTR0_4BPP | ATTR0_SQUARE;
	shadowOAM[leo.index].attr1 = (leo.col & COLMASK) | ATTR1_MEDIUM;
	shadowOAM[leo.index].attr2 = ATTR2_TILEID(leo.sprite*4, leo.anistate*4);
}

void drawSteve() {
	shadowOAM[steve.index].attr0 = (steve.row & ROWMASK)| ATTR0_4BPP | ATTR0_SQUARE;
	shadowOAM[steve.index].attr1 = (steve.col & COLMASK) | ATTR1_MEDIUM;
	shadowOAM[steve.index].attr2 = ATTR2_TILEID(steve.sprite*4, steve.anistate*4);
}



//////////////// UPDATE //////////////////////////
void updateBonus() {
	timer++;
	if(timer % 60 == 0) {
		clock--;
	}
	if(level == 2) {//then speed race
		updateRaceLeo();
		updateSteve();

		if(clock == 0 && (leo.col >= steve.col)) {
			winner = 1;
		}
		if(clock == 0 && (leo.col < steve.col)) {
			loser = 1;
		}
	}
	if(level == 3) {
		updateQuadLeo();

		if(clock == 0) {
			loser = 1;
		}
		if(leo.col+leo.size >= 180) {
			winner = 1;
		}
	}
}

void updateQuadLeo() { //
	leo.aniCounter++;
	if(BUTTON_PRESSED(BUTTON_LEFT) && leo.sprite != 4) {
		leo.sprite = 5;
		leo.col += leo.cdel;
	}
	if(BUTTON_PRESSED(BUTTON_RIGHT) && leo.sprite != 5) {
		leo.sprite = 4;
		leo.col += leo.cdel;
	}
}

void updateRaceLeo() {
	if(BUTTON_PRESSED(BUTTON_LEFT) && leo.sprite != 2) {
		leo.sprite = 3;
		leo.col += leo.cdel;
		hOff++;
	} else if(BUTTON_PRESSED(BUTTON_RIGHT) && leo.sprite != 3) {
		leo.sprite = 2;
		leo.col += leo.cdel;
		hOff++;
	} else {
		leo.sprite = 0;
		leo.col -= leo.cdel;
	}

	if(leo.col <= 0) {
		loser = 1;
	}

}

//YAS BEYOTCH
void updateSteve() {
	steve.aniCounter++;
	steve.cdel += steve.speed;
	if (steve.col + steve.cdel > 0) {
		steve.col += steve.cdel;
	}

	if(timer%213 == 0) { //time to accelerate
		steve.cdel = -SHIFTUP(6);
	}

	if(SHIFTDOWN(steve.col) >= startCol) {
		steve.col = SHIFTUP(startCol);
		steve.cdel = 2;
	}

	if(steve.aniCounter % 7 == 0) {
		if(steve.sprite == 4) {
			steve.sprite = 5;
		} else {
			steve.sprite = 4;
		}
	}

}