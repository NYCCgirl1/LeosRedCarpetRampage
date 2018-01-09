
//{{BLOCK(qualude)

//======================================================================
//
//	qualude, 256x256@4, 
//	+ palette 256 entries, not compressed
//	+ 315 tiles (t|f|p reduced) not compressed
//	+ regular map (in SBBs), not compressed, 32x32 
//	Total size: 512 + 10080 + 2048 = 12640
//
//	Time-stamp: 2017-12-05, 21:35:37
//	Exported by Cearn's GBA Image Transmogrifier, v0.8.3
//	( http://www.coranac.com/projects/#grit )
//
//======================================================================

#ifndef GRIT_QUALUDE_H
#define GRIT_QUALUDE_H

#define qualudeTilesLen 10080
extern const unsigned short qualudeTiles[5040];

#define qualudeMapLen 2048
extern const unsigned short qualudeMap[1024];

#define qualudePalLen 512
extern const unsigned short qualudePal[256];

#endif // GRIT_QUALUDE_H

//}}BLOCK(qualude)
