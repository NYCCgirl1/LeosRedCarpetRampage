
//{{BLOCK(loseScreen)

//======================================================================
//
//	loseScreen, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 579 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 37056 + 2048 = 39616
//
//	Time-stamp: 2017-11-20, 15:57:26
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_LOSESCREEN_H
#define GRIT_LOSESCREEN_H

#define loseScreenTilesLen 37056
extern const unsigned short loseScreenTiles[18528];

#define loseScreenMapLen 2048
extern const unsigned short loseScreenMap[1024];

#define loseScreenPalLen 512
extern const unsigned short loseScreenPal[256];

#endif // GRIT_LOSESCREEN_H

//}}BLOCK(loseScreen)
