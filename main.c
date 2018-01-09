/* For the first milestone, I got the player and backgrounds moving first. 
	Hit A to jump.
	Hit the left and right arrow keys to speed up (go right) and slow down (go left)
	The cheat (Hit START and B at once) is the "save the planet" sign and the paps/fans have no effect on you.
	If you unlock the Meryl cheat, then in Level 3 all the awards will go to you.


	The gameplay:
		-LEVEL 1: Start with one life [persona]. avoid the paps for 30ish seconds. Jump on them if you want.
		-Qualuude Bonus: Hit the L+R buttons rapidly and get to the car in like 6 seconds. 
				  Dont wanna play? Hit SELECT.
				  If you win, you get 5 seconds off of Level 2. If you lose, that's fine.
		-LEVEL 2: [gain a life cause you conquered "poise"]
				  Now there are fans and paps. Avoid both but dont touch the fans or you'll lose a life. Also, fans move.
				  Survive for 30ish seconds as well.
		-Race Steve Bonus: Hit the L+R buttons rapidly and beat That actor who played Steve Jobs.
				  Dont wanna play? Hit SELECT.
				  Be ahead of him in 20 seconds and you unlock the Meryl cheat. If you lose, that's fine.
		-LEVEL 3: [gain a life cause you conquered "personality"]
				  Same rules and people as before but now you have to get awards. Get 25 awards to win! 


	Bugs:
		The fan pooling isn't actually random.

	Extra Credit: [CTRL+F YAS BEYOTCH to find code]
		Art is mostly mine. Obviously memes are just me putting text over the struggle.
		The model movement was fun and stalkerish. Go to game.h
		Bonus rounds in between levels. All of bonus.h
		Two cheats. Go to game.h
		So Steve speeds up and slows down and that's cool.
		Continuity of the story.

*/

#include <stdlib.h>
#include <stdio.h>
#include "myLib.h"
#include "game.h"
#include "bonus.h"
#include "soundLib.h"

//game setting
#include "redcarpet.h"
#include "hollywood.h"
#include "spritesheet.h"

//screens
#include "startScreen.h"
#include "pauseScreen.h"
#include "winScreen.h"
#include "loseScreen.h"
#include "instructions.h"
#include "level2.h"
#include "level3.h"
#include "steveBG.h"
#include "qualude.h"
#include "qualudeBG.h"
#include "bonuswin1.h"
#include "bonuswin2.h"
#include "bonuslose.h"

//musica
#include "gameSong.h"
#include "startSong.h"
#include "instructionsSong.h"
#include "loseSong.h"
#include "winSong.h"
SOUND soundA;
SOUND soundB;


extern int notIntrod;

unsigned short buttons;
unsigned short oldButtons;

// Horizontal Offset
unsigned short hOff = 0;
unsigned short vOff;

// States
void goToStart();
void start();
void goToGame();
void game();
void goToPause();
void pause();
void goToWin();
void win();
void goToLose();
void lose();
void goToInstructions();
void instructions();
void goToLevel2();
void level2();
void goToLevel3();
void level3();
void goToBonus1();
void bonus1();
void goToBonus2();
void bonus2();
void goToBonus1Intro();
void goToBonus2Intro();
void goToBonusWin1();
void goToBonusWin2();
void goToBonusLose();
void enterBonus1();
void enterBonus2();
void bonusWin1();
void bonusWin2();
void bonusLose();

enum {START, GAME, PAUSE, WIN, LOSE, INSTRUCTIONS, LEVEL2, LEVEL3, BONUS1, BONUS2, BONUS1INTRO, BONUS2INTRO, BONUSWIN1, BONUSWIN2, BONUSLOSE};
int state;
int currentInstruction = 0;

// OAM Buffer
OBJ_ATTR shadowOAM[128];


int main() {
	goToStart();

	setupSound();
    setupInterrupts();
    playSoundA(startSong, STARTSONGLEN, STARTSONGFREQ, 1);

	while(1) {

        // Update button variables
        oldButtons = buttons;
        buttons = BUTTONS;
                
        // State Machine
        switch(state) {

            case START:
                start();
                break;
            case GAME:
                game();
                break;
            case PAUSE:
                pause();
                break;
            case WIN:
                win();
                break;
            case LOSE:
                lose();
                break;
            case INSTRUCTIONS:
            	instructions();
            	break;
            case LEVEL2:
                level2();
                break;
            case LEVEL3:
                level3();
                break;
            case BONUS1:
                bonus1();
                break;
            case BONUS2:
                bonus2();
                break;
            case BONUS1INTRO:
                enterBonus1();
                break;
            case BONUS2INTRO:
                enterBonus2();
                break;
            case BONUSWIN1:
                bonusWin1();
                break;
            case BONUSWIN2:
                bonusWin2();
                break;
            case BONUSLOSE:
            	bonusLose();
            	break;
        }       
    }
}

