
//{{BLOCK(hollywood)

//======================================================================
//
//	hollywood, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 172 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 5504 + 2048 = 8064
//
//	Time-stamp: 2017-12-03, 11:34:52
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_HOLLYWOOD_H
#define GRIT_HOLLYWOOD_H

#define hollywoodTilesLen 5504
extern const unsigned short hollywoodTiles[2752];

#define hollywoodMapLen 2048
extern const unsigned short hollywoodMap[1024];

#define hollywoodPalLen 512
extern const unsigned short hollywoodPal[256];

#endif // GRIT_HOLLYWOOD_H

//}}BLOCK(hollywood)
