int lifeCount;
int timer;
int countDown;
int level;
int timeRemain;
//special cheat accessed if bonus 2 is won
int isMeryl;

int notIntrod;

// Background offsets
extern unsigned short hOff;
extern unsigned short vOff;

#define SHIFTUP(i) ((i) << 8)
#define SHIFTDOWN(i) ((i) >> 8)
#define SCREENHEIGHT 160
#define SCREENWIDTH 240
#define FANCOUNT 10

typedef struct
{
    int row;
	int col;
	int size;
	int rdel;
	int cdel;
	int speed;

	int racc;
	int cacc;
	int maxHSpeed;
	int maxVSpeed;
	int stopRange;
	int isJumping;

	int isaCheat;
	int anistate;
    int active;
    int index;
    int sprite;
    int aniCounter;
} LEO;


typedef struct {
	int row;
	int col;
    int cdel;
    int eager;
	int width;
    int height;
    int anistate;
    int sprite;
    int active;
    int index;
    int aniCounter;
    int goingLeft;
    int minCol;
} FAN;

typedef struct {
	int row;
	int col;
	int cdel;
	int width;
    int height;
    int sprite;
    int numFrames;
    int anistate;
    int index;
    int active;
} PAP;

typedef struct {
	int row;
	int col;
	int height;
	int width;
	int active;
	int index;
	int anistate;
	int sprite;
} LIVES;

typedef struct {
	int row;
	int col;
    int cdel;
	int width;
    int height;
    int anistate;
    int sprite;
    int active;
    int index;
    int numFrames;
    int aniCounter;
} AWARD;


// Prototypes
void initGame();
void updateGame();
void drawGame();
void initPlayer();
void updatePlayer();
void drawPlayer();
int collisionCheck();
void initFans();
void drawFans();
void updateFans();
void initPaps();
void drawPaps();
void updatePaps1();
void updatePaps2();
void initLives();
void drawLives(LIVES* life);
void initAwards();
void drawAwards();
void updateAwards();
void flicker();
void drawScore(int place, int num);