void goToStart() {
	waitForVBlank();

    // Load the backgrounds
    loadPalette(startScreenPal);
    DMANow(3, startScreenTiles, &CHARBLOCK[0], startScreenTilesLen/2);
    DMANow(3, startScreenMap, &SCREENBLOCK[31], startScreenMapLen/2);

    // Set up and show the background
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_8BPP;
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    state = START;
}

void start() {
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_START)) {
    	level = 1;
    	lifeCount = 1;
    	timeRemain = 30;
    	stopSound();
        initGame();
        
        goToGame();
        playSoundA(gameSong, GAMESONGLEN, GAMESONGFREQ, 1);
		
    } 
    if(BUTTON_PRESSED(BUTTON_RIGHT)) {
    	level = 3;
    	goToBonus2();
    }
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
    	stopSound();
    	goToInstructions();
    	playSoundA(instructionsSong, INSTRUCTIONSSONGLEN, INSTRUCTIONSSONGFREQ, 1);
    }
}

void goToInstructions() {
	REG_DISPCTL = MODE4 | BG2_ENABLE;
    loadPalette(instructionsPal);
    currentInstruction = 0;
    state = INSTRUCTIONS;
}

void instructions() {
	DMANow(3, instructionsBitmap + ((240 * 160) / 2) * currentInstruction, videoBuffer, ((240 * 160)/2));
    flipPage();
    waitForVBlank();

    if (BUTTON_PRESSED(BUTTON_RIGHT)) {
        if (currentInstruction < 2) {
            currentInstruction++;
        }
    }

    if (BUTTON_PRESSED(BUTTON_START)) {
        stopSound();
        level = 1;
        lifeCount = 1;
        initGame();
        
        goToGame();
        playSoundA(gameSong, GAMESONGLEN, GAMESONGFREQ, 1);
    }

    if (BUTTON_PRESSED(BUTTON_SELECT)) {
        stopSound();
        fillScreen4(0);
        playSoundA(startSong, STARTSONGLEN, STARTSONGFREQ, 1);
        goToStart();
    }
}


void goToGame() {
	waitForVBlank();
    
    loadPalette(redcarpetPal);

    DMANow(3, hollywoodTiles, &CHARBLOCK[0], hollywoodTilesLen/2);
    DMANow(3, hollywoodMap, &SCREENBLOCK[30], hollywoodMapLen/2);
    DMANow(3, redcarpetTiles, &CHARBLOCK[2], redcarpetTilesLen/2);
    DMANow(3, redcarpetMap, &SCREENBLOCK[27], redcarpetMapLen/2);
    REG_BG1CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(30) | BG_SIZE_SMALL; 
    REG_BG0CNT = BG_CHARBLOCK(2) | BG_SCREENBLOCK(27) | BG_SIZE_SMALL;

    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;

    DMANow(3, spritesheetPal, SPRITEPALETTE, 256);
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen/2);
    hideSprites();
	DMANow(3, shadowOAM, OAM, 128*4);
    REG_DISPCTL =  MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;


    
    state = GAME;
}

void game() {
	hOff++;

	waitForVBlank();

	REG_BG0HOFF = hOff;
	REG_BG1HOFF = (hOff / 2);

	updateGame();
	drawGame();

	
    if (BUTTON_PRESSED(BUTTON_SELECT)) {
    	pauseSound();
        goToPause();
    } else if (level == 2 && notIntrod) {
    	goToBonus1Intro();
    } else if (level == 3 && notIntrod) {
    	goToBonus2Intro();
    } else if (level == 4 && notIntrod) {
    	stopSound();
    	goToWin();
    	playSoundA(winSong, WINSONGLEN, WINSONGFREQ, 1);
     } else if (lifeCount <= 0) {
    	stopSound();
    	goToLose();
    	playSoundA(loseSong, LOSESONGLEN, LOSESONGFREQ, 1);
    }

}

void goToPause() {
    waitForVBlank();

    // Load the background
    loadPalette(pauseScreenPal);
    DMANow(3, pauseScreenTiles, &CHARBLOCK[0], pauseScreenTilesLen/2);
    DMANow(3, pauseScreenMap, &SCREENBLOCK[31], pauseScreenMapLen/2);

    // Set up and show the background
    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_8BPP;


    state = PAUSE;
}

