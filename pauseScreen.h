
//{{BLOCK(pauseScreen)

//======================================================================
//
//	pauseScreen, 256x256@8, 
//	+ palette 256 entries, not compressed
//	+ 569 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 36416 + 2048 = 38976
//
//	Time-stamp: 2017-11-21, 11:03:08
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_PAUSESCREEN_H
#define GRIT_PAUSESCREEN_H

#define pauseScreenTilesLen 36416
extern const unsigned short pauseScreenTiles[18208];

#define pauseScreenMapLen 2048
extern const unsigned short pauseScreenMap[1024];

#define pauseScreenPalLen 512
extern const unsigned short pauseScreenPal[256];

#endif // GRIT_PAUSESCREEN_H

//}}BLOCK(pauseScreen)