void pause() {
	REG_BG0HOFF = 0;
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {
    	unpauseSound();
        goToGame();
    }
    else if (BUTTON_PRESSED(BUTTON_SELECT)) {
    	stopSound();
        goToStart();
        playSoundA(startSong, STARTSONGLEN, STARTSONGFREQ, 1);
    }
}

void goToLose() {
    waitForVBlank();

    loadPalette(loseScreenPal);
    DMANow(3, loseScreenTiles, &CHARBLOCK[0], loseScreenTilesLen/2);
    DMANow(3, loseScreenMap, &SCREENBLOCK[31], loseScreenMapLen/2);

    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_8BPP;
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    state = LOSE;

}

void lose() {
    waitForVBlank();

    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {
    	stopSound();
        goToStart();
        playSoundA(startSong, STARTSONGLEN, STARTSONGFREQ, 1);
    }
    if(BUTTON_PRESSED(BUTTON_SELECT)) {
    	stopSound();
    	level = 1;
    	lifeCount = 1;
    	initGame();
    	goToGame();
    }
}

void goToWin() {
    waitForVBlank();

    loadPalette(winScreenPal);
    DMANow(3, winScreenTiles, &CHARBLOCK[0], winScreenTilesLen/2);
    DMANow(3, winScreenMap, &SCREENBLOCK[31], winScreenMapLen/2);

    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_8BPP;
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    state = WIN;
}

void win() {
    waitForVBlank();
	notIntrod = 0;
    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {
    	stopSound();
        goToStart();
        playSoundA(startSong, STARTSONGLEN, STARTSONGFREQ, 1);
    }
}

void goToLevel2() {
    waitForVBlank();

    loadPalette(level2Pal);
    DMANow(3,level2Tiles, &CHARBLOCK[0], level2TilesLen/2);
    DMANow(3, level2Map, &SCREENBLOCK[31], level2MapLen/2);

    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_8BPP;
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    state = LEVEL2;
}

void level2() {
    waitForVBlank();
	notIntrod = 0;
    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {
    	lifeCount++;
        initGame();
        goToGame();
        playSoundA(gameSong, GAMESONGLEN, GAMESONGFREQ, 1);
    }
}

void goToLevel3() {
    waitForVBlank();

    loadPalette(level3Pal);
    DMANow(3, level3Tiles, &CHARBLOCK[0], level3TilesLen/2);
    DMANow(3, level3Map, &SCREENBLOCK[31], level3MapLen/2);

    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_8BPP;
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    state = LEVEL3;
}

void level3() {
    waitForVBlank();
	notIntrod = 0;
    // State transitions
    if (BUTTON_PRESSED(BUTTON_START)) {
    	lifeCount++;
        initGame();
        goToGame();
        playSoundA(gameSong, GAMESONGLEN, GAMESONGFREQ, 1);
    }
}


//////////////////////////////bonuses//////////////////////////////////////////////////////

void goToBonus1Intro() {
    waitForVBlank();

    loadPalette(steveBGPal);
    DMANow(3, steveBGTiles, &CHARBLOCK[0], steveBGTilesLen/2);
    DMANow(3, steveBGMap, &SCREENBLOCK[31], steveBGMapLen/2);

    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_8BPP;
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    state = BONUS1INTRO;
}

void enterBonus1() {
	waitForVBlank();

	if(BUTTON_PRESSED(BUTTON_START)) {
		initBonus();
		goToBonus1();
	}
	if(BUTTON_PRESSED(BUTTON_SELECT)) {
		timeRemain = 30;
		goToLevel2();
	}
}

void goToBonus2Intro() {
    waitForVBlank();

    loadPalette(qualudeBGPal);
    DMANow(3, qualudeBGTiles, &CHARBLOCK[0], qualudeBGTilesLen/2);
    DMANow(3, qualudeBGMap, &SCREENBLOCK[31], qualudeBGMapLen/2);

    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_8BPP;
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    state = BONUS2INTRO;
}

void enterBonus2() {
	waitForVBlank();

	if(BUTTON_PRESSED(BUTTON_START)) {
		initBonus();
		goToBonus2();
	}
	if(BUTTON_PRESSED(BUTTON_SELECT)) {
		goToLevel3();
	}
}

///////actual bonuses

void goToBonus1() { //Steve Jobs race
	waitForVBlank();
    
    loadPalette(redcarpetPal);

    DMANow(3, hollywoodTiles, &CHARBLOCK[0], hollywoodTilesLen/2);
    DMANow(3, hollywoodMap, &SCREENBLOCK[30], hollywoodMapLen/2);
    DMANow(3, redcarpetTiles, &CHARBLOCK[2], redcarpetTilesLen/2);
    DMANow(3, redcarpetMap, &SCREENBLOCK[27], redcarpetMapLen/2);
    REG_BG1CNT = BG_CHARBLOCK(0) | BG_SCREENBLOCK(30) | BG_SIZE_SMALL; 
    REG_BG0CNT = BG_CHARBLOCK(2) | BG_SCREENBLOCK(27) | BG_SIZE_SMALL;

    REG_BG0HOFF = hOff;
    REG_BG0VOFF = vOff;

    DMANow(3, spritesheetPal, SPRITEPALETTE, 256);
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen/2);
    hideSprites();
	DMANow(3, shadowOAM, OAM, 128*4);
    REG_DISPCTL =  MODE0 | BG0_ENABLE | BG1_ENABLE | SPRITE_ENABLE;

    state = BONUS1;
}

void bonus1() { //steve
	hOff++;
	waitForVBlank();
	REG_BG0HOFF = hOff;
	REG_BG1HOFF = (hOff / 2);
	updateBonus();
	drawBonus();

	if(winner) {
		timeRemain = 25;
		goToBonusWin1();
	}
	if(loser) {
		timeRemain = 30;
		goToBonusLose();
	}
}

void goToBonus2() { //qualuude method acting
	waitForVBlank();

    loadPalette(qualudePal);
    DMANow(3, qualudeTiles, &CHARBLOCK[0], qualudeTilesLen/2);
    DMANow(3, qualudeMap, &SCREENBLOCK[31], qualudeMapLen/2);

    REG_DISPCTL = MODE0 | BG0_ENABLE | SPRITE_ENABLE;
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_4BPP;

    DMANow(3, spritesheetPal, SPRITEPALETTE, 256);
    DMANow(3, spritesheetTiles, &CHARBLOCK[4], spritesheetTilesLen/2);
    hideSprites();
	DMANow(3, shadowOAM, OAM, 128*4);

	state = BONUS2;
}

void bonus2() {
	waitForVBlank();
	updateBonus();
	drawBonus();

	if(winner == 1) {
		goToBonusWin2();
		isMeryl = 1;
	}
	if(loser == 1) {
		goToBonusLose();
		isMeryl = 0;
	}
}

/////bonus screens//////////////////
void goToBonusWin1() {
	waitForVBlank();

	loadPalette(bonuswin1Pal);
    DMANow(3, bonuswin1Tiles, &CHARBLOCK[0], bonuswin1TilesLen/2);
    DMANow(3, bonuswin1Map, &SCREENBLOCK[31], bonuswin1MapLen/2);

    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_8BPP;
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    state = BONUSWIN1;
}

void bonusWin1() {
	waitForVBlank();

	if(BUTTON_PRESSED(BUTTON_START)) {
		goToLevel2();
	}
}

void goToBonusWin2() {
	waitForVBlank();

	loadPalette(bonuswin2Pal);
    DMANow(3, bonuswin2Tiles, &CHARBLOCK[0], bonuswin2TilesLen/2);
    DMANow(3, bonuswin2Map, &SCREENBLOCK[31], bonuswin2MapLen/2);

    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_8BPP;
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    state = BONUSWIN2;
}

void bonusWin2() {
	waitForVBlank();
	if(BUTTON_PRESSED(BUTTON_START)) {
		goToLevel3();
	}
}

void goToBonusLose() {
	waitForVBlank();

	loadPalette(bonuslosePal);
    DMANow(3, bonusloseTiles, &CHARBLOCK[0], bonusloseTilesLen/2);
    DMANow(3, bonusloseMap, &SCREENBLOCK[31], bonusloseMapLen/2);

    REG_DISPCTL = MODE0 | BG0_ENABLE;
    REG_BG0CNT = BG_SIZE_SMALL | BG_CHARBLOCK(0) | BG_SCREENBLOCK(31) | BG_8BPP;
    REG_BG0HOFF = 0;
    REG_BG0VOFF = 0;

    state = BONUSLOSE;
}

void bonusLose() {
	waitForVBlank();
	if(BUTTON_PRESSED(BUTTON_START)) {
		if(level == 2) {
			goToLevel2();
		} else {
			goToLevel3();
		}
		stopSound();
	}
}

